module (..., package.seeall)
library = {}

ACCEPTABLE_RACK_SIZES = {51, 52, 53, 54, 55, 56, 57, 58}

library[1] = {}
library[1][1]= {}
library[1][1][1] = {{x = 0, y = 0, sizeX = 3, sizeY = 3},
					{x = 3, y = 0, sizeX = 2, sizeY = 3},
					{x = 0, y = 3, sizeX = 4, sizeY = 2},
					{x = 4, y = 3, sizeX = 3, sizeY = 3},
					{x = 0, y = 5, sizeX = 4, sizeY = 2}}
library[1][1][2] = {{x = 0, y = 0, sizeX = 2, sizeY = 5},
					{x = 2, y = 0, sizeX = 3, sizeY = 4},
					{x = 0, y = 5, sizeX = 3, sizeY = 2},
					{x = 3, y = 4, sizeX = 2, sizeY = 3},
					{x = 5, y = 3, sizeX = 2, sizeY = 3}}
library[1][1][3] = {{x = 0, y = 0, sizeX = 2, sizeY = 4},
					{x = 2, y = 0, sizeX = 3, sizeY = 3},
					{x = 0, y = 4, sizeX = 3, sizeY = 3},
					{x = 3, y = 3, sizeX = 2, sizeY = 4},
					{x = 5, y = 3, sizeX = 2, sizeY = 3}}
library[1][2]= {}
library[1][2][1] = {{x = 15, y = 0, sizeX = 3, sizeY = 4},
					{x = 12, y = 2, sizeX = 3, sizeY = 3},
					{x = 16, y = 4, sizeX = 2, sizeY = 3},
					{x = 14, y = 5, sizeX = 2, sizeY = 3}}
library[1][2][2] = {{x = 15, y = 0, sizeX = 3, sizeY = 2},
					{x = 12, y = 2, sizeX = 4, sizeY = 3},
					{x = 16, y = 2, sizeX = 2, sizeY = 5},
					{x = 14, y = 5, sizeX = 2, sizeY = 3}}
library[1][2][3] = {{x = 15, y = 0, sizeX = 3, sizeY = 2},
					{x = 12, y = 2, sizeX = 2, sizeY = 3},
					{x = 14, y = 2, sizeX = 4, sizeY = 2},
					{x = 14, y = 4, sizeX = 2, sizeY = 4},
					{x = 16, y = 4, sizeX = 2, sizeY = 3}}
library[1][3]= {}
library[1][3][1] = {{x = 7, y = 0, sizeX = 4, sizeY = 2},
					{x = 7, y = 2, sizeX = 2, sizeY = 4},
					{x = 9, y = 2, sizeX = 3, sizeY = 2},
					{x = 9, y = 4, sizeX = 2, sizeY = 3}}
library[1][3][2] = {{x = 7, y = 0, sizeX = 4, sizeY = 2},
					{x = 7, y = 2, sizeX = 5, sizeY = 3},
					{x = 8, y = 5, sizeX = 3, sizeY = 2}}
library[1][3][3] = {{x = 7, y = 0, sizeX = 2, sizeY = 3},
					{x = 9, y = 0, sizeX = 2, sizeY = 3},
					{x = 7, y = 3, sizeX = 5, sizeY = 2},
					{x = 8, y = 5, sizeX = 3, sizeY = 2}}
library[1][4]= {}
library[1][4][1] = {{x = 2, y = 7, sizeX = 3, sizeY = 2},
					{x = 2, y = 9, sizeX = 4, sizeY = 2},
					{x = 0, y = 11, sizeX = 2, sizeY = 3},
					{x = 2, y = 11, sizeX = 4, sizeY = 2},
					{x = 2, y = 13, sizeX = 2, sizeY = 3},
					{x = 4, y = 13, sizeX = 3, sizeY = 2}}
