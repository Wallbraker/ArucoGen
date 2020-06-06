// Copyright 2020-2023, Collabora, Ltd.
// SPDX-License-Identifier: MIT OR Apache-2.0 OR BSL-1.0

module main;

import core.exception;

import io = [watt.io, watt.io.streams];
import watt = [
	watt.io,
	watt.io.file,
	watt.text.string,
	watt.text.format,
	watt.text.sink];
import watt.text.string : startsWith;
import watt.math.floating;

import types;
import aruco;


fn log(str: string)
{
	io.output.writef("%s", str);
	io.output.flush();
}

fn logln(str: string)
{
	io.output.writefln("%s", str);
	io.output.flush();
}




struct VertexSink = mixin watt.SinkStruct!Vertex;
struct TriangleSink = mixin watt.SinkStruct!Triangle;
struct PartSink = mixin watt.SinkStruct!Part;


struct ModelMaker
{
public:
	indexMap: u32[Vertex];
	verts: VertexSink;
	tris: TriangleSink;
	parts: PartSink;
	start: u32;


public:
	fn addVertex(vert: Vertex) u32
	{
		ip := vert in indexMap;
		if (ip is null) {
			index := cast(u32)verts.length;
			verts.sink(vert);
			indexMap[vert] = index;
			return index;
		} else {
			return *ip;
		}
	}

	fn addTri(ref tri: Triangle)
	{
		tris.sink(tri);
	}

	fn addTri(v1: u32, v2: u32, v3: u32)
	{
		tris.sink(t(v1, v2, v3));
	}

	fn addModel(verts: Vertex[], tris: Triangle[])
	{
		indexMap := new u32[](verts.length);
		foreach (i, ref vert; verts) {
			indexMap[i] = this.addVertex(vert);
		}
		foreach (ref tri; tris) {
			this.addTri(indexMap[tri.v1], indexMap[tri.v2], indexMap[tri.v3]);
		}
	}

	fn switchPart()
	{
		part: Part = {start, cast(u32)tris.length - 1}; 
		parts.sink(part);
		this.start = cast(u32)tris.length;
	}

	fn makeModel() Model
	{
		return m(this.verts.toArray(), this.tris.toArray());
	}

	fn makeModelWithParts() ModelWithParts
	{
		this.switchPart();
		return mwp(this.verts.toArray(), this.tris.toArray(), this.parts.toArray());
	}
}


global cubeTris: immutable Triangle[12] = [
	{0, 1, 2},
	{0, 2, 3},
	{4, 5, 6},
	{4, 6, 7},
	{0, 4, 7},
	{0, 7, 1},
	{1, 7, 6},
	{1, 6, 2},
	{2, 6, 5},
	{2, 5, 3},
	{4, 0, 3},
	{4, 3, 5},
];


fn makeCube(ref mm: ModelMaker, x: f64, y: f64, z: f64, w: f64, d: f64, h: f64)
{
	verts: Vertex[8];
	verts[0] = v(x + w, y + d,     z);
	verts[1] = v(x + w,     y,     z);
	verts[2] = v(    x,     y,     z);
	verts[3] = v(    x, y + d,     z);
	verts[4] = v(x + w, y + d, z + h);
	verts[5] = v(    x, y + d, z + h);
	verts[6] = v(    x,     y, z + h);
	verts[7] = v(x + w,     y, z + h);

	mm.addModel(verts, cubeTris);
}

fn addAruco(ref mm: ModelMaker, white: bool, id: u32)
{
	size := 5.0;
	offset := size * -4.0;

	foreach (y; 0 .. 8) {
		foreach (x; 0 .. 8) {
			val := getAruco(x, y, id);
			if (white) {
				if (val) {
					mm.makeCube(size * x + offset, size * y + offset, 1.1, 5.0, 5.0, 0.6);
				} else {
					mm.makeCube(size * x + offset, size * y + offset, 0.0, 5.0, 5.0, 0.5);
				}
			} else {
				if (val) {
					mm.makeCube(size * x + offset, size * y + offset, 0.0, 5.0, 5.0, 1.1);
				}
			}
		}
	}
}

fn readI32(ifs: io.InputFileStream) i32
{
	data: char[4];
	ifs.read(data);
	return *cast(i32*)data.ptr;
}

fn readF32(ifs: io.InputFileStream) f32
{
	data: char[4];
	ifs.read(data);
	return *cast(f32*)data.ptr;
}

fn readVertex(ifs: io.InputFileStream) Vertex
{
	vert: Vertex = {ifs.readF32(), ifs.readF32(), ifs.readF32()};
	return vert;
}

fn skip2(ifs: io.InputFileStream)
{
	data: char[2];
	ifs.read(data);
}


