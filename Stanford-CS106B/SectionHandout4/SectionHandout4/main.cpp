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
Cell * ConvertToListIter(Vector<int> vector)
{
	Cell *head = new Cell;
	head->next = NULL;
	head->value = vector[0];
	Cell *curr = head;
	for(int i = 1; i < vector.size(); i++)
	{
		Cell *newCell = new Cell;
		newCell->next = NULL;
		newCell->value = vector[i];
		curr->next = newCell;
		newCell = curr;
	}
	return head;
}

//Cell * ConvertToList(Vector<int> vector) {
//	Cell *listHead = new Cell;
//	listHead->next = NULL;
//	listHead->value = vector[0];
//
//	Cell * curr = listHead;
//	for (int i = 1; i < vector.size(); i++) {
//		Cell *newCell = new Cell;
//		newCell->value = vector[i];
//		newCell->next = NULL;
//
//		curr->next = newCell;
//		newCell = curr;
//	}
//	return listHead;
//}
void PrintEntry(Cell *cur) {
	cout << cur->value << endl;
}
void PrintList(Cell *list)
{
  for (Cell *cur = list; cur!= NULL; cur = cur->next)
PrintEntry(cur);
}
//void PrintList(Cell *list) {
//	for (Cell *cur = list; cur != NULL; cur = cur->next) {
//		PrintEntry(cur);
//	}
//}


int main ()
{
	Vector<int> vec;
	vec.add(12);
	vec.add(25);
	vec.add(33);
	vec.add(99);
	Cell *list = ConvertToListIter(vec);
	PrintList(list);
	//Maze test();
	//test.ReadMazeMap("maze1.txt");
	//pointT start = test.GetStartPosition();

	return 0;
}
