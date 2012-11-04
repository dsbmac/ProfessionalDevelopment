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
typedef Vector<Set<string> > MasterWordList;
struct squareT {	
	int row;
	int col;	
};
int CompareSquares(squareT A, squareT B) { //callback for struct squareT 
	if (A.col > B.col ) return 1; //larger column
	else if (A.col < B.col ) return -1;
	else { //both have same col
		if (A.row > B.row) return 1;
		else if (A.row < B.row ) return -1;
		else return 0;
	}
}
char chooseLetter(string cubes[], int cubeIndex) {
	return cubes[cubeIndex][RandomInteger(0,5)];
}
char RandomLetter(int nCubes, string cubes[], Set<int> & usedCubes) {
	int cubeIndex = RandomInteger(0, nCubes-1); 
	while (usedCubes.contains(cubeIndex)) { //ensure random cube not already selected
		cubeIndex = RandomInteger(0, nCubes-1); 
	}
	usedCubes.add(cubeIndex);
	return chooseLetter(cubes, cubeIndex);
}
/* shuffles the game board letters */
void FillBoardWithLetters(string cubes[], Grid<char> & board, Set<int> & usedCubes, string custom="") {
	int nCubes = board.numCols() * board.numRows();
	for (int i = 0; i < board.numRows(); i++) { //traverse board row & cols
		for (int j = 0; j < board.numCols(); j++) {	
			char letter;
			if (custom != "") { //custom board layout
				int customIndex = i * board.numCols() + j;
				letter = custom[customIndex];
			} else letter = RandomLetter(nCubes, cubes, usedCubes);

			board.setAt(i, j, letter);
			LabelCube(i, j, letter);
		}
	}
}
void PrintSolution(Set<squareT> &path) {
	cout << "printing solution..." << endl;
	if (!path.isEmpty()) {
		Set<squareT>::Iterator iter = path.iterator();
		while(iter.hasNext()){
			squareT square = iter.next();
			cout << square.row << ", " << square.col << endl;
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
void ClearHighlights(Grid<char> &board) {
	for (int i = 0 ; i < board.numRows(); i++) {
		for (int j = 0 ; j < board.numCols(); j++) {
			HighlightCube(i, j, false);
		}
	}
}
void RecordWord(string word, Set<squareT> &solution, Grid<char> &board,
				playerT player, MasterWordList &playedWords) {
	playedWords[player].add(word);
	HighlightWord(solution);
	RecordWordForPlayer(word, player);
	if (player == Computer) {
		Pause(.7);
		ClearHighlights(board);
		Pause(0.2);
	}
}

void Setup(	int boardSize, Grid<char> &board, string custom="") {
	Randomize();	
	Set<int> usedCubes; //tracks which dice have been used
	DrawBoard(boardSize, boardSize);
	FillBoardWithLetters(StandardCubes, board, usedCubes, custom);	
}

/*ensures input is valid
checks within bounds
checks list
*/
bool isValidInput(string input, Lexicon &lex, playerT player, MasterWordList &playedWords) {
	if (input.length() >= 4 && lex.containsWord(input)) {
		for (int i = 0; i <= player; i++) { //look through which list			
			if (playedWords[i].contains(input) ) return false;
		}
		return true;
	} else return false;
}
bool isValidSquare(squareT square, Grid<char> & board, Set<squareT> &solution) {	
	if (solution.contains(square)) return false;
	bool isValidCol = 0 <= square.col && square.col <= board.numCols()-1; //within bounds
	bool isValidRow = 0 <= square.row && square.row <= board.numRows()-1; //within bounds
	return isValidCol && isValidRow ;
}
/* 
 * Recursively searches for a valid path containing the letters of the user's word (input)
 * Starts at square (0, 0) and iterates recursively all surrounding squares
 * returns Set<squareT> as solution
 */
bool FindPath(string input, int index, squareT square, Set<squareT> solution, Grid<char> &board
						 , Lexicon &lex, playerT player, MasterWordList &playedWords) {
	if ( !isValidSquare(square, board, solution) ) return false;
	if ( board.getAt(square.row, square.col) != input[index] ) return false ;
	solution.add(square);
	index++;
	if (index == input.length() && isValidInput(input, lex, player, playedWords)) {
		RecordWord(input, solution, board, player, playedWords);
		return true;
	}
	for (int i = -1; i <= 1; i++) { //traverse surrounding squares by row and column 
		for (int j = -1; j <= 1; j++) {
			squareT newSquare = {square.row + i, square.col + j};	
			if ( FindPath(input, index, newSquare, solution, board, lex, player, playedWords) ) {
				return true;
			}
		}
	}
	return false;
}

void CompFindWords(string prefix, squareT square, Set<squareT> solution, Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords) {
	if (!isValidSquare(square, board, solution)) return;
	prefix += board.getAt(square.row, square.col);				
	if (!lex.containsPrefix(prefix) ) return;
	solution.add(square);
	if ( isValidInput(prefix, lex, player, playedWords)) {
		RecordWord(prefix, solution, board, player, playedWords);
		return;
	}
	for (int i = -1; i <= 1; i++) { //traverse surrounding squares
		for (int j = -1; j <= 1; j++) {
			squareT newSquare = {square.row + i, square.col + j};	
			CompFindWords(prefix, newSquare, solution, board, lex, player, playedWords ) ;
		}			
	}
	return;
}

/*uses traverse for both human and comp but call different recursive functions respectively */
void TraverseBoard(Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords, string input="") {
	Set<squareT> solution(CompareSquares);
	for (int i = 0; i < board.numRows(); i++) { //traverse surrounding squares by row and column position
		for (int j = 0; j < board.numCols(); j++) {
			squareT square = {i, j};
			if (player == Computer) {
				CompFindWords("", square, solution, board, lex, player, playedWords);
			}
			else if (FindPath(input, 0, square, solution, board, lex, player, playedWords)) return;
		}
	}
	if (player == Human) cout << "Word not found!" << endl;
}
void HumanPlay(Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords) {
	cout << "Enter words: " << endl;
	while(true) {
		string input = GetLine();
		ClearHighlights(board);
		input = ConvertToUpperCase(input);
		if (input == "") break;
		if (isValidInput(input, lex, player, playedWords) ) {
			TraverseBoard(board, lex, player, playedWords, input) ;
		}
	}	
}
void CompPlay(Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords) {
	TraverseBoard(board, lex, player, playedWords) ;
}
void Play(Grid<char> & board) {
	//setup wordLists and lexicon to track valid words
	Lexicon lex("lexicon.dat");	
	MasterWordList playedWords; //tracks already inputted words for each players
	for (int i = 0; i < 2; i++) {
		Set<string> empty;
    	playedWords.add(empty);
	}

	playerT player = Human;	
	HumanPlay(board, lex, player, playedWords);
	player = Computer;
	CompPlay(board, lex, player, playedWords);
}
int main()
{
	SetWindowSize(9, 5);
	InitGraphics();
	//Welcome();
	//GiveInstructions();
	int boardSize = 4; 
	Grid<char> board(boardSize, boardSize); //board used to collect dice letters
	Setup(boardSize, board, "");
	Play(board);	
	return 0;
}