/*
 * Project: Assignment 3 Recursion
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */
#include <iostream>
#include <string>
#include "set.h"
#include "genlib.h"
#include "strutils.h"
#include "map.h"
#include "vector.h"
#include "strutils.h"
#include "queue.h"
#include "stack.h"
#include "Stairs.h"
#include "RulerOfTheWorld.h"
#include "Puzzle.h"
#include "CellPhone.h"
#include "Stock.h"
#include "Warmup.h"
#include "Vote.h"
using namespace std;

Vector <int> arrayTransfer(int arr []) {
	Vector <int> result;
	int size = sizeof arr/sizeof(int);
	for (int i = 0 ; i <  4; i++) {
		result.add(arr[i]);
		cout << arr[i] << endl;
	}
	return result;
}

//1. The 12-step program to recursive enlightenment
void testStairs() {
	Stairs stairs;
	cout << IntegerToString( stairs.CountWays(5) ) << endl;
}

//2. Ruler of the world
void testRuler() {
	RulerOfTheWorld ruler;
	ruler.DrawRuler(0.0, 0.0, 10.0, 4.0);
}

//3. Every vote counts
void testVote() {
	//parameters
	int nums [] = {4,2,7,4};
	Vector<int> block = arrayTransfer(nums);
	int swing = 3;

	Vote election;
	cout << endl << "Critical Votes: " << IntegerToString( election.CountCriticalVotes(block, swing) ) << endl;
}
// 4. Cell phone mind reading
void testCellPhone() {
	//test parameters
	Lexicon lex("lexicon.dat");
	string sequence = "72547";

	CellPhone test;
	test.ListCompletions(sequence, lex);
}
void testPuzzle() {
	Puzzle puzzle;
	//int numbers [] = {3,6,4,1,3,4,2,5,3,0};
	int numbers [] = {3,1,2,3,0};
	Vector<int> squares;
	int size = sizeof numbers / sizeof numbers[0];
	cout << "size numbers: " << size << endl;
	for (int i = 0; i < size; i++) {
		squares.add(numbers[i]);
		cout << squares[i] << endl;
	}	
	int start = 0;
	cout << boolalpha << puzzle.Solvable(start, squares) << endl;
}
void testStock() {
	int cuts [] =  {4,3,4,1,7,8} ;
	Vector<int> requests;
	for (int i = 0 ; i <  sizeof cuts/sizeof(int); i++) {
		requests.add(cuts[i]);
	}
	Stock job;
	int stockLength = 10;
	cout << "final solution :" << job.CutStock(requests, stockLength) << endl; 
}


int main ()
{
	//testStairs();
	//PrintInBinary(6);
	//testCanMakeSum();	
	//testRuler();
	//testVote();
	//testPuzzle();
	//testCellPhone();
	testStock();
	
	return 0;
}

