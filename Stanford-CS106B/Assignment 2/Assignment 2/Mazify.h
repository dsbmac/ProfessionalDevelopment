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
	int maxRow, maxCol;
	pointT includedMark, currentPt, start, finish;
	void setup(Maze & maze);
	void Include(pointT &pt);
	void createMaze(Maze & maze);
	pointT RandomPt(Maze & maze, bool neighbour=true);
	Vector<pointT> dirPts;
	Grid<bool> included;
	Stack<bool> excluded;
	Stack<pointT> SolveMaze(Maze & maze);
	void displaySolution(Stack<pointT> solution, Maze & maze );
	bool samePt(pointT a, pointT b);
};
