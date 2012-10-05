#pragma once
#include "maze.h"
#include "vector.h"
#include "grid.h"
#include "stack.h"

class Mazify
{
public:
	Mazify(void);
private:	
	int maxRow, maxCol, excludedCnt;
	pointT currentPt;
	void setup(Maze & maze);
	void Include(pointT &pt);
	void createMaze(Maze & maze);
	Grid<bool> included;
	Stack<pointT> SolveMaze(Maze & maze);
	void displaySolution(Stack<pointT> solution, Maze & maze );
	bool samePt(pointT a, pointT b);
	bool isBacktrack(pointT & neighbour, Stack<pointT> & path);
	enum dirT { North, East, South, West };
	pointT newPt(dirT direction);
};
