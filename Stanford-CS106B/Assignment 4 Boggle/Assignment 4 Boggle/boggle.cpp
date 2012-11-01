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
char chooseLetter(string cubes[], int cubeIndex) {
	int letterIndex = RandomInteger(0,5); //randomly choose letter from string
	return cubes[cubeIndex][letterIndex];
}
/* shuffles the game board letters */
void Shuffle(string cubes[], Grid<char> & board, Set<int> & usedCubes) {
	int nCubes = board.numCols() * board.numRows();
	for (int i = 0; i < board.numCols(); i++) { //traverse board row & cols
		for (int j = 0; j < board.numRows(); j++) {			
			int cubeIndex;
			while (true) { //select a random cube not already selected
				cubeIndex = RandomInteger(0, nCubes-1); 
				if (!usedCubes.contains(cubeIndex)) break;
			}
			usedCubes.add(cubeIndex);
			char letter = chooseLetter(cubes, cubeIndex);
			board.setAt(i, j, letter);
			LabelCube(i, j, letter);
		}
	}
}
void Setup(	int boardSize, Grid<char> &board) {
	Randomize();	
	Set<int> usedCubes; //tracks which dice have been used
	DrawBoard(boardSize, boardSize);
	Shuffle(StandardCubes, board, usedCubes);	
}
struct squareT {	
	int row;
	int col;	
};
int CompareSquares(squareT A, squareT B) { //callback for struct squareT 
	if (A.col > B.col ) return 1;
	else if (A.col < B.col ) return -1;
	else { //both have same col
		if (A.row > B.row) return 1;
		else if (A.row < B.row ) return -1;
		else return 0;
	}
}
//void printSolution (Stack<int> solution){
//	cout << "solution: ";
//	while ( !solution.isEmpty() ) {
//		cout << solution.pop() << ", ";
//	}
//	cout << endl;
//}
bool isValidSquare(string input, string soFar, squareT square , squareT prevSquare, Grid<char> & board) {
	bool inputContainsSoFar = input.find(soFar) == 0; //soFar substring is part of the word 'input'
	bool isValidCol = 0 <= square.col && square.col <= board.numCols()-1; //within bounds
	bool isValidRow = 0 <= square.row && square.row <= board.numRows()-1; //within bounds
	bool notBacktracking = CompareSquares(square, prevSquare); //unique square
	bool result = inputContainsSoFar &&  notBacktracking && isValidCol && isValidRow ;
	cout << "returning " << boolalpha << result << endl;
	return result;
}
/* 
 * Recursively searches for a valid path containing the letters of the user's word (input)
 * Starts at square (0, 0) and iterates recursively all surrounding squares
 * returns Set<squareT> as solution
 */
Set<squareT> WordPath(string input, string soFar, squareT square, squareT prevSquare, 
				 Grid<char> &board, Set<squareT> solution) {
	if (soFar == input) return solution;
	if (soFar == "" || soFar.length() < input.length() || isValidSquare(input, soFar, square, prevSquare, board) ) { //permutation gatekeeper
		char newLetter = board.getAt(square.row, square.col);
		soFar += newLetter;		
		solution.add(square);
		for (int i = -1; i <= 1; i++) { //traverse surrounding squares by row and column position
			for (int j = -1; j <= 1; j++) {
				squareT newSquare = {square.row + j, square.col + i};
				WordPath(input, soFar, newSquare, square, board, solution) ;
			}
		}		
	} else {
		Set<squareT> empty(CompareSquares); 
		return empty;
	}
}
/*ensures input is valid */
bool ValidInput(string input, Lexicon &lex, Set<string> playedWords, Grid<char> &board) {
	if (input.length() >= 4 && lex.containsWord(input) && !playedWords.contains(input) ) {
		squareT square = {0, 0};
		squareT prevSquare = {board.numRows(), board.numCols()};
		Set<squareT> emptySet(CompareSquares);
		Set<squareT> solution(CompareSquares) = WordPath(input, "", square, prevSquare, board, emptySet);
	return solution.size() > 0 ;
	}
}
void Play(Grid<char> & board) {
	cout << "play..." << endl;
	Lexicon lex("lexicon.dat");
	
	Vector<Set<string> > playedWordLists; //tracks already inputted words for each players
	Set<string> humanPlayedWords;
	Set<string> compPlayedWords;
	playedWordLists.add(humanPlayedWords);
	playedWordLists.add(compPlayedWords);

	playerT player = Human;
	string input = GetLine();
	if (ValidInput(input, lex, playedWordLists[player], board) ) {
		cout << "That's a good word!" << endl;
	}
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