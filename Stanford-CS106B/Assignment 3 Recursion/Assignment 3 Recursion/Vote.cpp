#include "Vote.h"

Vote::Vote(void)
{
}
int Vote::CountCriticalVotes(Vector<int> & blocks,  int  blockIndex) {
	Vector<int> newBlocks = blocks;
	Vector<int> empty;
	newBlocks.removeAt(blockIndex);
	int count = 0;
	int target = blocks[blockIndex];
	Set<Vector<int> > uniques(CompareVects);
	RecCriticalVotes( target, count, uniques, empty, newBlocks); 	
	return 1;
}
void Vote::RecCriticalVotes(int target, int & count , Vector<int> & foo,
							Vector<int> & bar, Set<Vector> & uniques) {
	cout << endl;
	cout << "foo: ";
	printVector(foo);
	cout << "bar: ";
	printVector(bar);
	Vector<int> foobar = foobar(Vector<int> foo, Vector<int> bar);
	if (!uniques.contains(foobar) {//join foo & bar and check if the set contains it
		if (IsCriticalVote(foo, bar, target) ) {
			count +=1;
			uniques.add(foobar);
			cout << "is critical " << count << endl;
			return;
		}
	}		
	else {
		for (int i = 0; i < bar.size(); i++) {
			cout << "i: " << i << endl;
			Vector<int> newFoo = foo;
			Vector<int> newBar = bar;			
			int newNumber = bar[i];
			newBar.removeAt(i);
			newFoo.add(newNumber);
			RecCriticalVotes( target, count, uniques, newFoo, newBar);
			//RecCriticalVotes( target, count, newBar, foo );
		}		
	}	
}
//void Vote::RecCriticalVotes(int target, int & count , Vector<int> & bar,
//						  Vector<int> & foo) {
//	cout << endl;
//	cout << "foo: ";
//	printVector(foo);
//	cout << "bar: ";
//	printVector(bar);
//	if (IsCriticalVote(foo, bar, target) ) {
//		count +=1;
//		cout << "is critical " << count << endl;
//		return;
//	}	
//	else {
//		for (int i = 0; i < bar.size(); i++) {
//			cout << "i: " << i << endl;
//			Vector<int> newFoo = foo;
//			Vector<int> newBar = bar;			
//			int newNumber = bar[i];
//			newBar.removeAt(i);
//			newFoo.add(newNumber);
//			RecCriticalVotes( target, count, newBar , newFoo);
//			//RecCriticalVotes( target, count, newBar, foo );
//		}		
//	}	
//}
Vector<int> Vote::foobar ( Vector<int> foo, Vector<int> bar) {
	Vector<int> result;
	for (int i = 0; i < foo.size(); i++) {
		result.add(foo[i]);
	}
	result.add(0);
	for (int i = 0; i < bar.size(); i++) {
		result.add(bar[i]);
	}
	return result;
}
int Vote::CompareVects(Vector<int> & votes) {
	int mark, fooSum, barSum;
	int sum = 0
	Vector<int> temp;
	for(int i = 0 ; i < votes.size(); i++) {
		if( votes[i] == 0) {
			Vector <int> foo = temp;
			fooSum = sum;
			sum = 0;
			temp.clear();
		} else {
			temp.add(votes[i]);		
			sum += votes[i]
		}
	}
	bar = temp;
	barSum = sum;

	if (fooSum == barSum ) return 0;
	else if (fooSum > barSum ) return 1;
	else return -1;
}
int Vote::sumVector(Vector<int> & vect) {
	int sum = 0;
	for (int i = 0; i < vect.size(); i++) {
		sum += vect[i];
	}
	return sum;
}
bool Vote::IsCriticalVote(Vector<int> & foo, Vector<int> & bar, int target) {
	cout << "is critical? " << target << " ";
	int sumFoo = sumVector(foo);
	int sumBar = sumVector(bar);
	bool result = sumFoo + target > sumBar && sumFoo < sumBar + target ;
	cout << boolalpha << result << endl;
	return result;
}
void Vote::printVector(Vector<int> & vect) {
	for (int i = 0; i < vect.size(); i++) {
		cout << vect[i] << ", ";
	}
	cout << endl;
}

Vote::~Vote(void)
{
}
