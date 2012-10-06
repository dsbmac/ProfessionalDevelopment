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
#include <iostream>

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
int CompareStrings(string a, string b) {
	string z = ConvertToLowerCase(a);
	string y = ConvertToLowerCase(b);
	if (z == y) return 0;
	else if (z < y) return -1;
	else return 1;
}

int main ()
{
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
	return 0;
}
