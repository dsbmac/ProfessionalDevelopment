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
#include "TwelveStep.h"
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
	cout << "size of array: " << size << endl;
	for (int i = 0 ; i <  4; i++) {
		result.add(arr[i]);
		cout << arr[i] << endl;
	}
	return result;
}
//void testCanMakeSum() {
//	Warmup routine;
//	int target = 4;
//	//fill vector with values
//	Vector<int> nums;
//	nums.add(4);
//	nums.add(7);
//	//nums.add(1);
//	nums.add(8);
//	//nums.add(-3);
//	//set for unique vector with a callback comaparing the summed vector
//	Set<Vector<int> > numSet(CompareVect);
//	//cout << boolalpha << CanMakeSum(nums, target) << endl;
//	cout << boolalpha << CanMakeSum2(nums, target, numSet) << endl;
//}
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
void testRuler() {
	RulerOfTheWorld ruler;
	ruler.DrawRuler(0.0, 0.0, 10.0, 4.0);
}
void testCellPhone() {
	CellPhone test;
	Lexicon lex("lexicon.dat");
	string sequence = "9956";
	test.ListCompletions(sequence, lex);
}
void testStock() {
	int cuts [] =  {4, 7, 1};
	Vector<int> requests;
	for (int i = 0 ; i <  sizeof cuts/sizeof(int); i++) {
		requests.add(cuts[i]);
	}
	Stock job;
	int stockLength = 10;
	job.CutStock(requests, stockLength); 
}
void testVote() {
	int nums [] = {4,2,7,4};
	Vector<int> block = arrayTransfer(nums);
	Vote election;
	int target = 3;
	election.CountCriticalVotes(block, target);
}

int main ()
{
	//PrintInBinary(6);
	//testCanMakeSum();
	/*TwelveStep climbStairs;
	cout << climbStairs.CountWays(10);*/
	//testRuler();
	//testPuzzle();
	//testCellPhone();
	//testStock();
	testVote();
	return 0;
}
