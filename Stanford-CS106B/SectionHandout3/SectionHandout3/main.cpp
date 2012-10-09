/*
 * Project: SectionHandout3
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */
#include "set.h"
#include "genlib.h"
#include "strutils.h"
#include "map.h"
#include "vector.h"
#include "strutils.h"
#include <iostream>
#include <string>

//Problem 1: Set Callbacks
struct entryT {
  string firstName;
  string lastName;
  string phoneNumber;
};
int CompareEntries(entryT a, entryT b) {
	if ( a.lastName == b.lastName) {
		if ( a.firstName == b.firstName) return 0;
		else if ( a.firstName < b.firstName) return -1;
	} else if ( a.lastName < b.lastName) return -1;
	return 1;
}
int CompareStrings(string a, string b) {//case insensitive callback
	string lowerA = ConvertToLowerCase(a);
	string lowerB = ConvertToLowerCase(b);
	if (lowerA == lowerB) return 0;
	else if (lowerA < lowerB) return -1;
	else return 1;
}
//Problem 3: Cartesian Products
struct pairT
{
         string first, second;
};
int ComparePairs(string a, string b) {
	string lowerA = ConvertToLowerCase(a);
	string lowerB = ConvertToLowerCase(b);
	if (lowerA == lowerB) return 0;
	else if (lowerA < lowerB) return -1;
	else return 1;
}
//Set<pairT> CartesianProduct(Set<string> & one, Set<string> & two) {
//	Set<pairT> result(ComparePairs);
//	Set<string>::Iterator iter = one.iterator();
//	while(iter.hasNext()) {
//		string first = iter.next();
//		Set<string>::Iterator iter2 = two.iterator();
//		while(iter2.hasNext()) {
//			string second = iter.next();
//			pairT product = {first, second};
//		}
//	}
//}
//void testCartesian(){
//	Set<string> one =  {"A", "B", "C"} ;
//	Set<string> two = {"X", "Y"};	
//	CartesianProduct(one, two);
//}
void AddressBook() {
	entryT a = {"Danny", "More", "1234337989"};
	entryT b = {"Jimmy", "Mass", "5149337989"};
	entryT c = {"Harry", "More", "2349337989"};
	entryT d = {"Danny", "More", "3344337989"};
	Set<entryT> addressBook (CompareEntries);
	addressBook.add(a);
	addressBook.add(b);
	addressBook.add(c);
	addressBook.add(d);
	cout << addressBook.size() << endl;
}
//void makeCombos(Vector<string> & sequence, Vector<string> sequence, Map<string> & keypad) {
//	//create 3 strings and iterate through each letter
//	//for (int i = 0 ; i < sequence.size(); i++) {
//	//	
//	//}
//	string first = keypad.getValue(str.substr(0,1));
//	string second = keypad.getValue(str.substr(1,1));
//	string third = keypad.getValue(str.substr(2,1));
//	for (int i = 0; i < first.length(); i++) {
//		for (int j = 0; j < second.length(); j++) {
//			for (int k = 0; k < third.length(); k++) {
//				cout << first[i] << second[j] << third[k] << endl;
//			}
//		}
//	}
//}
//void ListMnemonics(string str) {
//	Map <string> keypad; //maps letters to keypad nums
//	Vector<string> sequence;
//	keypad.add("0", "   ");
//	keypad.add("1", "   ");
//	string alpha = "abcdefghijklmnoprstuvwxy";
//	for (int i = 0; i <= 7; i++) {
//		keypad.add( IntegerToString(i+2), alpha.substr((i*3), 3) ); 
//	}
//	Map<string>::Iterator iter = keypad.iterator();
//	while (iter.hasNext()) {
//		string key = iter.next();
//		cout << key << ": " << keypad.getValue(key) << endl;
//	}
//	for (int i = 0 ; i < str.length(); i++) {
//		sequence.add(keypad.getValue( str.substr(i,1) ));
//	}
//	makeCombos(sequence, str, keypad);
//}
//Problem 4: Cannonballs
int Cannonball(int height) {
	if (height == 0) {
		return 0;
	} else {
		return (height*height) + Cannonball(height-1);
	}
}
//Problem 5: ReverseString
string ReverseString(string str) {
	string result = "";
	for (int i = str.size()-1; i >=0; i--) {
		result += str[i];
	}
	return result;
}
string RecReverseString(string soFar="", string str="") {
	if (str == "") return soFar;
	else {
		soFar += str[str.size()-1];
		str.erase(str.size()-1,1);
		return  RecReverseString(soFar, str);
	}
}

void testReverseString(){
	string s = "abcd";
	cout << ReverseString(s) << endl;
	cout << RecReverseString("", s) << endl;
}
//Problem 6: GCD
int GCD(int x, int y) {
	if ( x % y == 0 ) return y;
	else {
		int remainder = x % y;
		return  GCD(y, remainder);
	}
}
void testGCD(int x, int y) {
	if (x >= 0 && y >= 0) {	
		cout << GCD(x, y) << endl;
	}
}
//Problem 7: Old-Fashioned Measuring
void sumVector(Vector<int> vect) {
	int result = 0;
	for (int i = 0; i < vect.size(); i++) {
		result += vect[i];
	}
	return result;
}
bool RecIsMeasurable(int target, Vector<int> & weights, Vector<int> & opposite, Vector<int> & off) {
	int o, w, off = 0;
	w = sumVector(weights);
	o = sumVector(opposite);	
	if (weights == target + opposite) return true;
	else {
		int swap	
	}	
}
bool IsMeasurable(int target, Vector<int> & weights) {
	
}
void testIsMeasurable(int x) {
	Vector<int> sampleWeights;
	sampleWeights.add(1);
	sampleWeights.add(3);
	cout << boolalpha << IsMeasurable(x, sampleWeights);

}

int main ()
{
//	cout << Cannonball(4) << endl;
	//testCartesian();
	//ListMnemonics("703");
	//testReverseString();
	testGCD(100,60);
	return 0;
}
