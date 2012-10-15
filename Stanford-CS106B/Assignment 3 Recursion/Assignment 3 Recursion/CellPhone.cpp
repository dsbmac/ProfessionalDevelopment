#include "CellPhone.h"

CellPhone::CellPhone(void)
{
}
void CellPhone::ListCompletions(string sequence,  Lexicon  &  lex) {
	RecListCompletions("", sequence, lex);	
}
void CellPhone::RecListCompletions(string prefix, string sequence,  Lexicon  &  lex) {
	if (sequence == "") { //used all possible letters
		if (lex.containsPrefix( prefix ) ){
			cout << endl << "prefix: " << prefix	 << endl;
			ListWords(prefix, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", lex); //list possible words of made prefix
		}
	}
	else {
		string options = DigitToLetters( sequence[0] );
		for (int i = 0 ; i < options.length(); i++) { //traverse keypad letters
			string newPrefix = prefix + options[i]; //current prefix + one letter from options
			if (lex.containsPrefix( newPrefix )) { //filter valid prefixes
				RecListCompletions(newPrefix, sequence.substr(1), lex) ; //decrement sequence
			}
		}
	}
}
void CellPhone::ListWords(string prefix, string alphabet, Lexicon & lex) {
	//cout << endl << "word so far: " << prefix << endl;
	if ( lex.containsWord( prefix ) ) cout << prefix << endl;
	if ( alphabet.length() > 0 ) {
		for ( int i = 0; i < alphabet.length() ; i++) {
			string newWord = prefix + alphabet[i];
			if (lex.containsPrefix(newWord) ) {
				ListWords(newWord, alphabet, lex ) ;
			}
		}		
	}
}
string CellPhone::DigitToLetters(char ch)
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
CellPhone::~CellPhone(void)
{
}
