#include "genlib.h"
#include "simpio.h"
#include "vector.h"
#include <string>
#include <iostream>
#include <fstream>
#include "HistoScores.h"
#include "strutils.h"
#include "map.h"

HistoScores::HistoScores(void)
{
	ifstream infile;
	AskUserForInputFile("Input file: ", infile);
	ReadTextFile(infile);
	infile.close();
	displayHistogram();
}
void HistoScores::displayHistogram() {
	Vector<int> groupCounts;
	Vector<string> labels;
	sortScores(groupCounts, labels);
	//displays count
	for (int i = 0; i < 10; i++) {
		cout << labels[i];
		for (int j = 0; j < groupCounts[i]; j++) {
			cout << "*";
		}
		cout << endl;
	}	
}

void HistoScores::sortScores(Vector<int> & groupCounts, Vector<string> & labels) {
	for (int i = 0; i < 10; i++) {
		groupCounts.add(0);
		string label = IntegerToString(i) + "-" + IntegerToString(i + 9) + ": ";
		labels.add(label);
	}
	for (int i = 0; i <scores.size(); i++) {
		int score = StringToInteger(scores[i]);
		int index = score / 10;
		int x = groupCounts.getAt(index);
		groupCounts.setAt(index, ++x);
	}	
}

/*
 * Reads an entire file into the Vector<string> supplied by the user.
 */
void HistoScores::ReadTextFile(ifstream & infile) {
	while (true) {
		string line;
		getline(infile, line);
		if (infile.fail()) break;
		scores.add(line);
	}
}
void HistoScores::AskUserForInputFile(string prompt, ifstream & infile) {
	while (true) {
		cout << prompt;
		string filename = GetLine();
		filename = "scores.txt";
		infile.open(filename.c_str());
		if (!infile.fail()) {
			cout << endl << "- " << filename << " histogram" << " -" << endl;
			break;
		}
		cout << "Unable to open " << filename << endl;
		infile.clear();
	}
}