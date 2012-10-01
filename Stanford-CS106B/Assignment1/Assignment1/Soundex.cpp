#include "genlib.h"
#include "simpio.h"
#include "strutils.h"
#include "map.h"
#include <iostream>
#include <string>
#include "soundex.h"

Soundex::Soundex()
{
/* Keep the first letter of the surname (convert to uppercase if necessary)
2. Convert all other letters in the surname to a digit using the table below (discard any non-
letter characters: dashes, spaces, and so on)
3. Remove any consecutive duplicate digits (e.g. A122235 becomes A1235)
4. Remove any zeros
5. Make resulting code exactly length 4 by truncating or padding with zeros
*/
	Map<int> soundexCodes;	
	setup(soundexCodes);
	while(true) {
		string input = getInput();	
		//quit on enter
		if (input == "") break;
		cout << "Soundex code for "  << input << " is " << parseName(input, soundexCodes) << endl;
	}
}	
string Soundex::getInput() {
	string input;
	while (true) {
			cout << "Enter surname (RETURN to quit): ";
			input = GetLine();
			if (isValid(input)) break;
			cout << "Not a valid entry." << endl;
	}
	return input;
}
bool Soundex::isValid(string input) {
	for (int i = 0; i < input.length(); i++) {
		if (!isalpha(input[i])) return false;
	}
	return true;
}
string Soundex::parseName(string surname, Map<int> & soundexCodes) {
	//keep first letter and upper case it
	string result = "";
	for (int i = 0; i < surname.length(); i ++) {
		string s = surname.substr(i,1);
		s = ConvertToUpperCase(s);
		if (i==0) {		
			result += s;
		} else {
			//convert to code
			int code = soundexCodes.getValue(s);
			s = IntegerToString(code);
			if(s != "0" && s != result.substr(result.length()-1, 1)) {
				result += s;
			}
		}
	}
	//pad with zeroes
	while(result.length() < 4 ) {
		result += "0";
	}		
	return result;
}
void Soundex::setup(Map<int> & map){
	Vector<string> codes;
	codes.add("A E I O U H W Y");
	codes.add("B F P V");
	codes.add("C G J K Q S X Z");
	codes.add("D T");
	codes.add("M N");
	codes.add("L");
	codes.add("R");
	//fill map. i will be the key and code values
	//loop through groups
	for (int i = 0; i < codes.size(); i++) {
		//traverse string and add valid values
		for (int j = 0; j < codes[i].length(); j++) {
			string key = codes[i].substr(j,1);
			if (isalpha(key[0])) map.add(key, i);
		}
	}
}