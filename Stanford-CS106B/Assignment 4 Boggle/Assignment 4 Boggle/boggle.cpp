/* File: boggle.cpp
 * ----------------
 * Your name here!
 */
 
#include "genlib.h"
#include "simpio.h"
#include <iostream>
#include "extgraph.h"
#include "gboggle.h"
#include "lexicon.h"
#include "grid.h"
#include "random.h"
#include "set.h"
#include "stack.h"

string StandardCubes[16]  = 
{"AAEEGN", "ABBJOO", "ACHOPS", "AFFKPS", "AOOTTW", "CIMOTU", "DEILRX", "DELRVY",
 "DISTTY", "EEGHNW", "EEINSU", "EHRTVW", "EIOSST", "ELRTTY", "HIMNQU", "HLNNRZ"};
 
string BigBoggleCubes[25]  = 
{"AAAFRS", "AAEEEE", "AAFIRS", "ADENNN", "AEEEEM", "AEEGMU", "AEGMNN", "AFIRSY", 
"BJKQXZ", "CCNSTW", "CEIILT", "CEILPT", "CEIPST", "DDLNOR", "DDHNOT", "DHHLOR", 
"DHLNOR", "EIIITT", "EMOTTT", "ENSSSU", "FIPRSY", "GORRVW", "HIPRRY", "NOOTUW", "OOOTTU"};

void GiveInstructions()
{
    cout << endl << "The boggle board is a grid onto which I will randomly distribute " 
	 << "cubes. These 6-sided cubes have letters rather than numbers on the faces, " 
	 << "creating a grid of letters on which you try to form words. You go first, " 
	 << "entering all the words you can find that are formed by tracing adjoining " 
	 << "letters. Two letters adjoin if they are next to each other horizontally, " 
	 << "vertically, or diagonally. A letter can only be used once in the word. Words "
	 << "must be at least 4 letters long and can only be counted once. You score points "
	 << "based on word length: a 4-letter word is worth 1 point, 5-letters earn 2 "
	 << "points, and so on. After your puny brain is exhausted, I, the super computer, "
	 << "will find all the remaining words and double or triple your paltry score." << endl;
	
    cout << "\nHit return when you're ready...";
    GetLine();
}

static void Welcome()
{
    cout << "Welcome!  You're about to play an intense game of mind-numbing Boggle. " 
	 << "The good news is that you might improve your vocabulary a bit.  The "
	 << "bad news is that you're probably going to lose miserably to this little "
	 << "dictionary-toting hunk of silicon.  If only YOU had a gig of RAM..." << endl << endl;
}
struct squareT {	
	int row;
	int col;	
};
enum directionT { North, NE, East, SE, South, SW, West, NW };
squareT AdjacentSquare(squareT sq, directionT dir) {
    squareT newSquare = sq;
    switch (dir) {
      case North: newSquare.row--; break;
	  case NE: newSquare.row--; newSquare.col++; break;
      case East:  newSquare.col++; break;
	  case SE: newSquare.row++; newSquare.col++; break;
      case South: newSquare.row++; break;
	  case SW:  newSquare.row++; newSquare.col--; break;
      case West:  newSquare.col--; break; 
	  case NW: newSquare.row--; newSquare.col--; break;	  
    }
    return newSquare;
}
char chooseLetter(string cubes[], int cubeIndex) {
	int letterIndex = RandomInteger(0,5); //randomly choose letter from string
	return cubes[cubeIndex][letterIndex];
}
/* shuffles the game board letters */
void Shuffle(string cubes[], Grid<char> & board, Set<int> & usedCubes) {
	int nCubes = board.numCols() * board.numRows();
	for (int i = 0; i < board.numCols(); i++) { //traverse board row & cols
		for (int j = 0; j < board.numRows(); j++) {	
			int cubeIndex = RandomInteger(0, nCubes-1); 
			while (usedCubes.contains(cubeIndex)) { //ensure random cube not already selected
				cubeIndex = RandomInteger(0, nCubes-1); 
			}
			usedCubes.add(cubeIndex);
			char letter = chooseLetter(cubes, cubeIndex);
			board.setAt(i, j, letter);
			LabelCube(i, j, letter);
		}
	}
}
void HighlightWord(Set<squareT> &path) {
	Set<squareT>::Iterator iter = path.iterator();
	while(iter.hasNext()){
		squareT square = iter.next();
		HighlightCube(square.row, square.col, true);
	}
}
void PrintSolution(Set<squareT> &path) {
	Set<squareT>::Iterator iter = path.iterator();
	while(iter.hasNext()){
		squareT square = iter.next();
		cout << square.row << ", " << square.col << endl;
	}
}
void Setup(	int boardSize, Grid<char> &board) {
	//Randomize();	
	Set<int> usedCubes; //tracks which dice have been used
	DrawBoard(boardSize, boardSize);
	Shuffle(StandardCubes, board, usedCubes);	
}
void ClearHighlights(Grid<char> &board) {
	for (int i = 0 ; i < board.numRows(); i++) {
		for (int j = 0 ; j < board.numCols(); j++) {
			HighlightCube(i, j, false);
		}
	}
}

