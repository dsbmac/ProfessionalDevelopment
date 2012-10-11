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

//Warm-up A: Print in binary
string RecPrintInBinary(int num) {
	if (num == 0) return "0";
	else if (num == 1) return "1";
	else {
		return RecPrintInBinary(num / 2) + IntegerToString(num % 2);
	}	
}
void PrintInBinary(int num) {
	cout << num % 2	<< endl;
	cout << num / 2	<< endl;
	cout << RecPrintInBinary(num) << endl;
}
//Warm-up B: Subset Sum
bool TargetIsEqual(Vector<int> & soFar, int targetSum) {
	cout << "TargetIsEqual..." << endl;
	int sum = 0;
	for(int i = 0; i < soFar.size(); i++) {
		sum += soFar[i];
	}
	cout << "result: " << sum << ":" << targetSum << endl;
	cout << "...TargetIsEqual" << endl;
	return sum == targetSum;
}
void printVector(Vector<int> & vect) {
	for (int i = 0; i < vect.size(); i++) {
		cout << vect[i] << endl;
	}
}
bool RecCanMakeSum(Vector<int> & soFar, Vector<int> & nums, int targetSum) {
	if (nums.size() == 0) return TargetIsEqual(soFar, targetSum);
	else {
		//create new vectors for each branch so they don't interfere via changes
		Vector<int> newSoFar = soFar;		
		Vector<int> newNums = nums;		

		newSoFar.add(nums[nums.size()-1]);		
		newNums.removeAt(nums.size()-1);
		nums.removeAt(nums.size()-1);
		//add to subset and recurse
		bool a = RecCanMakeSum(newSoFar , newNums , targetSum );
		//don't add to subset and recurse
		bool b = RecCanMakeSum( soFar, nums , targetSum );
		return a || b;		
	}	
}
//alternative strategy choose one from those remaining
//helper to sum a vector <int>
int sumVect(Vector<int> v) {
	int sum = 0;
	for (int i = 0 ; i < v.size(); i++) {
		sum += v[i];
	}
	return sum;
}
//set callback
int CompareVect(Vector<int> a, Vector<int> b) {
	int sumA = sumVect(a);
	int sumB = sumVect(b);
	if ( sumA == sumB) return 0;
	else if ( sumA < sumB ) return -1;
	return 1;
}
bool RecCanMakeSum2(Vector<int> & soFar, Vector<int> & nums, int targetSum, Set<Vector<int> > & numSet ) {
	cout << endl << "rec2..." << endl;
	printVector(soFar);
	if (nums.size() == 0) return TargetIsEqual(soFar, targetSum);
	if (TargetIsEqual(soFar, targetSum)) {
		cout << "this should print" << endl;
		return true;
	}
	else {
		for (int i = 0; i < nums.size(); i++) {
			cout << "i: " << i << endl;
			Vector<int> newSoFar = soFar;
			Vector<int> newNums = nums;			
			int newNumber = nums[0];
			newNums.removeAt(0);
			newSoFar.add(newNumber);
			bool a = RecCanMakeSum2(newSoFar , newNums , targetSum, numSet );
			bool b = RecCanMakeSum2(soFar , newNums , targetSum, numSet );
			return a || b;
		}		
	}	
}
bool CanMakeSum(Vector<int> & nums, int targetSum) {
	Vector<int> soFar;
	return RecCanMakeSum(soFar, nums, targetSum) ;	
}
bool CanMakeSum2(Vector<int> nums, int targetSum, Set<Vector<int> > numSet ) {
	Vector<int> soFar2;
	return RecCanMakeSum2(soFar2, nums, targetSum, numSet) ;	
}
void testCanMakeSum() {
	int target = 4;
	//fill vector with values
	Vector<int> nums;
	nums.add(4);
	nums.add(7);
	//nums.add(1);
	nums.add(8);
	//nums.add(-3);
	//set for unique vector with a callback comaparing the summed vector
	Set<Vector<int> > numSet(CompareVect);
	//cout << boolalpha << CanMakeSum(nums, target) << endl;
	cout << boolalpha << CanMakeSum2(nums, target, numSet) << endl;
}
int main ()
{
	//PrintInBinary(6);
	//testCanMakeSum();
	/*TwelveStep climbStairs;
	cout << climbStairs.CountWays(10);*/
	RulerOfTheWorld ruler;
	ruler.DrawRuler(0.0, 0.0, 10.0, 4.0);
	return 0;
}
