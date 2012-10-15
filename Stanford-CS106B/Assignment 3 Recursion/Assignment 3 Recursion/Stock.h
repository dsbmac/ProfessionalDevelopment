#pragma once
#include "genlib.h"
#include "strutils.h"
#include "set.h"
#include "map.h"
#include "vector.h"
#include "strutils.h"
#include "queue.h"
#include "stack.h"
#include "lexicon.h"
#include <iostream>
#include <string>

class Stock
{
public:
	Stock(void);
	int CutStock(Vector<int> & requests, int stockLength);
public:
	~Stock(void);
private:
	int minCuts(Vector<int> & cuts) ;
	int RecCutStock( Vector<int> &requests, int stockLength, int pipes, int cutTotal, Vector<int> & solutions) ;
};
