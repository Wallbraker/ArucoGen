module main;

import core.exception;

import io = watt.io;
import watt = [watt.io, watt.io.file, watt.text.string, watt.text.format];
import watt.text.string : startsWith;
import watt.math.floating;

import types;
import models;

struct Model
{
	tris: Triangle[];
	verts: Vertex[];
}

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


enum Start =
`<?xml version="1.0" encoding="UTF-8"?>
<model unit="millimeter" xml:lang="en-US" xmlns="http://schemas.microsoft.com/3dmanufacturing/core/2015/02" xmlns:slic3rpe="http://schemas.slic3r.org/3mf/2017/06">
 <metadata name="slic3rpe:Version3mf">1</metadata>
 <resources>
`;

enum StartObj =
`  <object id="%s" type="model">
   <mesh>
    <vertices>
`;

enum Switch =
`    </vertices>
    <triangles>
`;

enum EndObj =
`    </triangles>
   </mesh>
  </object>
`;

enum EoF =
` </resources>
 <build>
  <item objectid="1" transform="1 0 0 0 1 0 0 0 1 100 100 0" printable="1" />
  <item objectid="2" transform="1 0 0 0 1 0 0 0 1 100 100 0" printable="1" />
  <item objectid="3" transform="1 0 0 0 1 0 0 0 1 100 100 0" printable="1" />
 </build>
</model>
`;


fn main(args: string[]) i32
{
	models: Model[3];
	models[0].tris = frame.tris;
	models[0].verts = frame.verts;
	models[1].tris = side.tris;
	models[1].verts = side.verts;
	models[2].tris = top.tris;
	models[2].verts = top.verts;

	log(Start);
	foreach (i, ref model; models) {
		log(watt.format(StartObj, i + 1));
		foreach (vert; model.verts) {
			logln(new "     <vertex x=\"${vert.x}\" y=\"${vert.y}\" z=\"${vert.z}\" />");
		}
		log(Switch);
		foreach (tri; model.tris) {
			logln(new "     <triangle v1=\"${tri.v1}\" v2=\"${tri.v2}\" v3=\"${tri.v3}\" />");
		}
		log(EndObj);
	}
	log(EoF);
	return 0;
}