library[1][4][2] = {{x = 2, y = 7, sizeX = 3, sizeY = 3},
					{x = 2, y = 10, sizeX = 2, sizeY = 6},
					{x = 4, y = 10, sizeX = 2, sizeY = 3},
					{x = 0, y = 11, sizeX = 2, sizeY = 3},
					{x = 4, y = 13, sizeX = 3, sizeY = 2}}
library[1][4][3] = {{x = 2, y = 7, sizeX = 3, sizeY = 3},
					{x = 2, y = 10, sizeX = 4, sizeY = 3},
					{x = 0, y = 11, sizeX = 2, sizeY = 3},
					{x = 2, y = 13, sizeX = 2, sizeY = 3},
					{x = 4, y = 13, sizeX = 3, sizeY = 2}}
library[1][5]= {}
library[1][5][1] = {{x = 8, y = 7, sizeX = 3, sizeY = 3},
					{x = 6, y = 9, sizeX = 2, sizeY = 3},
					{x = 8, y = 10, sizeX = 3, sizeY = 2},
					{x = 7, y = 12, sizeX = 3, sizeY = 5},
					{x = 10, y = 12, sizeX = 2, sizeY = 3}}
library[1][5][2] = {{x = 8, y = 7, sizeX = 3, sizeY = 4},
					{x = 6, y = 9, sizeX = 2, sizeY = 4},
					{x = 8, y = 11, sizeX = 2, sizeY = 3},
					{x = 10, y = 11, sizeX = 2, sizeY = 4},
					{x = 7, y = 14, sizeX = 3, sizeY = 3}}
library[1][5][3] = {{x = 8, y = 7, sizeX = 3, sizeY = 2},
					{x = 6, y = 9, sizeX = 2, sizeY = 4},
					{x = 8, y = 9, sizeX = 3, sizeY = 2},
					{x = 8, y = 11, sizeX = 4, sizeY = 2},
					{x = 7, y = 13, sizeX = 5, sizeY = 2},
					{x = 7, y = 15, sizeX = 3, sizeY = 2}}
library[1][6]= {}
library[1][6][1] = {{x = 5, y = 0, sizeX = 2, sizeY = 3},
					{x = 11, y = 0, sizeX = 4, sizeY = 2},
					{x = 0, y = 7, sizeX = 2, sizeY = 4},
					{x = 5, y = 6, sizeX = 3, sizeY = 3},
					{x = 11, y = 5, sizeX = 3, sizeY = 4},
					{x = 16, y = 7, sizeX = 2, sizeY = 3}}

library[2] = {}
library[2][1]= {}
library[2][1][1] = {{x = 0, y = 0, sizeX = 4, sizeY = 2},
					{x = 0, y = 2, sizeX = 3, sizeY = 4},
					{x = 3, y = 2, sizeX = 3, sizeY = 4},
					{x = 2, y = 6, sizeX = 3, sizeY = 2}}
library[2][1][2] = {{x = 0, y = 0, sizeX = 2, sizeY = 3},
					{x = 2, y = 0, sizeX = 2, sizeY = 6},
					{x = 0, y = 3, sizeX = 2, sizeY = 3},
					{x = 4, y = 2, sizeX = 2, sizeY = 4},
					{x = 2, y = 6, sizeX = 3, sizeY = 2}}
library[2][1][3] = {{x = 0, y = 0, sizeX = 4, sizeY = 3},
					{x = 0, y = 3, sizeX = 2, sizeY = 3},
					{x = 2, y = 3, sizeX = 2, sizeY = 5},
					{x = 4, y = 2, sizeX = 2, sizeY = 5}}
library[2][2]= {}
library[2][2][1] = {{x = 13, y = 0, sizeX = 2, sizeY = 3},
					{x = 15, y = 0, sizeX = 3, sizeY = 5},
					{x = 12, y = 3, sizeX = 3, sizeY = 3},
					{x = 13, y = 6, sizeX = 2, sizeY = 3}}
