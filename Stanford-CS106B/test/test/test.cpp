#include "genlib.h"
#include <iostream>
#include <vector.h>
#include <iostream>
#include <string>
#include "random.h"
#include "simpio.h"
#include "queue.h"
#include "map.h"

int main()
{
	Map<int> map ;
	map.add("a", 1);
	cout << map.getValue("a") << endl;
}
