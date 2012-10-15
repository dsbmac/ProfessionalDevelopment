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

class Stairs
{
public:
	Stairs(void);
	int CountWays(int  numStairs);
private:
	int RecCountWays (int numStairs) ;
};