library[2][2][2] = {{x = 13, y = 0, sizeX = 3, sizeY = 3},
					{x = 16, y = 0, sizeX = 2, sizeY = 3},
					{x = 12, y = 3, sizeX = 6, sizeY = 2},
					{x = 13, y = 5, sizeX = 2, sizeY = 4}}
library[2][2][3] = {{x = 13, y = 0, sizeX = 3, sizeY = 3},
					{x = 16, y = 0, sizeX = 2, sizeY = 3},
					{x = 12, y = 3, sizeX = 3, sizeY = 3},
					{x = 15, y = 3, sizeX = 3, sizeY = 2},
					{x = 13, y = 6, sizeX = 2, sizeY = 3}}
library[2][3]= {}
library[2][3][1] = {{x = 7, y = 0, sizeX = 3, sizeY = 2},
					{x = 6, y = 2, sizeX = 4, sizeY = 3},
					{x = 6, y = 5, sizeX = 3, sizeY = 2},
					{x = 10, y = 3, sizeX = 2, sizeY = 3}}
library[2][3][2] = {{x = 7, y = 0, sizeX = 3, sizeY = 3},
					{x = 6, y = 3, sizeX = 2, sizeY = 4},
					{x = 8, y = 3, sizeX = 4, sizeY = 3}}
library[2][3][3] = {{x = 7, y = 0, sizeX = 3, sizeY = 2},
					{x = 6, y = 2, sizeX = 3, sizeY = 3},
					{x = 6, y = 5, sizeX = 3, sizeY = 2},
					{x = 9, y = 3, sizeX = 3, sizeY = 3}}
library[2][4]= {}
library[2][4][1] = {{x = 2, y = 8, sizeX = 3, sizeY = 4},
					{x = 5, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 11, sizeX = 2, sizeY = 4},
					{x = 2, y = 12, sizeX = 3, sizeY = 3}}
library[2][4][2] = {{x = 2, y = 8, sizeX = 3, sizeY = 2},
					{x = 2, y = 10, sizeX = 3, sizeY = 2},
					{x = 5, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 11, sizeX = 2, sizeY = 4},
					{x = 2, y = 12, sizeX = 3, sizeY = 3}}
library[2][4][3] = {{x = 2, y = 8, sizeX = 3, sizeY = 3},
					{x = 5, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 11, sizeX = 3, sizeY = 2},
					{x = 0, y = 13, sizeX = 3, sizeY = 2},
					{x = 3, y = 11, sizeX = 2, sizeY = 4}}
library[2][5]= {}
library[2][5][1] = {{x = 9, y = 6, sizeX = 2, sizeY = 3},
					{x = 7, y = 9, sizeX = 3, sizeY = 3},
					{x = 10, y = 10, sizeX = 3, sizeY = 2},
					{x = 5, y = 12, sizeX = 4, sizeY = 2},
					{x = 9, y = 12, sizeX = 2, sizeY = 3},
					{x = 7, y = 14, sizeX = 2, sizeY = 4}}
library[2][5][2] = {{x = 9, y = 6, sizeX = 2, sizeY = 4},
					{x = 7, y = 9, sizeX = 2, sizeY = 3},
					{x = 9, y = 10, sizeX = 4, sizeY = 2},
					{x = 5, y = 12, sizeX = 4, sizeY = 2},
					{x = 9, y = 12, sizeX = 2, sizeY = 3},
					{x = 7, y = 14, sizeX = 2, sizeY = 4}}
library[2][5][3] = {{x = 9, y = 6, sizeX = 2, sizeY = 3},
					{x = 7, y = 9, sizeX = 3, sizeY = 3},
					{x = 10, y = 10, sizeX = 3, sizeY = 2},
					{x = 5, y = 12, sizeX = 3, sizeY = 2},
					{x = 8, y = 12, sizeX = 3, sizeY = 3},
					{x = 7, y = 15, sizeX = 2, sizeY = 3}}
