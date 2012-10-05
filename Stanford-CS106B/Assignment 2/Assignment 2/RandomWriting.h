#pragma once
#include "map.h"
#include "vector.h"
#include <fstream>

class RandomWriting
{
public:
	RandomWriting(void);
private:
	struct markov {
		string key;
		int count;
	};
	void AskUserForInput(ifstream & infile, int & seed);
	void ParseTextFile(ifstream & infile, Map<Vector<string> > & chOccurrences, int & seed);
	void PrintMap(Map<Vector<string> > & chOccurrences);
	void createCounts(Vector<markov> & chOrder, Map<Vector<string> > & chOccurrences);
	void sort(Vector<markov> & chOrder);
	void PrintOrder(Vector<markov> & chOrder);
	void WriteRandomly(int & nChars,Vector<markov> & chOrder, Map<Vector<string> > & chOccurrences);

};
