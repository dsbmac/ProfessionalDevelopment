#pragma once
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

class TwelveStep
{
public:
	TwelveStep(void);
	int CountWays(int  numStairs);
private:
	Vector<Stack<int> > RecCountWays(Stack<int> & stepsTaken, int  & numStairs, Vector<Stack<int> > & perms);
	void printPerms(Vector<Stack<int> > & perms) ;
};
