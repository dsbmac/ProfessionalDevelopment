#pragma once
#include "genlib.h"
#include "strutils.h"
#include "set.h"
#include "map.h"
#include "vector.h"
#include "strutils.h"
#include "queue.h"
#include "stack.h"
#include "lexicon.h"
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
	Stack<string> makeCombos(string prefix, string rest, Lexicon & lex, Stack<string> & prefixes);
	void BuildWords(string word, string alphabet, Stack<string> & prefixes, Lexicon & lex, Set<string> & words) ;
	string DigitLetters(char ch);
};
