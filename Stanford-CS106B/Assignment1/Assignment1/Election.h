#pragma once
#include <vector.h>
class Election
{
public:
	Election();
private:
	static const int NUM_TRIALS = 500;
	double simulateElection();
	void getData();
	Vector<int> processVotes();
	int voters;
	double spread, errorRate;
};