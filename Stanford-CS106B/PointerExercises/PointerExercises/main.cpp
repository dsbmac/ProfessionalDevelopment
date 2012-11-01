/*
 * Project: PointerExercises
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */
#include "genlib.h"
#include "simpio.h"
#include "vector.h"
#include <iostream>

Vector<int> getInput() {
	int* pointer;
	Vector<int> vect;
	while(true) {	
		cout << "Enter value (enter to quit): " ;
		string input = GetLine();
		if (input  == "") break;
		int value = StringToInteger(input);
		vect.add(value);
	}
	return vect;
}

void maxValue() {
	Vector<int> = getInput();

}



int main ()
{
	maxValue();
	return 0;
}