library[2][6]= {}
library[2][6][1] = {{x = 4, y = 0, sizeX = 3, sizeY = 2},
					{x = 10, y = 0, sizeX = 3, sizeY = 3},
					{x = 0, y = 6, sizeX = 2, sizeY = 5},
					{x = 5, y = 7, sizeX = 4, sizeY = 2},
					{x = 11, y = 6, sizeX = 2, sizeY = 4},
					{x = 15, y = 5, sizeX = 3, sizeY = 4}}

library[3] = {}
library[3][1]= {}
library[3][1][1] = {{x = 0, y = 0, sizeX = 2, sizeY = 3},
					{x = 2, y = 0, sizeX = 2, sizeY = 3},
					{x = 0, y = 3, sizeX = 2, sizeY = 3},
					{x = 2, y = 3, sizeX = 2, sizeY = 3},
					{x = 4, y = 4, sizeX = 2, sizeY = 3}}
library[3][1][2] = {{x = 0, y = 0, sizeX = 2, sizeY = 4},
					{x = 2, y = 0, sizeX = 2, sizeY = 4},
					{x = 0, y = 4, sizeX = 3, sizeY = 2},
					{x = 3, y = 4, sizeX = 3, sizeY = 3}}
library[3][1][3] = {{x = 0, y = 0, sizeX = 4, sizeY = 3},
					{x = 0, y = 3, sizeX = 2, sizeY = 3},
					{x = 2, y = 3, sizeX = 2, sizeY = 3},
					{x = 4, y = 4, sizeX = 2, sizeY = 3}}
library[3][2]= {}
library[3][2][1] = {{x = 13, y = 0, sizeX = 5, sizeY = 2},
					{x = 11, y = 2, sizeX = 3, sizeY = 2},
					{x = 14, y = 2, sizeX = 4, sizeY = 3},
					{x = 13, y = 5, sizeX = 3, sizeY = 2}}
library[3][2][2] = {{x = 13, y = 0, sizeX = 3, sizeY = 2},
					{x = 16, y = 0, sizeX = 2, sizeY = 5},
					{x = 11, y = 2, sizeX = 5, sizeY = 2},
					{x = 13, y = 4, sizeX = 3, sizeY = 3}}
library[3][2][3] = {{x = 13, y = 0, sizeX = 3, sizeY = 2},
					{x = 16, y = 0, sizeX = 2, sizeY = 5},
					{x = 11, y = 2, sizeX = 3, sizeY = 2},
					{x = 14, y = 2, sizeX = 2, sizeY = 3},
					{x = 13, y = 5, sizeX = 3, sizeY = 2}}
library[3][3]= {}
library[3][3][1] = {{x = 7, y = 0, sizeX = 3, sizeY = 2},
					{x = 7, y = 2, sizeX = 4, sizeY = 2},
					{x = 6, y = 4, sizeX = 3, sizeY = 3},
					{x = 9, y = 4, sizeX = 2, sizeY = 5},
					{x = 11, y = 4, sizeX = 2, sizeY = 3}}
library[3][3][2] = {{x = 7, y = 0, sizeX = 3, sizeY = 3},
					{x = 7, y = 3, sizeX = 4, sizeY = 2},
					{x = 6, y = 5, sizeX = 3, sizeY = 2},
					{x = 9, y = 5, sizeX = 2, sizeY = 4},
					{x = 11, y = 4, sizeX = 2, sizeY = 3}}
library[3][3][3] = {{x = 7, y = 0, sizeX = 3, sizeY = 2},
					{x = 7, y = 2, sizeX = 4, sizeY = 3},
					{x = 6, y = 5, sizeX = 3, sizeY = 2},
					{x = 9, y = 5, sizeX = 2, sizeY = 4},
					{x = 11, y = 4, sizeX = 2, sizeY = 3}}
library[3][4]= {}
library[3][4][1] = {{x = 3, y = 7, sizeX = 2, sizeY = 3},
					{x = 0, y = 10, sizeX = 2, sizeY = 5},
					{x = 2, y = 10, sizeX = 3, sizeY = 4},
					{x = 2, y = 14, sizeX = 2, sizeY = 3}}
