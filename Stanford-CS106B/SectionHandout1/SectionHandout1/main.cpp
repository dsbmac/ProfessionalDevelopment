/*
 * Project: SectionHandout1
 * Created by CuInput06 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * Section Handout 1
 */

#include <iostream>
#include "genlib.h"
#include "simpio.h"	
#include <fstream>
#include <istream>
#include "vector.h"
#include "strutils.h"


void CountLetters(string filename)
{
	ifstream inFile;
	inFile.open(filename.c_str());
	if ( inFile.fail() ) Error("Can't open the file.");
	
	//create a vector size 26 with zeroes. each index represents the letter count 
	Vector<int> alphaVec;
	for (int i =0; i < 26; i++) {
		alphaVec.add(0);
	}

	while (true) {
		string s;
		getline(inFile, s);
		if(inFile.fail()) break;
		s = ConvertToLowerCase(s);
		for (int i = 0; i < s.length(); i++) {
			if(isalpha(s[i])) {
				int index = int(s[i]) - 97;
				int x = alphaVec.getAt(index) + 1;
				alphaVec.setAt(index, x);	
			}			
		}		
	}
	string letters = "abcdefghijklmnopqrstuvxywz";
	for (int i = 0; i < alphaVec.size(); i++) {
		cout << letters[i] << ": " << alphaVec[i] <<endl;
	}
}


struct gradesT {
	double avg;
	double min;
	double max;
};

void grades()
{
	int count = 0;
	int sum = 0;
	int max = -1;
	int min = 101;
	gradesT result;
	ifstream in;
	in.open("grades.txt");
	if (in.fail()) Error("Couldn't read file.");
	while (true) {
		string s;
		getline(in, s);
		if(in.fail()) break;
		int score = StringToReal(s);
		if (score > max) max = score;
		if (score < min) min = score;
		count++;
		sum +=score;
	}
	in.close();
	result.avg = double(sum)/count;
	result.min = min;
	result.max = max;
	cout << min << endl;
	cout << max << endl;
	cout << RealToString(result.avg);
}

//gradesT stats(std::ifstream& inFile)
//{
//	int count = 0;
//	int sum = 0;
//	int max = -1;
//	int min = 101;
//	gradesT result;
//	
//	while (true) {
//		string s;
//		getline(inFile, s);
//		if(inFile.fail()) break;
//		int score = StringToReal(s);
//		if (score > max) max = score;
//		if (score < min) min = score;
//		count++;
//		sum +=score;
//	}
//	inFile.close();
//	result.avg = double(sum)/count;
//	result.min = min;
//	result.max = max;
//	cout << min << endl;
//	cout << max << endl;
//	cout << RealToString(result.avg);
//}
//
//ifstream gradesStream() 
//{
//	ifstream inFile;
//	inFile.open("grades.txt");
//	if (!inFile.fail()) Error("Couldn't read file.");
//	return inFile;
//}



void censorString()
{	
	cout << "Enter string: " ;
	string uInput, chrRemove, result;
	result = "";
	cin >> uInput;
	cout << uInput + " confirmed." << endl;
	cout << "Enter characters to remove: " ;
	cin >> chrRemove;
	cout << chrRemove + " confirmed." << endl;
	for (int i = 0; i < uInput.length(); i++) {
		bool match = false;
		for (int j = 0; j < chrRemove.length(); j++) {
			if (uInput[i] == chrRemove[j]) {
				match = true;
				break;
			}
		}
		if (match == false) result += uInput[i];
	}
	cout << result << endl;
	
	for (int i = 0; i < uInput.length(); i++) {
		bool match = false;
		for (int j = 0; j < chrRemove.length(); j++) {
			if (uInput[i] == chrRemove[j]) {
				match = true;
				break;
			}
		}
		if (match == true) uInput.erase(i);
	}
	cout << "uInput modified: " + uInput << endl;
}


int main() 
{
//	censorString();
	CountLetters("alphabet.txt");

	return 0;
}