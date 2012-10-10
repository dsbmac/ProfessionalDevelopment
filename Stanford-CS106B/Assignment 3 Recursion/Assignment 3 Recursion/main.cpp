/*
 * Project: Assignment 3 Recursion
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

//Warm-up A: Print in binary
string RecPrintInBinary(int num) {
	if (num == 0) return "0";
	else if (num == 1) return "1";
	else {
		return RecPrintInBinary(num / 2) + IntegerToString(num % 2);
	}	
}
void PrintInBinary(int num) {
	cout << num % 2	<< endl;
	cout << num / 2	<< endl;
	cout << RecPrintInBinary(num) << endl;
}
int main ()
{
	PrintInBinary(6);
	return 0;
}
