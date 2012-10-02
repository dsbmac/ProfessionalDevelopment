#include "genlib.h"
#include <string>
#include <vector.h>
#include <iostream>
#include <queue.h>
#include <map.h>
#include <fstream>
#include <grid.h>
/*
 * Project: SectionHandout2
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */
struct eMailMsg {
  string to;        // i.e. "professor@stanford.edu"
  string from;      // i.e. "student@stanford.edu"
  string message;   // body of message
  string subject;   // i.e. "CS106 Rocks!"
  int date;         // date email was sent
  int time;         // time email was sent
};
//a)   How would you declare a Vector that stores eMailMsgs?
Vector<eMailMsg> mailVect;
/*b)   Write a function RemoveSpam that takes a vector containing elements of type
eMailMsg and removes all elements whose subject begins with the string "SPAM".*/
/*for this you have to start traversing from the end and pop off the stack because it will mess
with the indexing */
void RemoveSpam() {
	int i = mailVect.size()-1;
	while (i >= 0) {
		cout << "i: " << i << endl;
		string str = mailVect[i].subject;
		cout << "looking in " << str << " result: " << str.find("SPAM") << endl;
		if (str.find("SPAM")==0) {
			cout << "Found spam @ " << i << "!" << endl;
			mailVect.removeAt(i);
		}
		i--;
	}
}
/*c) How could you modify the to field of the eMailMsg structure so that it can hold the
email addresses of an arbitrary number of recipients of an email? With the modification
in place, given an eMailMsg email, how would you access the last address listed in the
to field? ans: change it to a vector. eMailMsg.to[eMailMsg.to.size()-1]*/
void getMail() {
	eMailMsg loveLetter;
	loveLetter.to = "professor@stanford.edu";
	loveLetter.from = "student@stanford.edu";
	loveLetter.message = "body of message";
	loveLetter.subject = "Love you honey!";
	loveLetter.date = 2012;
	loveLetter.time = 10;
	eMailMsg spam1;
	spam1.subject = "SPAM C S106 Rocks!";
	eMailMsg spam2;
	spam2.subject = "SPAMaZOACS106 Rocks!";

	mailVect.add(loveLetter);
	mailVect.add(spam1);
	mailVect.add(spam2);
}
/* Problem 2: Queues */
void ReverseQueue(Queue<int> & q) {
	Vector<int> temp;
	while(true) {
		if(q.isEmpty()) break;
		else temp.add(q.dequeue());			
	}
	for (int i = temp.size()-1; i >= 0 ; i--) q.enqueue(temp[i]);
}
void testReverseQueue() {
	Queue<int> q;
	q.enqueue(1);
	q.enqueue(2);
	q.enqueue(3);
	cout << q.peek() << endl;
	ReverseQueue(q);
	cout << q.peek() << endl;
}
/*Problem 3: Using the Scanner and Stack classes*/
bool IsCorrectlyNested(string htmlStr) {
	int bracketCnt = 0;
	int closeCnt = 0;
	string sentinel = " < > /";
	for(int i = 0; i < htmlStr.length(); i++) {
		if(sentinel.find(htmlStr[i])) {
			if(htmlStr[i] == '<' ) {
				bracketCnt++;
				closeCnt++;
			}
			if(htmlStr[i] == '>') {
				bracketCnt--;
			}
			if(i != 0 && htmlStr[i] == '/' && htmlStr[i-1] == '<') {
				closeCnt -= 2;
			}
		}
	}
	return closeCnt == 0 && bracketCnt ==0;
}
void testIsCorrectlyNested() {	
	string s = "<html><b><i>CS106 rules!</i></b></html>";
	cout << boolalpha << IsCorrectlyNested(s) << endl;
}
// Problem 4: Map Warm-up
char MostFrequentCharacter(ifstream &infile, int &numOccurrences) {
	Map<int> map;
	while (true) {
		string line;
		getline(infile, line);
		if (infile.fail()) break;
		for(int i= 0; i < line.length(); i++) {
			if(!isspace(line[i])) {
				string key = line.substr(i,1);			
				if(map.containsKey(key)) {
					map.add( key, map.getValue(key) + 1  );
				} else map.add(key, 0);
			}			
		}
	}
	int max = 0;
	string maxKey = "";
	Map<int>::Iterator iter = map.iterator();
	while(iter.hasNext()) {
		string key = iter.next();
		if(map.getValue(key) > max) {
			max = map.getValue(key);
			maxKey = key;
		}
	}
	numOccurrences = max;
	return maxKey[0];
}
void openInputFile(ifstream & infile) {
	string filename = "characters.txt";
	infile.open(filename.c_str());
	if (infile.fail()) cout << "Unable to open " << filename << endl;
}
void testMostFrequentCharacter() {
	int numOccurrences = 0;
	ifstream infile;
	openInputFile(infile);
	char most = MostFrequentCharacter(infile, numOccurrences);
	infile.close();
	cout << "most: " << most << endl;
}
//Problem 5:  Minesweeper
struct Location {
	int row;
	int col;
};
Vector<Location> compass;
bool isInBounds(Location rc, Grid<bool> & bombLocations) {	
	bool result = ( (0 <= rc.col && rc.col < bombLocations.numCols() ) && (0 <= rc.row && rc.row < bombLocations.numRows() ) );
	return result;
}
int scanForBombs(Location rc, Grid<bool> & bombLocations) {
	int factor = -1;
	int cnt = 0;
	for(int i = 0; i < compass.size(); i++) {
		Location newRC = {rc.row + compass[i].row, rc.col + compass[i].col};
		if (isInBounds(newRC, bombLocations) && bombLocations.getAt(newRC.row, newRC.col)) cnt++;
	}
	return cnt;
}