library[3][4][2] = {{x = 3, y = 7, sizeX = 2, sizeY = 5},
					{x = 0, y = 10, sizeX = 3, sizeY = 2},
					{x = 0, y = 12, sizeX = 2, sizeY = 3},
					{x = 2, y = 12, sizeX = 3, sizeY = 2},
					{x = 2, y = 14, sizeX = 2, sizeY = 3}}
library[3][4][3] = {{x = 3, y = 7, sizeX = 2, sizeY = 4},
					{x = 0, y = 10, sizeX = 2, sizeY = 5},
					{x = 2, y = 11, sizeX = 3, sizeY = 2},
					{x = 2, y = 13, sizeX = 2, sizeY = 4}}
library[3][5]= {}
library[3][5][1] = {{x = 5, y = 9, sizeX = 3, sizeY = 5},
					{x = 8, y = 9, sizeX = 3, sizeY = 3},
					{x = 11, y = 10, sizeX = 2, sizeY = 3},
					{x = 8, y = 12, sizeX = 2, sizeY = 3},
					{x = 10, y = 13, sizeX = 3, sizeY = 2}}
library[3][5][2] = {{x = 5, y = 9, sizeX = 3, sizeY = 2},
					{x = 8, y = 9, sizeX = 3, sizeY = 2},
					{x = 5, y = 11, sizeX = 2, sizeY = 3},
					{x = 7, y = 11, sizeX = 4, sizeY = 2},
					{x = 11, y = 10, sizeX = 2, sizeY = 3},
					{x = 7, y = 13, sizeX = 3, sizeY = 2},
					{x = 10, y = 13, sizeX = 3, sizeY = 2}}
library[3][5][3] = {{x = 5, y = 9, sizeX = 3, sizeY = 2},
					{x = 8, y = 9, sizeX = 2, sizeY = 3},
					{x = 10, y = 10, sizeX = 3, sizeY = 2},
					{x = 5, y = 11, sizeX = 2, sizeY = 3},
					{x = 7, y = 12, sizeX = 2, sizeY = 3},
					{x = 9, y = 12, sizeX = 4, sizeY = 3}}
library[3][6]= {}
library[3][6][1] = {{x = 4, y = 0, sizeX = 3, sizeY = 4},
					{x = 10, y = 0, sizeX = 3, sizeY = 2},
					{x = 0, y = 6, sizeX = 3, sizeY = 4},
					{x = 5, y = 7, sizeX = 4, sizeY = 2},
					{x = 11, y = 7, sizeX = 3, sizeY = 3},
					{x = 16, y = 5, sizeX = 2, sizeY = 4}}

library[4] = {}
library[4][1]= {}
library[4][1][1] = {{x = 0, y = 0, sizeX = 3, sizeY = 2},
					{x = 3, y = 0, sizeX = 3, sizeY = 2},
					{x = 0, y = 2, sizeX = 3, sizeY = 2},
					{x = 3, y = 2, sizeX = 3, sizeY = 2},
					{x = 0, y = 4, sizeX = 2, sizeY = 3},
					{x = 2, y = 4, sizeX = 4, sizeY = 2},
					{x = 2, y = 6, sizeX = 3, sizeY = 2}}
library[4][1][2] = {{x = 0, y = 0, sizeX = 3, sizeY = 4},
					{x = 3, y = 0, sizeX = 3, sizeY = 2},
					{x = 3, y = 2, sizeX = 3, sizeY = 2},
					{x = 0, y = 4, sizeX = 2, sizeY = 3},
					{x = 2, y = 4, sizeX = 2, sizeY = 4},
					{x = 4, y = 4, sizeX = 2, sizeY = 3}}
