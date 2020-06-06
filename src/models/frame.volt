// Copyright 2020-2023, Collabora, Ltd.
// SPDX-License-Identifier: MIT OR Apache-2.0 OR BSL-1.0

module models.frame;

import types;


global verts: Vertex[] = [
	{24.9, 24.9, 1.1},
	{-24.9, 24.9, 1.1},
	{20.0, 20.0, 1.1},
	{-20.0, -20.0, 0.0},
	{-26.0, 26.0, 0.0},
	{-20.0, 20.0, 0.0},
	{-26.0, -26.0, 0.0},
	{20.0, -20.0, 0.0},
	{26.0, -26.0, 0.0},
	{20.0, 20.0, 0.0},
	{26.0, 26.0, 0.0},
	{20.0, -20.0, 1.1},
	{24.9, -24.9, 1.1},
	{-20.0, -20.0, 1.1},
	{-24.9, -24.9, 1.1},
	{-20.0, 20.0, 1.1},
];

global tris: Triangle[] = [
	{0, 1, 2},
	{3, 4, 5},
	{6, 4, 3},
	{7, 6, 3},
	{8, 6, 7},
	{9, 8, 7},
	{10, 8, 9},
	{5, 10, 9},
	{4, 10, 5},
	{11, 0, 2},
	{12, 0, 11},
	{13, 12, 11},
	{14, 12, 13},
	{15, 14, 13},
	{1, 14, 15},
	{2, 1, 15},
	{3, 5, 13},
	{2, 7, 11},
	{9, 7, 2},
	{10, 12, 8},
	{0, 12, 10},
	{11, 3, 13},
	{7, 3, 11},
	{15, 9, 2},
	{5, 9, 15},
	{8, 14, 6},
	{12, 14, 8},
	{0, 4, 1},
	{10, 4, 0},
	{1, 6, 14},
	{4, 6, 1},
	{13, 5, 15},
];
