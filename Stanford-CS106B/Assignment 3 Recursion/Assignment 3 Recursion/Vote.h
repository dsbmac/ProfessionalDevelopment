#pragma once
#include "Warmup.h"

class Vote
{
public:
	Vote(void);
	int CountCriticalVotes(Vector<int> & blocks,  int  blockIndex);
public:
	~Vote(void);
private:
	Vector<int> foobar ( Vector<int> foo, Vector<int> bar) ;
	int CompareVects(Vector<int> & votes) ;
	int sumVector(Vector<int> & vect) ;
	void RecCriticalVotes(int target , int & count, Set<Vector<int> > & uniques, 
		Vector<int> & foo = Vector<int>(), Vector<int> & bar = Vector<int>()) ;
	bool IsCriticalVote(Vector<int> & foo, Vector<int> & bar, int target) ;
	void printVector(Vector<int> & vect) ;
};
