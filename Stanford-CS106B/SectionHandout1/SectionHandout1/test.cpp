#include <iostream>
#include "genlib.h"
#include "simpio.h"

void Binky(int num)
{
for (int i = 0; i < num; i++)
cout << "Hello!" << endl;
}
int Winky()
{
cout << "Enter your favorite number: ";
return GetInteger();
}
int main()
{ // execution starts here
int val = Winky();
Binky(val);
return 0; // and stops here
}