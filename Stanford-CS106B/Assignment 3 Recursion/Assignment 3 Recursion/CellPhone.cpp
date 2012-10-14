#include "CellPhone.h"

CellPhone::CellPhone(void)
{
}
void CellPhone::ListCompletions(string sequence,  Lexicon  &  lex) {
	Stack<string> empty;
	Stack<string> prefixes = makeCombos("", sequence, lex, empty);	
	string alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	Set<string> words;
	BuildWords("", alphabet, prefixes, lex, words);
}
string CellPhone::DigitLetters(char ch)
{
  switch (ch) {
    case '0': return ("0");
    case '1': return ("1");
    case '2': return ("ABC");
    case '3': return ("DEF");
    case '4': return ("GHI");
    case '5': return ("JKL");
    case '6': return ("MNO");
    case '7': return ("PQRS");
    case '8': return ("TUV");
    case '9': return ("WXYZ");
    default: Error("Illegal digit");
  }
}
void CellPhone::BuildWords(string word, string alphabet, Stack<string> & prefixes, Lexicon & lex, Set<string> & words) {
	if (lex.containsWord(word) && !words.contains(word) ) {
		words.add(word);
		cout << word << endl;
		return;
	} else if ( alphabet == "") {
		return;
	}
	else {
		while(!prefixes.isEmpty() ) {
			string base = prefixes.pop();	
			for ( int i = 0; i < alphabet.length(); i++) {
				string newWord = base + alphabet[i];
				if (lex.containsPrefix(newWord)) {
					prefixes.push(newWord);					
					BuildWords(newWord, alphabet, prefixes, lex, words);								
				}			
			}
			BuildWords(base, "", prefixes, lex, words);
		}		
	}
}
Stack<string> CellPhone::makeCombos(string prefix, string rest, Lexicon & lex, Stack<string> & prefixes) {
	if ( rest.length() == 0 ) {
			prefixes.push(prefix);
	}
	else {
		string options = DigitLetters( rest[0] );
		for ( int i = 0; i < options.length(); i++) {
			if (lex.containsPrefix(newPrefix)) {
				makeCombos(prefix + options[i], rest.substr(1), lex, prefixes);			
			}			
		}
	}
	return prefixes;
}
CellPhone::~CellPhone(void)
{
}
