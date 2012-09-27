#include <fstream>
#include "genlib.h"
#include <istream>
#include "simpio.h"
#include <string>
#include "vector.h"

Vector gradesVect (ifstream &in)
{
	Vector<string> result;
	while (true) {
		string s;
		getline(in, s);
		if(in.fail()) break;
		result.add(s);
	}
	return result;
}

void grades() 
{
	ifstream in;
	while (true) {
	in.open("grades.txt");
	if (!in.fail()) break;
	cout << "Could not open file.";
	in.clear();
	}
	Vector<string> result = gradeString(in);
	return 0;
}