void fillGrid(Grid<bool> & bombLocations, string trim) {
	//fill up values
	int z = 0;
	for (int i = 0; i < bombLocations.numRows(); i++) {
		for (int j = 0; j < bombLocations.numCols(); j++) {
			bool bomb;
			string s = trim.substr(z,1);
			if (s == "T") bomb = true;
			else if(s == "F") bomb = false;
			bombLocations.setAt(i, j, bomb);
			z++;
		}
   }
}
Grid<int> MakeGridOfCounts(Grid<bool> & bombLocations) {
	Grid<int> result(bombLocations.numRows(), bombLocations.numCols());
	for(int i = 0; i < bombLocations.numRows(); i++) {
		for(int j = 0; j < bombLocations.numCols(); j++) {
			Location rc = {i,j};
			int bombs = scanForBombs(rc, bombLocations);
			result.setAt(i, j, bombs);
		}
	}
	return result;
}
Grid<bool> setup() {
	string values = "T F F F F T F F F F F T T T F T F T T F F F F F F F T F F F F F F F F F ";
	string trim = "";
	for (int i = 0; i < values.length(); i++) {
		if(values[i] == 'T' || values[i] == 'F') {
			trim += values[i];
		}
	}
	for (int i = -1; i < 2; i ++) {
		for (int j = -1; j < 2; j++) {
			Location loc = {i, j};
			compass.add(loc);
		}
	}
	Grid<bool> bombLocations(6, 6);
	fillGrid(bombLocations, trim);
	return bombLocations;
}
void testMakeGridOfCounts() {	
	Grid<bool> bombLocations = setup();
	Grid<int> gridCount = MakeGridOfCounts(bombLocations);
	for (int i = 0; i < gridCount.numRows(); i++) {
		for (int j = 0; j < gridCount.numCols(); j++) {
			cout << gridCount.getAt(i,j) << " ";
		}
		cout << endl;
   }
}
int main ()
{
	//testReverseQueue();
	//testIsCorrectlyNested();
	//testMostFrequentCharacter();
	testMakeGridOfCounts();
	return 0;
}