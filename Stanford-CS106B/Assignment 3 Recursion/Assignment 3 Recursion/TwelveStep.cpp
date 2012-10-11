#include "TwelveStep.h"

TwelveStep::TwelveStep(void)
{
}
int TwelveStep::CountWays(int  numStairs) {
	Stack<int> stepsTaken;
	Vector<Stack<int> > perms;

	Vector<Stack<int> > result = RecCountWays(stepsTaken, numStairs, perms);
	cout << "result.size(): " << result.size() << endl;
	printPerms(result);
	return result.size();
}
Vector<Stack<int> > TwelveStep::RecCountWays(Stack<int> & stepsTaken, int  & numStairs, Vector<Stack<int> > & perms) {
	if(numStairs == 0 && stepsTaken.size() > 0) perms.add(stepsTaken);
	else {
		for (int i = 1; i < 3; i++) {
			Stack<int> newStepsTaken = stepsTaken;
			newStepsTaken.push(i);
			int newNumStairs = numStairs - i;
			if (newNumStairs >= 0) {
				RecCountWays(newStepsTaken, newNumStairs, perms);
			}
		}		
	}
	//return perms.size();
	return perms;
}
void TwelveStep::printPerms(Vector<Stack<int> > & perms)  {
	for (int i = 0; i < perms.size(); i++) {
		int total = 0;
		while( !perms[i].isEmpty()) {
			int step = perms[i].pop();
			cout << "step: " << IntegerToString(step) << endl;
			total += step;
		}
		cout << "total: " << IntegerToString( total ) << endl;
		cout << endl;
	}
	cout << endl;
}

