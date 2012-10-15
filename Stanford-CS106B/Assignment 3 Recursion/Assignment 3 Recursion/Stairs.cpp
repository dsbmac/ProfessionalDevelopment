#include "Stairs.h"

Stairs::Stairs(void)
{
}
int Stairs::CountWays(int  numStairs) {
	return RecCountWays(numStairs);
}
int Stairs::RecCountWays (int numStairs) {
	if (numStairs <= 3) return numStairs;
	else { //create two branches and substract large and small steps respectively
		return RecCountWays(numStairs-2) + RecCountWays( numStairs-1); 
	}
}

