#include "Stock.h"

Stock::Stock(void)
{
}
int Stock::CutStock(Vector<int> &requests, int stockLength) {
	Vector<Vector<Vector<int> > > solutions;
	Vector<Vector<int> >  solution;
	Vector<int> emptyCuts;
	solution.add(emptyCuts);
	//RecCutStock(requests, stockLength, solution, solutions) ;
	Stack<int> requestStack = convertVector(requests);
	RecCutStock2(requestStack, stockLength, solution,  solutions) ;
	return 1;
}
Stack<int> Stock::convertVector( Vector<int> requests ) {
	Stack <int> result;
	for (int i = 0; i < requests.size(); i++) {
		result.push(requests[i]);
	}
	return result;
}
int Stock::sumCuts(Vector<int> & cuts) {
	int sum = 0;
	for (int i = 0; i < cuts.size(); i++) {
		sum += cuts[i];
	}
	return sum;
}
void Stock::printSolution(Vector <Vector<int> > & solution) {
	for (int i = 0; i < solution.size(); i++) {
		for (int j = 0; j < solution[i].size(); j++) {
			cout << solution[i][j] << ", ";
		}
		cout << "; " ;
	}
	cout << endl;
}
void Stock::printCuts(Vector<int> & cuts) {
	for (int i = 0; i < cuts.size(); i++) {
		cout <<  cuts[i] << ", " ;
	}
	cout << endl;
}
void Stock::printCutsStack(Stack<int> & cuts) {
	while (!cuts.isEmpty() ) {
		int cut = cuts.pop();
		cout <<  cut << ", " ;
	}
	cout << endl;
}
void Stock::RecCutStock2(Stack<int> & requests, int stockLength, 
						 Vector< Vector<int> > & solution,
						 Vector< Vector< Vector<int> > > & solutions) {
	cout << "solutions:  " << solutions.size() << endl;
	cout << "solution: " ;
	printSolution(solution);
	cout << "requests: ";
	printCutsStack( requests );
	if (requests.size() == 0 ) {
		cout << "solution complete: " << endl;
		solutions.add(solution);
		printSolution(solution);
		return;
	} else {
		while ( !requests.isEmpty() ) {
			int newCut = requests.pop();
			Stack<int> newRequests = requests;
			for (int i = 0; i < requests.size(); i++) {				
				Vector<int> newCuts;
				newCuts.add(newCut);
				Vector< Vector<int> > newSolution = solution ;
				if (solution.size() == 0 || sumCuts(newCuts) > 0 ) {		
					cout << "1st branch" << endl;
					newSolution.add(newCuts);
					RecCutStock2(newRequests, stockLength, newSolution, solutions);
				} else {
					cout << "2nd branch" << endl;
					newSolution.setAt(newSolution.size()-1, newCuts);
					RecCutStock2(newRequests, stockLength, newSolution, solutions);
				}
			}			
		}
	}
}

void Stock::RecCutStock(Vector<int> & requests, int stockLength, 
							   Vector<Vector<int> > & solution, 
							   Vector<Vector<Vector<int> > > & solutions) {
	/*cout << "solutions:  " << solutions.size() << endl;
	cout << "solution: " ;
	printSolution(solution);
	cout << "requests:  " << endl;
	printCuts(requests);*/
	if (requests.size() == 0 ) {
		cout << "solution complete" << endl;
		solutions.add(solution);
		printSolution(solution);
		return;
	} else {
		for (int i = 0; i < requests.size() ; i++) {
			//cout << "for loop: " << i << endl;
			Vector<int> newCuts = solution[solution.size()-1];
			newCuts.add( requests[i] ); //add cut to current piece
			//cout << "newCuts: " ;
			//printCuts(newCuts);
			Vector<int> newRequests = requests;
			newRequests.removeAt(i); //decrement requests
			if ( solution.size() == 0 || sumCuts(newCuts) > stockLength ) {
				//start a new cut and solution
				//cout << "starting a new piece" << endl;
				Vector <int> newPiece; //start a new piece
				newPiece.add( requests[i] );
				Vector<Vector <int> >  newSolution = solution; //start a different solution branch 
				newSolution.add(newPiece);			
				//cout << endl << "recursing 1st branch..." << endl;			
				RecCutStock(newRequests, stockLength, newSolution, solutions);
			}
			else {				
			/*	cout << "newCuts: " ;
				printCuts(newCuts);
				cout << "... is ok!" << endl;*/
				Vector<Vector <int> >  newSolution1 = solution; //copy solution
				newSolution1.setAt(newSolution1.size()-1, newCuts);
				//cout << endl << "recursing 2nd branch..." << endl;
				RecCutStock(newRequests, stockLength, newSolution1, solutions);
			} 						
		}		
	}
}
//choose best
Stock::~Stock(void)
{
}
