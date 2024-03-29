// Copyright 2020-2023, Collabora, Ltd.
// SPDX-License-Identifier: MIT OR Apache-2.0 OR BSL-1.0

module models.side;

import types;


global verts: Vertex[] = [
	{-14.9, -20.8, 1.7},
	{-6.1, -20.8, 1.7},
	{-20.0, -20.0, 1.7},
	{23.8, 20.8, 1.7},
	{20.0, 20.0, 1.7},
	{23.8, 17.0, 1.7},
	{20.8, 20.8, 1.7},
	{20.8, -17.0, 1.7},
	{20.8, -4.0, 1.7},
	{20.0, -20.0, 1.7},
	{20.8, -20.8, 1.7},
	{14.9, -20.8, 1.7},
	{6.1, -20.8, 1.7},
	{20.8, 17.0, 1.7},
	{-20.8, -20.8, 1.7},
	{-20.0, 20.0, 1.7},
	{-20.8, -14.9, 1.7},
	{-20.8, -6.1, 1.7},
	{-20.8, 6.1, 1.7},
	{-20.8, 14.9, 1.7},
	{-20.8, 20.8, 1.7},
	{-14.9, 20.8, 1.7},
	{5.1, 24.8, 1.1},
	{5.1, 21.8, 1.1},
	{5.1, 24.8, 3.8},
	{24.8, 5.0, 3.8},
	{21.8, 5.0, 1.1},
	{21.8, 5.0, 3.8},
	{24.8, 5.0, 1.1},
	{-21.8, -15.9, 3.8},
	{-21.8, -21.8, 1.1},
	{-21.8, -21.8, 3.8},
	{-21.8, -15.9, 1.1},
	{15.9, 24.8, 3.8},
	{15.9, 24.8, 1.1},
	{-5.1, 24.8, 3.8},
	{-15.9, 24.8, 1.1},
	{-15.9, 24.8, 3.8},
	{-5.1, 24.8, 1.1},
	{5.1, 21.8, 3.8},
	{-6.1, 20.8, 1.7},
	{21.8, -5.0, 3.8},
	{24.8, -5.0, 1.1},
	{24.8, -5.0, 3.8},
	{21.8, -5.0, 1.1},
	{24.8, 21.8, 3.8},
	{15.9, 21.8, 1.1},
	{15.9, 21.8, 3.8},
	{24.8, 21.8, 1.1},
	{20.8, 4.0, 1.7},
	{23.8, -4.0, 1.7},
	{23.8, 4.0, 1.7},
	{-5.1, 21.8, 1.1},
	{-20.0, 20.0, 1.1},
	{20.0, -20.0, 1.1},
	{20.0, 20.0, 1.1},
	{24.8, 16.0, 1.1},
	{21.8, 16.0, 1.1},
	{21.8, 16.0, 3.8},
	{-15.9, 21.8, 1.1},
	{-21.8, 21.8, 1.1},
	{-20.0, -20.0, 1.1},
	{-21.8, 15.9, 1.1},
	{-21.8, 5.1, 1.1},
	{-21.8, -5.1, 1.1},
	{-23.8, -6.1, 1.7},
	{6.1, 20.8, 1.7},
	{14.9, 20.8, 1.7},
	{14.9, 23.8, 1.7},
	{6.1, 23.8, 1.7},
	{-6.1, 23.8, 1.7},
	{-14.9, 23.8, 1.7},
	{-23.8, 14.9, 1.7},
	{-23.8, 6.1, 1.7},
	{14.9, 23.8, 3.8},
	{-23.8, -14.9, 1.7},
	{-14.9, -23.8, 1.7},
	{-6.1, -23.8, 1.7},
	{6.1, -23.8, 1.7},
	{23.8, -17.0, 1.7},
	{14.9, -23.8, 1.7},
	{23.8, -20.8, 1.7},
	{24.8, 16.0, 3.8},
	{14.9, -20.8, 3.8},
	{24.8, -21.8, 3.8},
	{20.8, -20.8, 3.8},
	{23.8, -4.0, 3.8},
	{20.8, -4.0, 3.8},
	{21.8, -16.0, 3.8},
	{20.8, -17.0, 3.8},
	{24.8, -16.0, 3.8},
	{23.8, -17.0, 3.8},
	{23.8, -20.8, 3.8},
	{23.8, 4.0, 3.8},
	{15.9, -21.8, 3.8},
	{14.9, -23.8, 3.8},
	{15.9, -24.8, 3.8},
	{6.1, -23.8, 3.8},
	{5.1, -24.8, 3.8},
	{6.1, -20.8, 3.8},
	{5.1, -21.8, 3.8},
	{-6.1, -20.8, 3.8},
	{-5.1, -21.8, 3.8},
	{23.8, 20.8, 3.8},
	{-15.9, -24.8, 3.8},
	{-5.1, -24.8, 1.1},
	{-5.1, -24.8, 3.8},
	{-15.9, -24.8, 1.1},
	{15.9, -24.8, 1.1},
	{5.1, -24.8, 1.1},
	{14.9, 20.8, 3.8},
	{20.8, 20.8, 3.8},
	{-6.1, -23.8, 3.8},
	{23.8, 17.0, 3.8},
	{20.8, 17.0, 3.8},
	{20.8, 4.0, 3.8},
	{-15.9, 21.8, 3.8},
	{-14.9, 23.8, 3.8},
	{-23.8, 14.9, 3.8},
	{-24.8, 5.1, 3.8},
	{-23.8, 6.1, 3.8},
	{-24.8, 15.9, 3.8},
	{-20.8, 14.9, 3.8},
	{-21.8, 15.9, 3.8},
	{-20.8, 20.8, 3.8},
	{-21.8, 21.8, 3.8},
	{-14.9, 20.8, 3.8},
	{-21.8, 5.1, 3.8},
	{-6.1, 23.8, 3.8},
	{-6.1, 20.8, 3.8},
	{-5.1, 21.8, 3.8},
	{6.1, 20.8, 3.8},
	{6.1, 23.8, 3.8},
	{-23.8, -14.9, 3.8},
	{-20.8, -14.9, 3.8},
	{-14.9, -23.8, 3.8},
	{-14.9, -20.8, 3.8},
	{-15.9, -21.8, 3.8},
	{-20.8, -20.8, 3.8},
	{-15.9, -21.8, 1.1},
	{-24.8, -15.9, 3.8},
	{-23.8, -6.1, 3.8},
	{-24.8, -5.1, 3.8},
	{-20.8, -6.1, 3.8},
	{-21.8, -5.1, 3.8},
	{-20.8, 6.1, 3.8},
	{-24.8, 15.9, 1.1},
	{-24.8, 5.1, 1.1},
	{-24.8, -15.9, 1.1},
	{-24.8, -5.1, 1.1},
	{24.8, -16.0, 1.1},
	{21.8, -16.0, 1.1},
	{5.1, -21.8, 1.1},
	{15.9, -21.8, 1.1},
	{-5.1, -21.8, 1.1},
	{24.8, -21.8, 1.1},
];