library[4][1][3] = {{x = 0, y = 0, sizeX = 2, sizeY = 4},
					{x = 2, y = 0, sizeX = 4, sizeY = 3},
					{x = 0, y = 4, sizeX = 2, sizeY = 3},
					{x = 2, y = 3, sizeX = 4, sizeY = 3},
					{x = 2, y = 6, sizeX = 3, sizeY = 2}}
library[4][2]= {}
library[4][2][1] = {{x = 13, y = 0, sizeX = 3, sizeY = 2},
					{x = 16, y = 0, sizeX = 2, sizeY = 3},
					{x = 13, y = 2, sizeX = 3, sizeY = 3},
					{x = 16, y = 3, sizeX = 2, sizeY = 4},
					{x = 11, y = 5, sizeX = 5, sizeY = 2},
					{x = 15, y = 7, sizeX = 3, sizeY = 2}}
library[4][2][2] = {{x = 13, y = 0, sizeX = 2, sizeY = 5},
					{x = 15, y = 0, sizeX = 3, sizeY = 3},
					{x = 15, y = 3, sizeX = 3, sizeY = 4},
					{x = 11, y = 5, sizeX = 4, sizeY = 2},
					{x = 15, y = 7, sizeX = 3, sizeY = 2}}
library[4][2][3] = {{x = 13, y = 0, sizeX = 3, sizeY = 3},
					{x = 16, y = 0, sizeX = 2, sizeY = 5},
					{x = 13, y = 3, sizeX = 3, sizeY = 2},
					{x = 11, y = 5, sizeX = 4, sizeY = 2},
					{x = 15, y = 5, sizeX = 3, sizeY = 4}}
library[4][3]= {}
library[4][3][1] = {{x = 8, y = 0, sizeX = 3, sizeY = 2},
					{x = 8, y = 2, sizeX = 3, sizeY = 4},
					{x = 6, y = 3, sizeX = 2, sizeY = 4},
					{x = 8, y = 6, sizeX = 2, sizeY = 3}}
library[4][3][2] = {{x = 8, y = 0, sizeX = 3, sizeY = 2},
					{x = 8, y = 2, sizeX = 3, sizeY = 2},
					{x = 6, y = 3, sizeX = 2, sizeY = 4},
					{x = 8, y = 4, sizeX = 3, sizeY = 2},
					{x = 8, y = 6, sizeX = 2, sizeY = 3}}
library[4][3][3] = {{x = 8, y = 0, sizeX = 3, sizeY = 4},
					{x = 6, y = 3, sizeX = 2, sizeY = 4},
					{x = 8, y = 4, sizeX = 3, sizeY = 2},
					{x = 8, y = 6, sizeX = 2, sizeY = 3}}
library[4][4]= {}
library[4][4][1] = {{x = 2, y = 8, sizeX = 3, sizeY = 2},
					{x = 2, y = 10, sizeX = 3, sizeY = 2},
					{x = 5, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 12, sizeX = 3, sizeY = 3},
					{x = 3, y = 12, sizeX = 3, sizeY = 2}}
library[4][4][2] = {{x = 2, y = 8, sizeX = 3, sizeY = 4},
					{x = 5, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 12, sizeX = 2, sizeY = 3},
					{x = 2, y = 12, sizeX = 4, sizeY = 2}}
library[4][4][3] = {{x = 2, y = 8, sizeX = 2, sizeY = 4},
					{x = 4, y = 9, sizeX = 3, sizeY = 3},
					{x = 0, y = 12, sizeX = 2, sizeY = 3},
					{x = 2, y = 12, sizeX = 4, sizeY = 2}}
library[4][5]= {}
library[4][5][1] = {{x = 7, y = 9, sizeX = 2, sizeY = 3},
					{x = 9, y = 10, sizeX = 3, sizeY = 2},
					{x = 6, y = 12, sizeX = 3, sizeY = 2},
					{x = 9, y = 12, sizeX = 2, sizeY = 3}}