int CompareSquares(squareT A, squareT B) { //callback for struct squareT 
	if (A.col > B.col ) return 1; //larger column
	else if (A.col < B.col ) return -1;
	else { //both have same col
		if (A.row > B.row) return 1;
		else if (A.row < B.row ) return -1;
		else return 0;
	}
}
bool isValidSquare(squareT square, Grid<char> & board, Set<squareT> &solution) {	
	if (solution.contains(square) ) return false;
	bool isValidCol = 0 <= square.col && square.col <= board.numCols()-1; //within bounds
	bool isValidRow = 0 <= square.row && square.row <= board.numRows()-1; //within bounds
	bool result = isValidCol && isValidRow ;
	return result;
}
/* 
 * Recursively searches for a valid path containing the letters of the user's word (input)
 * Starts at square (0, 0) and iterates recursively all surrounding squares
 * returns Set<squareT> as solution
 */
Set<squareT> WordPathRec2(string input, squareT square, Grid<char> &board,
						  Set<squareT> solution, Set<squareT> &searchedSquares) {
	cout << endl << input << " " << square.row << " " << square.col << endl ;
	cout << "searchedSquares size: " << searchedSquares.size() << " solution size " << solution.size() << endl;
	GetLine();				
	if (input == "") return solution;
	else {
		for (int i = -1; i <= 1; i++) { //traverse surrounding squares by row and column 
			for (int j = -1; j <= 1; j++) {
				squareT newSquare = {square.row + i, square.col + j};
				if (isValidSquare(newSquare, board, solution) ) cout << newSquare.row << ", " << newSquare.col << " is valid" << endl;
				else cout << newSquare.row << ", " << newSquare.col << " is invalid" << endl;
				if (isValidSquare(newSquare, board, solution) ) {
					if (board.getAt(newSquare.row, newSquare.col) == input[0]) {
						cout << "found a letter" << endl;
						Set<squareT> newSolution = solution;
						newSolution.add(newSquare);
						Set<squareT> soln = WordPathRec2(input.substr(1), newSquare, board, newSolution, searchedSquares) ;
						if (!soln.isEmpty()) return soln;
					}
					if ( !searchedSquares.contains(newSquare) && searchedSquares.size() < board.numRows() * board.numCols()) {
						cout << "haven't found a letter yet" << endl;
						searchedSquares.add(newSquare);
						solution.clear();
						return WordPathRec2(input, newSquare, board, solution, searchedSquares) ;				
					}
				}
			}
		}
		Set<squareT> empty(CompareSquares);
		return empty;
	}
}
Set<squareT> WordPathRec(string input, squareT square, Grid<char> &board, Set<squareT> solution) {
	if (input == "") return solution;
	else {	
		for (int i = -1; i <= 1; i++) { //traverse surrounding squares by row and column 
			for (int j = -1; j <= 1; j++) {
				squareT newSquare = {square.row + i, square.col + j};
				if (isValidSquare(newSquare, board, solution) ) cout << newSquare.row << ", " << newSquare.col << " is valid" << endl;
				else cout << newSquare.row << ", " << newSquare.col << " is invalid" << endl;
				if ( isValidSquare(newSquare, board, solution) && board.getAt(newSquare.row, newSquare.col) == input[0] ) {
					Set<squareT> newSolution = solution;
					newSolution.add(newSquare); 
					Set<squareT> soln = WordPathRec(input.substr(1), newSquare, board, newSolution) ;
					if (!soln.isEmpty()) return soln;
				}
			}
		}
		Set<squareT> empty(CompareSquares);
		return empty;
	}
}
Set<squareT> FindPath(string input, Grid<char> &board) {
	for (int i = 0; i < board.numRows(); i++) { //traverse surrounding squares by row and column position
		for (int j = 0; j < board.numCols(); j++) {
			if (board.getAt(i, j) == input[0]) { //if first letter of word is found then call recursive function to find solution
				squareT square = {i, j};
				Set<squareT> solution(CompareSquares);
				solution.add(square);
				Set<squareT> path = WordPathRec(input.substr(1), square, board, solution);
				if (!path.isEmpty()) return path;
			}
		}
	}
	Set<squareT> empty (CompareSquares);
	return empty;
}

/*ensures input is valid */
bool isValidInput(string input, Lexicon &lex, Set<string> playedWords) {
	return input.length() >= 4 && lex.containsWord(input) && !playedWords.contains(input) ;
	//	Set<squareT> path = FindPath(input, board);		
	//	//Set<squareT> searchedSquares(CompareSquares);
	//	//Set<squareT> solution(CompareSquares);
	//	//squareT square = {0,0};
	//	//Set<squareT> path = WordPathRec2(input, square, board, solution, searchedSquares);
	//	HighlightWord(path);
	//	return !path.isEmpty();
	//} return false;
}


