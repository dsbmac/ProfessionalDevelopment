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
#include "queue.h"
#include "stack.h"
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
//Problem 2: Maps
struct pointT {
	int x, y;
};
struct cityT {
	string name;		
};
cityT lookupCity(string loc, Map<cityT>  cities) {
	return cities.getValue(loc);
}
string PointToString(pointT point) {
	string result = IntegerToString(point.x) + "," + IntegerToString(point.y);
	return result;
}
void addCity(Map<cityT>  &cities, cityT city, pointT point ) {
	string key = PointToString(point);
	cout << key << endl;
	cities.add(key, city);
}
void testLookupCity() {
	Map<cityT> cities;
	cityT mtl = {"Montreal"};
	pointT pt = {47, 80};
	addCity(cities, mtl, pt);
	lookupCity("47,80", cities);
}
//Problem 3: Cartesian Products
struct pairT { //basic unit for this function
	string first, second;
};
int ComparePairs(pairT a, pairT b) {
	int firstComparison = a.first.compare(b.first);
	if (firstComparison == 0) {
		return a.second.compare(b.second);
	}
	return firstComparison;
}
Set<pairT> CartesianProduct(Set<string> & one, Set<string> & two) {
	Set<pairT> result(ComparePairs);
	Set<string>::Iterator iter = one.iterator();	
	while(iter.hasNext()) {
		string first = iter.next();
		Set<string>::Iterator iter2 = two.iterator();
		while(iter2.hasNext()) {			
			string second = iter2.next();
			cout << second << endl;
			pairT product = {first, second};
			result.add(product);
		}
	}
	return result;
}
void testCartesian(){
	//fill up sets
	Set<string> one;
	one.add("A");
	one.add("B");
	one.add("C");
	Set<string> two;
	two.add("X");
	two.add("Y");
	Set<pairT> products = CartesianProduct(one, two);
	//print out values
	Set<pairT>::Iterator iter = products.iterator();	
	while(iter.hasNext()) {
		pairT product = iter.next();
		string first = product.first;
		string second = product.second;
		cout << first << ", " << second << endl;
	}
}
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
string RecReverseString2(string str) {
	if (str.length() == 0) return "";
	return  RecReverseString2(str.substr(1) ) + str[0];
}
void testReverseString(){
	string s = "abcd";
	cout << ReverseString(s) << endl;
	cout << RecReverseString("", s) << endl;
	cout << RecReverseString2(s) << endl;
}
//Problem 6: GCD
/*If x is evenly divisible by y, then y is the greatest common divisor. Otherwise, the
greatest common divisor of x and y is always equal to the greatest common
divisor of y and the remainder of x divided by y.*/
int GCD(int x, int y) {
	if ( x % y == 0 ) return y;
	else {
		return  GCD(y, x % y); //remainder of x divided by y
	}
}
void testGCD(int x, int y) {
	if (x >= 0 && y >= 0) {	
		cout << GCD(x, y) << endl;
	}
}
//Problem 7: Old-Fashioned Measuring
int sumVector(Vector<int> vect) {
	int result = 0;
	for (int i = 0; i < vect.size(); i++) {
		result += vect[i];
	}
	return result;
}
bool RecMakeCombos(int target, Vector<int> & weights, int index) {	
	cout << "rec..." << endl;
	if (target == 0) return true;
	if (index >= weights.size() ) return false;
	return RecMakeCombos(target + weights[index], weights, index + 1) || //weight on target side
		RecMakeCombos(target - weights[index], weights, index + 1) || //weight on opposite side
		RecMakeCombos(target, weights, index + 1); //weight left off
}
bool IsMeasurable(int target, Vector<int> & weights) {
	return RecMakeCombos(target, weights, 0);
}
void testIsMeasurable(int x) {
	Vector<int> weights;
	weights.add(1);
	weights.add(3);
	cout << boolalpha << IsMeasurable(x, weights);
}
//Problem 8: List Mnemonics
void makeCombos(string prefix, string rest, Map<string> & keypad ) {
	if ( rest.length() == 0 ) cout << prefix << endl;
	else {
		string options = keypad.getValue( rest.substr(0,1) );
		for (int i = 0 ; i < options.length(); i++) {
			makeCombos( prefix + options[i], rest.substr(1), keypad ) ;
		}
	}
}
void ListMnemonics(string str) {
	Map <string> keypad; //maps letters to keypad nums
	keypad.add("0", "0");
	keypad.add("1", "1");
	string alpha = "abcdefghijklmnoprstuvwxy"; //fill keypad map
	for (int i = 0; i <= 7; i++) {
		keypad.add( IntegerToString(i+2), alpha.substr((i*3), 3) ); 
	}
	string prefix = "";
	makeCombos(prefix, str, keypad);
}
int main ()
{
//	cout << Cannonball(4) << endl;
	//testLookupCity();
	//testCartesian();
	//testReverseString();
	//testGCD(100,60);
	//testIsMeasurable(4);
	ListMnemonics("723");
	return 0;
}
