#pragma once
#include "vector.h"
#include <fstream>

class HistoScores
{
public:
	HistoScores(void);
private:
	void ReadTextFile(ifstream & infile);
	void AskUserForInputFile(string prompt, ifstream & infile);
	void displayHistogram();
	void sortScores(Vector<int> & groupCounts, Vector<string> & labels);
	Vector<string> scores;
};