library[4][6]= {}
library[4][6][1] = {{x = 6, y = 0, sizeX = 2, sizeY = 3},
					{x = 11, y = 0, sizeX = 2, sizeY = 5},
					{x = 0, y = 7, sizeX = 2, sizeY = 5},
					{x = 5, y = 7, sizeX = 3, sizeY = 2},
					{x = 10, y = 7, sizeX = 5, sizeY = 3}}

library[5] = {}
library[5][1]= {}
library[5][1][1] = {{x = 0, y = 0, sizeX = 4, sizeY = 2},
					{x = 0, y = 2, sizeX = 2, sizeY = 3},
					{x = 2, y = 2, sizeX = 3, sizeY = 2},
					{x = 0, y = 5, sizeX = 3, sizeY = 2},
					{x = 3, y = 4, sizeX = 3, sizeY = 2}}
library[5][1][2] = {{x = 0, y = 0, sizeX = 4, sizeY = 2},
					{x = 0, y = 2, sizeX = 5, sizeY = 2},
					{x = 0, y = 4, sizeX = 3, sizeY = 3},
					{x = 3, y = 4, sizeX = 3, sizeY = 2}}
library[5][2]= {}
library[5][2][1] = {{x = 14, y = 0, sizeX = 4, sizeY = 2},
					{x = 14, y = 2, sizeX = 4, sizeY = 2},
					{x = 12, y = 3, sizeX = 2, sizeY = 4},
					{x = 14, y = 4, sizeX = 4, sizeY = 3},
					{x = 12, y = 7, sizeX = 3, sizeY = 2}}
library[5][2][2] = {{x = 14, y = 0, sizeX = 4, sizeY = 2},
					{x = 14, y = 2, sizeX = 4, sizeY = 3},
					{x = 12, y = 3, sizeX = 2, sizeY = 3},
					{x = 15, y = 5, sizeX = 3, sizeY = 2},
					{x = 12, y = 6, sizeX = 3, sizeY = 3}}
library[5][2][3] = {{x = 14, y = 0, sizeX = 2, sizeY = 3},
					{x = 16, y = 0, sizeX = 2, sizeY = 5},
					{x = 12, y = 3, sizeX = 4, sizeY = 2},
					{x = 12, y = 5, sizeX = 3, sizeY = 4},
					{x = 15, y = 5, sizeX = 3, sizeY = 2}}
library[5][3]= {}
library[5][3][1] = {{x = 8, y = 0, sizeX = 2, sizeY = 4},
					{x = 10, y = 0, sizeX = 2, sizeY = 3},
					{x = 5, y = 2, sizeX = 3, sizeY = 2},
					{x = 6, y = 4, sizeX = 4, sizeY = 2},
					{x = 10, y = 3, sizeX = 2, sizeY = 4},
					{x = 7, y = 6, sizeX = 3, sizeY = 2}}
library[5][3][2] = {{x = 5, y = 2, sizeX = 3, sizeY = 2},
					{x = 8, y = 0, sizeX = 2, sizeY = 4},
					{x = 10, y = 0, sizeX = 2, sizeY = 4},
					{x = 6, y = 4, sizeX = 4, sizeY = 2},
					{x = 10, y = 4, sizeX = 2, sizeY = 3},
					{x = 7, y = 6, sizeX = 3, sizeY = 2}}
library[5][4]= {}
library[5][4][1] = {{x = 2, y = 7, sizeX = 2, sizeY = 4},
					{x = 4, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 11, sizeX = 3, sizeY = 4},
					{x = 3, y = 12, sizeX = 3, sizeY = 3}}
library[5][4][2] = {{x = 2, y = 7, sizeX = 2, sizeY = 5},
					{x = 4, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 11, sizeX = 2, sizeY = 4},
					{x = 2, y = 12, sizeX = 4, sizeY = 3}}
library[5][4][3] = {{x = 2, y = 7, sizeX = 2, sizeY = 4},
					{x = 4, y = 9, sizeX = 2, sizeY = 3},
					{x = 0, y = 11, sizeX = 2, sizeY = 4},
					{x = 2, y = 11, sizeX = 2, sizeY = 4},
					{x = 4, y = 12, sizeX = 2, sizeY = 3}}
