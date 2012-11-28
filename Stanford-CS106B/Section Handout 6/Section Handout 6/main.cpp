/*
 * Project: Section Handout 6
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */

#include "genlib.h"
#include "vector.h"

/*Problem 1
a) What is a class? A class is an OOP concept object that has certain related function (data ) and data members in
one object. The interface declares all the members and the implementation has the code.

The purpose of the wall is keep things the client doesn't need to know about away from him. It simplifies 
collaboration by demarcating boundaries. easier to ignore things that don't concern its use. public and private help 
this. by keeping things private you don't allow access and possible errors by changing things that were not 
supposed to have been changed.

b) see above

c) 
a. not good. can mess up the perimeter calculation if changed
b. this is good. keeps things seperate
c. not great. why change the perimeter value for? It shouldn't change without the width and height
d. this is acceptable. if it includes the other data as private. this would be a public member

*/

//Problem 3
struct Car {
    string name;
    int weight;
    int numAirbags;
};

int CarSafetyCmp (Car foo, Car bar) {
	int bagDiff = foo.numAirbags - bar.numAirbags;
	if (bagDiff == 0) 
		return foo.weight - bar.weight;
	else 
		return bagDiff;
}

template <typename ElemType>
ElemType FindMax(Vector<ElemType> &v, int (cmp)(ElemType, ElemType)=OperatorCmp) {
	ElemType max = v[0];
	for(int i = 1; i < v.length(); i++) 
		if ( cmp(max, v[i]) > 0 ) max = v[i];
	return max;
}

int main ()
{
	//Problem 3b
	//Vector<Car> cars;
	//Car safest = FindMax(cars, CarSafetyCmp);
	//cout << safest.name << endl;

	return 0;
}
