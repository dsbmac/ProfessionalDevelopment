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
	void RecCutStock(Vector<int> & requests, int stockLength, 
							   Vector<Vector<int> > & solution, 
							   Vector<Vector<Vector<int> > > & solutions) ;
	void RecCutStock2(Stack<int> & requests, int stockLength, 
						 Vector< Vector<int> > & solution,
						 Vector< Vector< Vector<int> > > & solutions) ;
	int sumCuts(Vector<int> & cuts) ;
	Stack<int> convertVector(Vector<int> requests) ;
	void printSolution(Vector < Vector<int> > & cuts) ;
	void printCuts(Vector<int> & cuts) ;
	void printCutsStack(Stack<int> & cuts);
};