library[5][5]= {}
library[5][5][1] = {{x = 7, y = 8, sizeX = 3, sizeY = 2},
					{x = 6, y = 10, sizeX = 6, sizeY = 2},
					{x = 6, y = 12, sizeX = 6, sizeY = 2},
					{x = 8, y = 14, sizeX = 3, sizeY = 2}}
library[5][5][2] = {{x = 7, y = 8, sizeX = 3, sizeY = 2},
					{x = 6, y = 10, sizeX = 3, sizeY = 4},
					{x = 9, y = 10, sizeX = 3, sizeY = 2},
					{x = 9, y = 12, sizeX = 3, sizeY = 2},
					{x = 8, y = 14, sizeX = 3, sizeY = 2}}
library[5][5][3] = {{x = 6, y = 9, sizeX = 2, sizeY = 3},
					{x = 8, y = 8, sizeX = 2, sizeY = 4},
					{x = 10, y = 10, sizeX = 2, sizeY = 4},
					{x = 6, y = 12, sizeX = 4, sizeY = 2},
					{x = 8, y = 14, sizeX = 3, sizeY = 2}}
library[5][6]= {}
library[5][6][1] = {{x = 4, y = 0, sizeX = 4, sizeY = 2},
					{x = 12, y = 0, sizeX = 2, sizeY = 3},
					{x = 0, y = 7, sizeX = 2, sizeY = 4},
					{x = 4, y = 6, sizeX = 3, sizeY = 3},
					{x = 10, y = 7, sizeX = 2, sizeY = 3},
					{x = 15, y = 7, sizeX = 3, sizeY = 2}}

					
local TILES_TO_MIRROR = {1, 2, 3, 4, 6} --THIS IS SURELY NOT RIGHT!!!
local BOARD_WIDTH = 18
local BOARD_HEIGHT = 24
local function mirrorTile(tile)
	local mirroredCopy = {}
	for i,v in pairs(tile) do
		mirroredCopy[i] = {}
		for j,c in pairs(v) do
			mirroredCopy[i][j] = {}
			mirroredCopy[i][j].x = BOARD_WIDTH - (c.x + c.sizeX)
			mirroredCopy[i][j].y = BOARD_HEIGHT - (c.y + c.sizeY)
			mirroredCopy[i][j].sizeX = c.sizeX
			mirroredCopy[i][j].sizeY = c.sizeY
		end
	end
	return mirroredCopy
end
for _,set in pairs(library) do
	for tileNumber,tile in pairs(set) do
		for _,v in pairs(TILES_TO_MIRROR) do
			if tileNumber == v then
				table.insert(set, mirrorTile(tile))
			end
		end
	end
end
					
function getRandomSet()
	return math.random(#library)
end

function getTilesInSet(setNumber)
	return library[setNumber]
end

-- function getTilesInSet(setNumber)
	-- local RackTile = require "RackTile"
	-- local tiles = {}
	-- for i = 1, #library[setNumber] do
		-- tiles[i] = RackTile.new()
		-- local variations = {}
		-- for v = 1, library[setNumber][i] do
			-- variations[v] = #library[setNumber][i][v]
		-- end
		-- tiles[i].setVariations(variations)
	-- end
	-- return tiles
-- end

-- function getContainersInVariation(setNumber, tileNumber, variationNumber)
	-- local ContainerInstruction = require "ContainerInstruction"
	-- local variationData = library[setNumber][tileNumber][variationNumber]
	-- local containers = {}
	-- for i = 1, #variationData do
		-- local container = ContainerInstruction.new()
		-- container.x = variationData[i].x
		-- container.y = variationData[i].y
		-- container.sizeX = variationData[i].sizeX
		-- container.sizeY = variationData[i].sizeY
		-- table.insert(containers, container)
	-- end
	-- return containers
-- end