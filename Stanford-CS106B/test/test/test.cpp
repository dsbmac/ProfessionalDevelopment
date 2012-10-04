#include "genlib.h"
#include <iostream>
#include <vector.h>
#include <iostream>
#include <string>
#include "random.h"
#include "simpio.h"
#include "queue.h"
#include "map.h"
#include "grid.h"

void AskUserForInputFile(ifstream & in) {
	while (true) {
		string filename = "text1.txt";
		in.open(filename.c_str());
		if (!in.fail()) break;
			cout << "Unable to open " << filename << endl;
			in.clear();
	}
}

char MostFrequentCharacter(ifstream &in, int &numOccurrences)
{
	Map<int> charFrequencies;
	numOccurrences = 0;
	int nextChar;
	while((nextChar = in.get()) != EOF) {
		// convert it to a string for lookup in the symbol table
		string foundChar = "";
		foundChar += char(nextChar);
		// if we find it, incremement the stored value, otherwise
		// enter in a new one
		int frequency = 1;
		if (charFrequencies.containsKey(foundChar))
		frequency = charFrequencies[foundChar] + 1;
		charFrequencies[foundChar] = frequency;
	}
	// now use an iterator to find the most occurring character
	Map<int>::Iterator it = charFrequencies.iterator();
	string maxCharacter = "";
	while (it.hasNext()) {
		string character = it.next();
		int frequency = charFrequencies[character];
		if (frequency > numOccurrences){
			maxCharacter = character;
			numOccurrences = frequency;
		}
	}
	return maxCharacter[0];
}
int main() {
	ifstream in;
	int numOccurrences;
	AskUserForInputFile("Input file: ", infile);
	MostFrequentCharacter(in, numOccurrences);	
}
