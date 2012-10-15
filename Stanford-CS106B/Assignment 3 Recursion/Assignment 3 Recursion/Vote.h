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
	int RecCriticalVotes(int index, Vector<int> & blocks, int foo, int bar, int swing, int count) ;
	bool IsCriticalVote(Vector<int> & foo, Vector<int> & bar, int target) ;
	void printVector(Vector<int> & vect) ;
	bool IsVoteCritical(int & foo, int & bar, int swing) ;
};
