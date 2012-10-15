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
#include "set.h"
#include "strutils.h"

void RecPermute(string soFar, string rest) 
{
	if ( rest == "") {
		 cout << soFar << endl;
	} else {
		for (int i = 0; i < rest.length(); i++) {
			string next = soFar + rest[i];
			string remaining = rest.substr(0,i) + rest.substr(i+1);
			RecPermute(next, remaining);
		}
	}
}
int BSearch(Vector<string> &v,
			int start, int stop, string key)
{
	if (start > stop) return -1;
	int mid= (start + stop) / 2;
	if (key == v[mid]) return mid;
	else if (key < v[mid])
		return BSearch(v, start, mid-1, key);
	else
		return BSearch(v, mid+1, stop, key);
}
struct pointT {
	int row;
	int col;
};
int ComparePointTs(pointT a, pointT b) {
	if ( a.row == b.row ) {
		if (a.col == b.col) return 0;
		else if (a.col < b.col) return -1;
	else if ( a.row < b.row ) return -1;
	return 1;
	}
}
int sumVect(Vector<int> v) {
	int sum = 0;
	for (int i = 0 ; i < v.size(); i++) {
		sum += v[i];
	}
	return sum;
}
int CompareVect(Vector<int> a, Vector<int> b) {
	int sumA = sumVect(a);
	int sumB = sumVect(b);
	if ( sumA == sumB) return 0;
	else if ( sumA < sumB ) return -1;
	return 1;
}
int main() {
	Set<int> test;
	test.add(0);
	test.add(1);
	test.add(2);
	Set<Vector<int> > testSet(CompareVect);
	Vector<int> a;
	Vector<int> b;
	a.add(1);
	a.add(2);
	b.add(1);
	//b.add(2);
	testSet.add(a);
	cout << IntegerToString(test.find("0") ) << endl;

}
