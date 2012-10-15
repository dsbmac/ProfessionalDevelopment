#pragma once
#include "genlib.h"
#include "strutils.h"
#include "vector.h"
#include "lexicon.h"
#include "simpio.h"
#include <iostream>
#include <string>

class CellPhone
{
public:
	CellPhone(void);
	void ListCompletions(string sequence,  Lexicon  &  lex);
public:
	~CellPhone(void);
private:
	void RecListCompletions(string prefix, string sequence,  Lexicon  &  lex) ;
	void ListWords(string prefix, string alphabet, Lexicon & lex ) ;
	string DigitToLetters(char ch);
};
