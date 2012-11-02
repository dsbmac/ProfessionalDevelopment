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
struct squareT {	
	int row;
	int col;	
};
typedef Vector<Set<string> > MasterWordList;

char chooseLetter(string cubes[], int cubeIndex) {
	return cubes[cubeIndex][RandomInteger(0,5)];
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
	if (!path.isEmpty()) {
		Set<squareT>::Iterator iter = path.iterator();
		while(iter.hasNext()){
			squareT square = iter.next();
			cout << square.row << ", " << square.col << endl;
		}
	}
}
void Setup(	int boardSize, Grid<char> &board) {
	Randomize();	
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
Set<squareT> WordPathRec(string input, squareT square, Set<squareT> solution, Grid<char> &board) {
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
					Set<squareT> soln = WordPathRec(input.substr(1), newSquare, newSolution,board) ;
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
				Set<squareT> path = WordPathRec(input.substr(1), square, solution, board);
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
}

void RecordWord(string word, Set<squareT> &solution, Grid<char> &board,
				playerT player, MasterWordList &playedWords) {
	playedWords[player].add(word);
	HighlightWord(solution);
	RecordWordForPlayer(word, player);
	Pause(1.);
	ClearHighlights(board);
	if (player == Computer) Pause(0.2);
}
void FindWords(string prefix, squareT square, Set<squareT> solution, Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords) {
	if ( isValidInput(prefix, lex, playedWords[1])) RecordWord(prefix, solution, board, player, playedWords) ;
	for (int i = -1; i <= 1; i++) { //traverse surrounding squares by row and column 
		for (int j = -1; j <= 1; j++) {
			squareT newSquare = {square.row + i, square.col + j};
			if (isValidSquare(newSquare, board, solution)) {
				string newWord = prefix + board.getAt(newSquare.row, newSquare.col) ;				
				if (lex.containsPrefix(newWord) ) {
					Set<squareT> newSolution = solution;
					newSolution.add(newSquare);
					FindWords(newWord, newSquare, newSolution, board, lex, player, playedWords ) ;
				}
			}
		}
	}		
}

void TraverseBoard(Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords, string input="") {
	for (int i = 0; i < board.numRows(); i++) { //traverse surrounding squares by row and column position
		for (int j = 0; j < board.numCols(); j++) {
			squareT square = {i, j};
			Set<squareT> solution(CompareSquares);
			solution.add(square);
			string prefix = "";
			prefix += board.getAt(i, j);
			if (player == Computer) FindWords(prefix, square, solution, board, lex, player, playedWords);
			else if (prefix == input.substr(0,1)) WordPathRec(input.substr(1), square, solution, board);
		}
	}
}

void CompPlay(Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords) {
	TraverseBoard(board, lex, player, playedWords) ;
}
void HumanPlay(Grid<char> &board, Lexicon & lex, playerT player, MasterWordList &playedWords) {
	while(true) {
		string input = GetLine();
		ClearHighlights(board);
		input = ConvertToUpperCase(input);
		if (input == "") break;
		if (isValidInput(input, lex, playedWords[player]) ) {
			TraverseBoard(board, lex, player, playedWords, input) ;
		}
	}	
}
void Play(Grid<char> & board) {
	Lexicon lex("lexicon.dat");
	
	//setup wordLists for played words
	MasterWordList playedWords; //tracks already inputted words for each players
	for (int i = 0; i < 2; i++) {
		Set<string> empty;
    	playedWords.add(empty);
	}

	playerT player = Human;	

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
	Setup(boardSize, board);
	Play(board);	
	return 0;
}