global tris: Triangle[] = [
	{0, 1, 2},
	{3, 4, 5},
	{6, 4, 3},
	{7, 8, 4},
	{9, 7, 4},
	{10, 7, 9},
	{2, 10, 9},
	{11, 10, 2},
	{12, 11, 2},
	{1, 12, 2},
	{5, 4, 13},
	{14, 0, 2},
	{15, 14, 2},
	{16, 14, 15},
	{17, 16, 15},
	{18, 17, 15},
	{19, 18, 15},
	{20, 19, 15},
	{4, 20, 15},
	{21, 20, 4},
	{22, 23, 24},
	{25, 26, 27},
	{28, 26, 25},
	{29, 30, 31},
	{32, 30, 29},
	{33, 22, 24},
	{34, 22, 33},
	{35, 36, 37},
	{38, 36, 35},
	{24, 23, 39},
	{40, 21, 4},
	{41, 42, 43},
	{44, 42, 41},
	{45, 46, 47},
	{48, 46, 45},
	{49, 50, 51},
	{8, 50, 49},
	{4, 8, 49},
	{13, 4, 49},
	{52, 23, 53},
	{4, 54, 9},
	{55, 54, 4},
	{46, 22, 34},
	{55, 22, 46},
	{48, 55, 46},
	{56, 55, 48},
	{57, 55, 56},
	{23, 22, 55},
	{53, 23, 55},
	{57, 56, 58},
	{59, 52, 53},
	{60, 59, 53},
	{61, 60, 53},
	{62, 60, 61},
	{63, 62, 61},
	{64, 63, 61},
	{32, 64, 61},
	{30, 32, 61},
	{54, 30, 61},
	{65, 16, 17},
	{66, 40, 4},
	{67, 66, 4},
	{6, 67, 4},
	{68, 66, 67},
	{69, 66, 68},
	{70, 21, 40},
	{71, 21, 70},
	{72, 18, 19},
	{73, 18, 72},
	{33, 24, 74},
	{75, 16, 65},
	{76, 1, 0},
	{77, 1, 76},
	{78, 11, 12},
	{79, 7, 10},
	{80, 11, 78},
	{81, 79, 10},
	{58, 56, 82},
	{83, 84, 85},
	{41, 43, 86},
	{87, 41, 86},
	{88, 41, 87},
	{89, 88, 87},
	{90, 88, 89},
	{91, 90, 89},
	{84, 90, 91},
	{92, 84, 91},
	{85, 84, 92},
	{86, 43, 93},
	{94, 84, 83},
	{95, 94, 83},
	{96, 94, 95},
	{97, 96, 95},
	{98, 96, 97},
	{99, 98, 97},
	{100, 98, 99},
	{101, 100, 99},
	{102, 100, 101},
	{82, 45, 103},
	{104, 105, 106},
	{107, 105, 104},
	{98, 108, 96},
	{109, 108, 98},
	{110, 33, 74},
	{47, 33, 110},
	{111, 47, 110},
	{45, 47, 111},
	{103, 45, 111},
	{112, 102, 101},
	{113, 82, 103},
	{58, 82, 113},
	{114, 58, 113},
	{27, 58, 114},
	{115, 27, 114},
	{25, 27, 115},
	{93, 25, 115},
	{43, 25, 93},
	{37, 116, 117},
	{118, 119, 120},
	{121, 119, 118},
	{122, 121, 118},
	{123, 121, 122},
	{124, 123, 122},
	{125, 123, 124},
	{126, 125, 124},
	{116, 125, 126},
	{117, 116, 126},
	{119, 127, 120},
	{128, 37, 117},
	{35, 37, 128},
	{129, 35, 128},
	{130, 35, 129},
	{131, 130, 129},
	{39, 130, 131},
	{132, 39, 131},
	{24, 39, 132},
	{74, 24, 132},
	{133, 29, 134},
	{106, 102, 112},
	{135, 106, 112},
	{104, 106, 135},
	{136, 104, 135},
	{137, 104, 136},
	{138, 137, 136},
	{31, 137, 138},
	{134, 31, 138},
	{29, 31, 134},
	{139, 30, 54},
	{140, 29, 133},
	{141, 140, 133},
	{142, 140, 141},
	{143, 142, 141},
	{144, 142, 143},
	{145, 144, 143},
	{127, 144, 145},
	{120, 127, 145},
	{116, 60, 125},
	{146, 147, 121},
	{142, 148, 140},
	{149, 148, 142},
	{120, 72, 118},
	{73, 72, 120},
	{130, 38, 35},
	{52, 38, 130},
	{118, 19, 122},
	{72, 19, 118},
	{121, 147, 119},
	{59, 60, 116},
	{126, 71, 117},
	{21, 71, 126},
	{119, 63, 127},
	{147, 63, 119},
	{37, 59, 116},
	{36, 59, 37},
	{91, 81, 92},
	{79, 81, 91},
	{150, 151, 90},
	{95, 78, 97},
	{80, 78, 95},
	{103, 5, 113},
	{3, 5, 103},
	{112, 76, 135},
	{77, 76, 112},
	{97, 12, 99},
	{78, 12, 97},
	{90, 151, 88},
	{86, 8, 87},
	{141, 17, 143},
	{65, 17, 141},
	{89, 79, 91},
	{7, 79, 89},
	{31, 139, 137},
	{30, 139, 31},
	{133, 65, 141},
	{75, 65, 133},
	{60, 62, 125},
	{123, 146, 121},
	{62, 146, 123},
	{39, 52, 130},
	{23, 52, 39},
	{100, 109, 98},
	{152, 109, 100},
	{74, 67, 110},
	{68, 67, 74},
	{125, 62, 123},
	{76, 0, 135},
	{96, 153, 94},
	{108, 153, 96},
	{15, 55, 4},
	{53, 55, 15},
	{134, 75, 133},
	{16, 75, 134},
	{145, 73, 120},
	{18, 73, 145},
	{117, 70, 128},
	{2, 53, 15},
	{50, 8, 86},
	{140, 32, 29},
	{148, 32, 140},
	{9, 61, 2},
	{54, 61, 9},
	{83, 80, 95},
	{11, 80, 83},
	{128, 40, 129},
	{70, 40, 128},
	{3, 103, 6},
	{61, 53, 2},
	{106, 154, 102},
	{105, 154, 106},
	{88, 44, 41},
	{151, 44, 88},
	{131, 69, 132},
	{66, 69, 131},
	{135, 0, 136},
	{94, 155, 84},
	{146, 62, 147},
	{36, 52, 59},
	{38, 52, 36},
	{27, 57, 58},
	{26, 57, 27},
	{47, 34, 33},
	{46, 34, 47},
	{144, 149, 142},
	{64, 149, 144},
	{147, 62, 63},
	{153, 155, 94},
	{16, 138, 14},
	{134, 138, 16},
	{18, 143, 17},
	{145, 143, 18},
	{122, 20, 124},
	{19, 20, 122},
	{102, 152, 100},
	{154, 152, 102},
	{28, 44, 26},
	{154, 139, 54},
	{152, 154, 54},
	{153, 152, 54},
	{155, 153, 54},
	{151, 155, 54},
	{55, 151, 54},
	{44, 151, 55},
	{26, 44, 55},
	{57, 26, 55},
	{115, 51, 93},
	{42, 44, 28},
	{150, 155, 151},
	{108, 152, 153},
	{109, 152, 108},
	{105, 139, 154},
	{107, 139, 105},
	{148, 64, 32},
	{149, 64, 148},
	{115, 114, 49},
	{43, 28, 25},
	{42, 28, 43},
	{82, 48, 45},
	{56, 48, 82},
	{93, 50, 86},
	{51, 50, 93},
	{113, 13, 114},
	{5, 13, 113},
	{49, 114, 13},
	{155, 150, 84},
	{7, 87, 8},
	{89, 87, 7},
	{21, 124, 20},
	{126, 124, 21},
	{66, 129, 40},
	{131, 129, 66},
	{67, 111, 110},
	{103, 111, 67},
	{6, 103, 67},
	{11, 85, 10},
	{49, 51, 115},
	{127, 64, 144},
	{63, 64, 127},
	{132, 68, 74},
	{69, 68, 132},
	{137, 107, 104},
	{139, 107, 137},
	{10, 92, 81},
	{85, 92, 10},
	{71, 70, 117},
	{83, 85, 11},
	{1, 99, 12},
	{101, 99, 1},
	{136, 14, 138},
	{0, 14, 136},
	{101, 77, 112},
	{1, 77, 101},
	{84, 150, 90},
];
