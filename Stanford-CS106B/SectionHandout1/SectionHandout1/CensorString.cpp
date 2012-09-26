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
	

int main()
{	
	cout << "Enter string: " ;
	string uInput, chrRemove, result;
	result = "";
	//getline(cin, uInput);
	cin >> uInput;
	cout << uInput + " confirmed." << endl;
	cout << "Enter characters to remove: " ;
	cin >> chrRemove;
	//getline(cin, chrRemove);
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