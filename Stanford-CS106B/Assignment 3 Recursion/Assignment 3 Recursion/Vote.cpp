#include "Vote.h"

Vote::Vote(void)
{
}
int Vote::CountCriticalVotes(Vector<int> & blocks,  int  blockIndex) {
	int swing = blocks[blockIndex];
	blocks.removeAt(blockIndex); //remove the swing block from vector

	return RecCriticalVotes( 0, blocks, 0, 0, swing, 0); 	
}
int Vote::RecCriticalVotes(int index, Vector<int> & blocks, int foo, int bar, int swing, int count) {
	if ( index >= blocks.size() )  {
		return IsVoteCritical(foo, bar, swing) ;
	} else {
		return RecCriticalVotes(index+1, blocks, foo + blocks[index], bar, swing ,  count) 
			+	RecCriticalVotes(index+1, blocks, foo, bar + blocks[index], swing ,  count) ; //vote for B
	} 
}
int Vote::sumVector(Vector<int> & vect) {
	int sum = 0;
	for (int i = 0; i < vect.size(); i++) {
		sum += vect[i];
	}
	return sum;
}
bool Vote::IsVoteCritical(int & foo, int & bar, int swing) {
	cout << "is critical? " << foo << ":" <<  bar << " swing: " << swing << endl;
	bool result = foo + swing > bar && foo < bar + swing;
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
