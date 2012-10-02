#pragma once
#include "map.h"

class Soundex
{
public:
	Soundex(void);
private:
	string parseName(string surname, Map<int> & soundexCodes);
	void setup(Map<int> & map);
	bool isValid(string input);
	string getInput();
};
