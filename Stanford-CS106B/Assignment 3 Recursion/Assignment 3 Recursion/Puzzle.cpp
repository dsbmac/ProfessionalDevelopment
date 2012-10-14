#include "Puzzle.h"

Puzzle::Puzzle(void)
{
}

void Puzzle::moveToSquare (int newIndex, Stack<int> & solution) {
	solution.push(newIndex);
}
void Puzzle::backtrack (Stack<int> & solution){
	solution.pop();
}
void Puzzle::printSolution (Stack<int> solution){
	cout << "solution: ";
	while ( !solution.isEmpty() ) {
		cout << solution.pop() << ", ";
	}
	cout << endl;
}
bool Puzzle::isValidIndex(int index , Vector<int> & squares) {
	cout << "isValidIndex: " << index << endl;
	bool result  = 0 <= index && index <= squares.size()-1;
	cout << "returning " << boolalpha << result << endl;
	return result;
}
bool Puzzle::Solve(int index, int prevIndex, Vector<int> & squares, Stack<int> & solution) {
	if( index == squares.size()-1) return true;
	for (int i = 1; i >=-1 ; i -=2) {
		int newPrevIndex = solution.peek() ;
		int newIndex = index + (i * squares[index]);
		cout << "newIndex:prevIndex" << newIndex << ":" << prevIndex << endl;
		if (  isValidIndex( newIndex, squares ) && newIndex != prevIndex ) { //check to ensure it is within bounds and doesn't backtrack
			moveToSquare( newIndex, solution );
			printSolution(solution);
			if ( Solve(newIndex , newPrevIndex, squares, solution) ) return true;
			backtrack(solution); //if solution failed then backtrack
		}
	}
	return false;
}
bool Puzzle::Solvable(int start, Vector<int> & squares) {
	cout << "Solvable..." << endl;
	Stack<int> solution; //stores the solution
	solution.push(start);
	int prevIndex = start;
	return Solve(start, prevIndex, squares, solution);
}

Puzzle::~Puzzle(void)
{
}
