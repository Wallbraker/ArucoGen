module types;



struct Vertex
{
	x, y, z: f64;
}

struct Triangle
{
	v1, v2, v3: u32;
}

struct Part
{
	start: u32;
	stop: u32;
}

struct Model
{
	verts: Vertex[];
	tris: Triangle[];
	parts: Part[];
}

fn v(x: f64, y: f64, z: f64) Vertex
{
	v: Vertex = {x, y, z};
	return v;
}

fn t(v1: u32, v2: u32, v3: u32) Triangle
{
	t: Triangle = {v1, v2, v3};
	return t;
}

fn m(verts: Vertex[], tris: Triangle[], parts: Part[]) Model
{
	m: Model = {verts, tris, parts};
	return m;
}
