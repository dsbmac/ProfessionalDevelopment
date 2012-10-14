#pragma once
#include <iostream>
#include <string>
#include "set.h"
#include "genlib.h"
#include "strutils.h"
#include "map.h"
#include "vector.h"
#include "strutils.h"
#include "queue.h"
#include "stack.h"

class Warmup
{
public:
	Warmup(void);
	bool CanMakeSum(Vector<int> & nums, int targetSum) ;
	bool CanMakeSum2(Vector<int> nums, int targetSum, Set<Vector<int> > numSet ) ;
public:
	~Warmup(void);
private:
	//Warm-up A: Print in binary
	string RecPrintInBinary(int num) ;
	void PrintInBinary(int num) ;
	//Warm-up B: Subset Sum
	bool TargetIsEqual(Vector<int> & soFar, int targetSum) ;
	void printVector(Vector<int> & vect) ;
	bool RecCanMakeSum(Vector<int> & soFar, Vector<int> & nums, int targetSum) ;
	int sumVect(Vector<int> v) ;
	int CompareVect(Vector<int> a, Vector<int> b) ;
	bool RecCanMakeSum2(Vector<int> & soFar, Vector<int> & nums, int targetSum, Set<Vector<int> > & numSet ) ;	
};


