#pragma once

#include "map.h"
class Soundex
{
public:
	Soundex(void);
public:
	~Soundex(void);
private:
	Map<int> soundexMap;
	void setup();
	string parseName(string surname);
};
