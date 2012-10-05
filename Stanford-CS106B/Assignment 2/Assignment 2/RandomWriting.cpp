#include "RandomWriting.h"
#include "map.h"
#include "vector.h"
#include "scanner.h"
#include "simpio.h"
#include <iostream>
#include "strutils.h"
#include "random.h"

RandomWriting::RandomWriting(void)
{
	ifstream inFile;
	int seed;
	AskUserForInput(inFile, seed);
	Map<Vector<string> > chOccurrences; //main collector. seed with occurences
	ParseTextFile(inFile, chOccurrences, seed);
	inFile.close();
	Vector<markov> chOrder;//ordered charater frequencies
	createCounts(chOrder, chOccurrences);	
	PrintMap(chOccurrences);
	PrintOrder(chOrder);
	int nChars = 2000;
	WriteRandomly(nChars, chOrder, chOccurrences);
}
void RandomWriting::WriteRandomly(int & nChars,Vector<markov> & chOrder, Map<Vector<string> > & chOccurrences) {
	Randomize();
	int cnt = 0;
	string seed = chOrder[0].key;
	cout << seed;
	while(cnt < nChars && chOccurrences.containsKey(seed)) {		
		int index = RandomInteger(0, chOccurrences[seed].size()-1);
		string nextChar = chOccurrences[seed][index];		
		cout << nextChar;
		seed += nextChar;
		seed.erase(0,1);
		cnt++;
	}	
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
	seed = 3;
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
				string key = str.substr(0,seed);
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
	cout << endl << "Sorted Occurrences" << endl;
	for (int i = 0; i < chOrder.size(); i++) {
		cout << chOrder[i].count << " " << chOrder[i].key << endl;
	}
}
void RandomWriting::sort(Vector<markov> & chOrder) {
	markov noob = chOrder[chOrder.size()-1];
	int index = chOrder.size()-1;
	int i = chOrder.size()-2;
	while(chOrder.size() > 1 && i >=0) {
		if (chOrder[i].count < chOrder[chOrder.size()-1].count ) {
			index = i;
			i--;
		}
		else break;
	}
	chOrder.insertAt(index, noob);
	chOrder.removeAt(chOrder.size()-1);	
}
void RandomWriting::createCounts(Vector<markov> & chOrder, Map<Vector<string> > & chOccurrences) {
	Map<Vector<string> >::Iterator iter = chOccurrences.iterator();
	while (iter.hasNext()){
		string key = iter.next();
		int freq = chOccurrences[key].size();
		markov mkv = {key, freq};
		chOrder.add(mkv);
		sort(chOrder);
	}
}
