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

int main() {
	Set<pointT> points(ComparePointTs);
	pointT a = {0,0};
	pointT b = {1,1};
	points.add(a);
	points.add(b);
	string s = "A";
	string t = "B";
	cout << boolalpha << s.compare(t) << endl;

}
