#include "Stock.h"

Stock::Stock(void)
{
}
int Stock::CutStock(Vector<int> &requests, int stockLength) {
	Vector<int> solutions;
	return RecCutStock( requests, stockLength, 0, 0, solutions) ;
}
int Stock::RecCutStock( Vector<int> &requests, int stockLength, int pipes,
						int cutTotal, Vector< int> & solutions) {
	if (requests.size() == 0 ) {		
		solutions.add(pipes);		
	} else {
		for (int i = 0; i < requests.size(); i++) {
			int newCutTotal = cutTotal + requests[i];
			Vector<int> newRequests = requests; 
			newRequests.removeAt(i); //decrementor
			if ( newCutTotal > stockLength || pipes == 0 ) { //start a new pipe if new addition doesn't fit or no pipes started
				RecCutStock( newRequests, stockLength, pipes + 1,
					requests[i], solutions) ;
			} else {	//if new cut fits add to existing cutTotal
				RecCutStock( newRequests, stockLength, pipes, newCutTotal, solutions) ;
			}			
		}
		return minCuts(solutions);
	}
}
int Stock::minCuts(Vector<int> & cuts) {
	int min = cuts[0];
	for (int i = 1; i < cuts.size(); i++) {
		if (cuts[i] < min ) min = cuts[i];
	}
	return min;
}
Stock::~Stock(void)
{
}
