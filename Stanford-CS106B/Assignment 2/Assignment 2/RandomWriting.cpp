#include "RandomWriting.h"
#include "map.h"
#include "vector.h"
#include "scanner.h"
#include "simpio.h"
#include <iostream>
#include "strutils.h"

RandomWriting::RandomWriting(void)
{
	ifstream inFile;
	int seed;
	AskUserForInput(inFile, seed);
	Map<Vector<string> > chOccurrences;
	ParseTextFile(inFile, chOccurrences, seed);
	Vector<markov> chOrder;
	createCounts(chOrder, chOccurrences);
	inFile.close();
	PrintMap(chOccurrences);
	PrintOrder(chOrder);
}

void RandomWriting::AskUserForInput(ifstream & inFile, int & seed) {
	while (true) {
	/*	cout << "Input file: ";
		string filename = GetLine();*/
		string filename = "text1.txt";
		inFile.open(filename.c_str());
		if (!inFile.fail()) break;
		cout << "Unable to open " << filename << endl;
		inFile.clear();
	}
	/*while (true) {
		cout << endl << "Enter seed: "; 
		seed = GetInteger();
	}*/
	seed = 2;
}
void RandomWriting::ParseTextFile(ifstream & inFile, Map<Vector<string> > & chOccurrences, int & seed) {
	int nextChar;
	//use string to access matching seed char 
	string str = "";
	while ((nextChar = inFile.get()) != EOF) {
		//convert nextChar so it can be used as map key
		if ( isprint(nextChar) ) {
			nextChar = tolower(nextChar);
			str += char(nextChar);
			if (str.length() == seed+1) {
				string key = str.substr(0,2);
				if (!chOccurrences.containsKey(key)) {
					Vector<string> initialVect;
					chOccurrences.add(key, initialVect);
				}
				chOccurrences[key].add(str.substr(seed));
				str.erase(0,1);
			}
		}		
	}
}
void RandomWriting::PrintMap(Map<Vector<string> > & chOccurrences) {
	Map<Vector<string> >::Iterator iter = chOccurrences.iterator();
	while(iter.hasNext()) {
		string key = iter.next();
		cout << key << ": ";
		for (int i = 0; i < chOccurrences[key].size(); i++) {
			cout << chOccurrences[key][i] << " ";
		}
		cout << endl;
	}
}
void RandomWriting::PrintOrder(Vector<markov> & chOrder) {
	for (int i = 0; i < chOrder.size(); i++) {
		cout << chOrder[i].count << " " << chOrder[i].key << endl;
	}
}
void RandomWriting::swap(Vector<markov> & chOrder) {
	markov tmp = chOrder[0];
	chOrder[0] = chOrder[chOrder.size()-1];
	chOrder[chOrder.size()-1] = tmp;
}
void RandomWriting::createCounts(Vector<markov> & chOrder, Map<Vector<string> > & chOccurrences) {
	Map<Vector<string> >::Iterator iter = chOccurrences.iterator();
	while (iter.hasNext()){
		string key = iter.next();
		int freq = chOccurrences[key].size();
		markov mkv = {key, freq};
		chOrder.add(mkv);
		if (mkv.count > chOrder[0].count) {
			swap(chOrder);
		}
	}
}
