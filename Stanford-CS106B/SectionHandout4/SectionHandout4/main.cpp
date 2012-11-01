/*
 * Project: SectionHandout4
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */
#include "genlib.h"
//#include "Maze.h"
#include "Fill.h"
#include "vector.h"
#include <iostream>

struct Cell {
	Cell *next;
	int value;
};
Cell * ConvertToListIter(Vector<int> vect) {
	Cell *head = new Cell;
	head->next = NULL;
	head->value = vect[0];

	for(int i = 1; i < vect.size(); i++)	{
		Cell *newCell = new Cell;
		newCell->next = head;
		newCell->value = vect[i];

		head = newCell;
	}
	return head;
}
Cell * ConvertToListRec(Vector<int> & vect, int index = 0) {
	if (index >= vect.size()) return NULL;
	else {
		Cell *newCell = new Cell;
		newCell->value = vect[index];
		newCell->next = ConvertToListRec(vect, index + 1);
		return newCell;
	}
}
int SumList(Cell *list) {
	int sum = 0;
	for (Cell *curr = list; curr != NULL; curr = curr->next) {
		sum += curr->value;
	}
	return sum;
}
int SumListRec(Cell *list) {
	if (list == NULL) return 0;
	else {
		Cell *curr = list;
		return curr->value + SumListRec(curr->next);
	}
}
void PrintEntry(Cell *cur) {
	cout << cur->value << endl;
}
void PrintList(Cell *list)
{
	for (Cell *cur = list; cur!= NULL; cur = cur->next) {
		PrintEntry(cur);
	}
}
//Problem 6: Append
void AppendListsRec(Cell *list1, Cell *list2) {
	if (next == NULL) ptr->next = list2;
	else
		Cell nextPtr = list1->next;
		AppendListsRec(nextPtr, list2) 


	
}
int main ()
{
	Vector<int> vec;
	vec.add(1);
	vec.add(2);
	vec.add(3);
	vec.add(99);
	//Cell *list = ConvertToListIter(vec);
	Cell *list = ConvertToListRec(vec);
	PrintList(list);
	cout << SumList(list) << endl;
	cout << SumListRec(list) << endl;
	//Maze test();
	//test.ReadMazeMap("maze1.txt");
	//pointT start = test.GetStartPosition();

	return 0;
}