fn loadStl(filename: string) Model
{
	mm: ModelMaker;
	ifs := new io.InputFileStream(filename);
	header: char[80];
	ifs.read(header);
	num := ifs.readI32();

	foreach (i; 0 .. num) {
		normal := ifs.readVertex();
		verts: Vertex[3];
		verts[0] = ifs.readVertex();
		verts[1] = ifs.readVertex();
		verts[2] = ifs.readVertex();
		i0 := mm.addVertex(verts[0]);
		i1 := mm.addVertex(verts[1]);
		i2 := mm.addVertex(verts[2]);
		ifs.skip2();

		if (i0 == i1 || i1 == i2 || i2 == i0) {
			logln("Zero size triangle!");
			continue;
		}

		mm.addTri(i0, i1, i2);
	}

	return mm.makeModel();
}

fn main(args: string[]) i32
{
	models: ModelWithParts[];
	ids: u32[] = [
		10,
		11,
		12,
		13,
		14,
		15,
	];

	frame := loadStl("/home/jakob/3D/aruco_mk2_frame.stl");
	top := loadStl("/home/jakob/3D/aruco_mk2_pattern_top.stl");
	side := loadStl("/home/jakob/3D/aruco_mk2_pattern_side.stl");

	foreach (i, id; ids) {
		mm: ModelMaker;
		mm.addModel(frame.verts, frame.tris);
		mm.addAruco(false, id);
		mm.switchPart();
		if (i < 2) {
			mm.addModel(top.verts, top.tris);
		} else {
			mm.addModel(side.verts, side.tris);
		}
		mm.addAruco(true, id);
		models ~= mm.makeModelWithParts();
	}

	of := new io.OutputFileStream("/home/jakob/3D/aaa-components/3D/3dmodel.model");
	of.write(ModelFileStart);
	foreach (i, ref mwp; models) {
		of.writef(ModelObjStart, i + 1);
		foreach (vert; mwp.model.verts) {
			of.write(new "     <vertex x=\"${vert.x}\" y=\"${vert.y}\" z=\"${vert.z}\" />\n");
		}
		of.write(ModelObjSwitch);
		foreach (tri; mwp.model.tris) {
			of.write(new "     <triangle v1=\"${tri.v1}\" v2=\"${tri.v2}\" v3=\"${tri.v3}\" />\n");
		}
		of.write(ModelObjEnd);
	}
	of.write(ModelBuild);
	foreach (i, ref model; models) {
		of.writefln("  <item objectid=\"%s\" transform=\"1 0 0 0 1 0 0 0 1 100 100 0\" printable=\"1\" />", i + 1);
	}
	of.write(ModeFileEnd);
	of.flush();
	of.close();

	io.output.flush();

	of = new io.OutputFileStream("/home/jakob/3D/aaa-components/Metadata/Slic3r_PE_model.config");
	of.write(ConfigFileStart);
	foreach (i, ref model; models) {
		of.writef(ConfigObjStart, i + 1, new "aruco_${ids[i]}");
		foreach (k, part; model.parts) {
			name := (k % 2 == 0) ? "black" : "white";
			extruder := (k % 2 == 0) ? 1 : 2;
			of.writef(ConfigObjVolume, part.start, part.stop, name, extruder);
		}
		of.writef(ConfigObjEnd);
	}
	of.write(ConfigFileEnd);
	of.flush();
	of.close();

	return 0;
}


enum ModelFileStart =
`<?xml version="1.0" encoding="UTF-8"?>
<model unit="millimeter" xml:lang="en-US" xmlns="http://schemas.microsoft.com/3dmanufacturing/core/2015/02" xmlns:slic3rpe="http://schemas.slic3r.org/3mf/2017/06">
 <metadata name="slic3rpe:Version3mf">1</metadata>
 <resources>
`;

enum ModelObjStart =
`  <object id="%s" type="model">
   <mesh>
    <vertices>
`;

enum ModelObjSwitch =
`    </vertices>
    <triangles>
`;

enum ModelObjEnd =
`    </triangles>
   </mesh>
  </object>
`;

enum ModelBuild =
` </resources>
 <build>
`;

enum ModeFileEnd = 
` </build>
</model>
`;


enum ConfigFileStart =
`<?xml version="1.0" encoding="UTF-8"?>
<config>
`;

enum ConfigObjStart =
` <object id="%s" instances_count="1">
  <metadata type="object" key="name" value="%s"/>
`;

enum ConfigObjVolume = 
`  <volume firstid="%s" lastid="%s">
   <metadata type="volume" key="name" value="%s"/>
   <metadata type="volume" key="volume_type" value="ModelPart"/>
   <metadata type="volume" key="matrix" value="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1"/>
   <metadata type="volume" key="extruder" value="%s"/>
  </volume>
`;

enum ConfigObjEnd =
` </object>
`;

enum ConfigFileEnd =
`</config>
`;
