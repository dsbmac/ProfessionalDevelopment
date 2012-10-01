/*
 * File: airports.cpp
 * ------------------
 * This program looks up a three-letter airport code in a Map object.
 */
#include "genlib.h"
#include "simpio.h"
#include "strutils.h"
#include "map.h"
#include <iostream>
#include <fstream>
#include <string>
/* Private function prototypes */
void ReadCodeFile(Map<string> & map);
/* Main program */
int main() {
Map<string> airportCodes;
ReadCodeFile(airportCodes);
while (true) {
cout << "Airport code: ";
string code = ConvertToUpperCase(GetLine());
if (code == "") break;
if (airportCodes.containsKey(code)) {
cout << code << " is in " << airportCodes.get(code) << endl;
} else {
cout << "There is no such airport code" << endl;
}
}
return 0;
}
/* Reads the data file into the map */
void ReadCodeFile(Map<string> & map) {
ifstream infile;
infile.open("AirportCodes.txt");
if (infile.fail()) Error("Can't read the data file");
while (true) {
string line;
getline(infile, line);
if (infile.fail()) break;
if (line.length() < 4 || line[3] != '=') {
Error("Illegal data file line: " + line);
}
string code = ConvertToUpperCase(line.substr(0, 3));
map.put(code, line.substr(4));
}
infile.close();
}