//void CellPhone::ListCompletions(string sequence,  Lexicon  &  lex) {
//	RecListCompletions("", sequence, lex);	
//}
//void CellPhone::RecListCompletions(string prefix, string sequence,  Lexicon  &  lex) {
//	if (sequence == "") { //used all possible letters
//		if (lex.containsPrefix( prefix ) ){
//			cout << endl << "prefix: " << prefix	 << endl;
//			ListWords(prefix, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", lex); //list possible words of made prefix
//		}
//	}
//	else {
//		string options = DigitToLetters( sequence[0] );
//		for (int i = 0 ; i < options.length(); i++) { //traverse keypad letters
//			string newPrefix = prefix + options[i]; //current prefix + one letter from options
//			if (lex.containsPrefix( newPrefix )) { //filter valid prefixes
//				RecListCompletions(newPrefix, sequence.substr(1), lex) ; //decrement sequence
//			}
//		}
//	}
//}
//void CellPhone::ListWords(string prefix, string alphabet, Lexicon & lex) {
//	//cout << endl << "word so far: " << prefix << endl;
//	if ( lex.containsWord( prefix ) ) cout << prefix << endl;
//	if ( alphabet.length() > 0 ) {
//		for ( int i = 0; i < alphabet.length() ; i++) {
//			string newWord = prefix + alphabet[i];
//			if (lex.containsPrefix(newWord) ) {
//				ListWords(newWord, alphabet, lex ) ;
//			}
//		}		
//	}
//}
void RecordWord(string word, Set<squareT> &solution, Set<string> &playedWordList, Grid<char> &board) {
	playedWordList.add(word);
	HighlightWord(solution);
	playerT player = Computer;
	RecordWordForPlayer(word, Computer);
	Pause(1.5);
	ClearHighlights(board);
}
void FindWords(string prefix, squareT square, Set<squareT> solution, Grid<char> &board, Lexicon & lex, Vector<Set<string> > &playedWordLists) {
	cout << endl << "word so far: " << prefix << endl;
	PrintSolution(solution);
	if ( isValidInput(prefix, lex, playedWordLists[1])) RecordWord(prefix, solution, playedWordLists[1], board) ;
	for (int i = 0; i < board.numRows(); i++) { //traverse surrounding squares by row and column position
		for (int j = 0; j < board.numCols(); j++) {
			squareT newSquare = {square.row + i, square.col + j};
			string newWord = prefix + board.getAt(i, j) ;			
			if (isValidSquare(newSquare, board, solution) && lex.containsPrefix(newWord) ) {
				Set<squareT> newSolution = solution;
				solution.add(newSquare);
				FindWords(newWord, newSquare, solution, board, lex, playedWordLists ) ;
			}
		}		
	}
}
void ListWords(Vector<squareT> solution, Stack<Vector<squareT> > &solutions,
			   Grid<char> &board, Lexicon & lex, Vector<Set<string> > &playedWordLists) {
				   if (lex.containsWord(prefix)) RecordWord(prefix, solution, playedWordLists[1], board) ;
				   for (int i = 0; i < 8; i++) {
					   directionT dir = directionT(i);
					   squareT newSquare = AdjacentSquare(solution[solution.size()-1, dir);
					   if ( isValidSquare2(newSquare, board, solution) {
						   string newPrefix = prefix + board.getAt(newSquare.row, newSquare.col) ;		
						   if (lex.containsPrefix(newPrefix) ) {
							   Vector<squareT> newSolution = solution;
							   newSolution.add(newSquare);
							   ListWords(newSolution, solutions, board, lex, playedWordLists);
						   }
					   }
				   }
				   solutions.pop();
}


void CompPlay(Grid<char> &board, Lexicon & lex, Vector<Set<string> > &playedWordLists) {
	squareT square = {0, 0};
	Set<squareT> solution (CompareSquares);
	FindWords("", square, solution, board, lex, playedWordLists);
}
void Play(Grid<char> & board) {
	cout << "Play..." << endl;
	Lexicon lex("lexicon.dat");
	playerT player = Human;	
	//setup wordLists for played words
	Vector<Set<string> > playedWordLists; //tracks already inputted words for each players
	for (int i = 0; i < 2; i++) {
		Set<string> playedWords;
    	playedWordLists.add(playedWords);
	}

	//while(true) {
	//	string input = GetLine();
	//	ClearHighlights(board);
	//	input = ConvertToUpperCase(input);
	//	if (input == "") break;
	//	if (ValidInput(input, lex, playedWordLists[player], board) ) {
	//		cout << "That's a good word!" << endl;	
	//		playedWordLists[player].add(input);
	//		RecordWordForPlayer(input, player);
	//	} else cout << "That's invalid!" << endl;	
	//}
	CompPlay(board, lex, playedWordLists);
}
int main()
{
	SetWindowSize(9, 5);
	InitGraphics();
	//Welcome();
	//GiveInstructions();
	int boardSize = 4; 
	Grid<char> board(boardSize, boardSize); //board used to collect dice letters
	Setup(boardSize, board);
	Play(board);	
	return 0;
}