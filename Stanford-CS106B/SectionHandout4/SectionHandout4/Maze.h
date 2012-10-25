#pragma once
#include "genlib.h"
#include "mazelib.h"

static const int NoSolution = 10000;

class Maze
{
public:
	Maze(void);
	int ShortestPathLength(pointT pt);
public:
	~Maze(void);
};
