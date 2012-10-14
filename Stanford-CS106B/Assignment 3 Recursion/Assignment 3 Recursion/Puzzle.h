#pragma once
#include "graphics.h"
#include "set.h"
#include "genlib.h"
#include "strutils.h"
#include "map.h"
#include "vector.h"
#include "strutils.h"
#include "queue.h"
#include "stack.h"
#include <iostream>
#include <string>

class Puzzle
{
public:
	Puzzle(void);
	bool Solvable(int start, Vector<int> & squares);
private:
	bool isValidIndex(int index , Vector<int> & squares ) ;
	void moveToSquare (int newPosition, Stack<int> & solution);
	void backtrack ( Stack<int> & solution);	
	void printSolution (Stack<int> solution);
	bool Solve(int index, int prevIndex, Vector<int> & squares, Stack<int> & solution);
public:
	~Puzzle(void);
};
