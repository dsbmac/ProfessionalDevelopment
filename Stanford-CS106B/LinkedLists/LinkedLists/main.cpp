/*
 * Project: LinkedLists
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */

#include "genlib.h"
#include <iostream>
#include "simpio.h"
#include "vector.h"
#include "map.h"
#include "strutils.h"

struct Entry {
  string name, address, phone; 
  Entry *next;
};

Entry *GetNewEntry()
{
  cout << "Enter name (ENTER to quit):";
  string name = GetLine();
  if (name == "") return NULL;
  Entry *newOne = new Entry;
  newOne->name = name;
  cout << "Enter address: ";
  newOne->address = GetLine();
  cout << "Enter phone: ";
  newOne->phone = GetLine();
  newOne->next = NULL; // no one follows
  return newOne;
}
Entry *ConvertMapToBook(Map<Vector<string> > mappy) {
	Entry *listHead = NULL;
	Map<Vector<string> >::Iterator iter = mappy.iterator();
	while(iter.hasNext()) {
		string name = iter.next();
		Vector<string> vect = mappy.getValue(name);
		Entry *newOne = new Entry;
		newOne->name = name;
		newOne->address = vect[0];
		newOne->phone = vect[1];
		newOne->next = listHead;
		listHead = newOne;
	}
	return listHead;
}
Entry *BuildAddressBook() {
  Entry *listHead = NULL;
  while (true)  {
    Entry *newOne = GetNewEntry();
    if (newOne == NULL) break;
    newOne ->next = listHead;
    listHead = newOne;
  }
  return listHead;
}
void PrintEntry(Entry *entry)
{  
  cout << entry->name << " " << entry->phone << endl;
}
void PrintList(Entry *list)
{
  for (Entry *cur = list; cur!= NULL; cur = cur->next)
    PrintEntry(cur);
}

int main ()
{
	Map<Vector<string> > mappy;

	Vector<Vector<string> > allVects;

	for (int i = 0 ; i < 3; i++) {
		Vector<string> vect;
		vect.add(IntegerToString(i+1));
		vect.add(IntegerToString(i+1) + IntegerToString(i+1) );
		allVects.add(vect);
	}
	
	mappy.add("jim", allVects[0]);
	mappy.add("bo", allVects[1]);
	mappy.add("dick", allVects[2]);
	Entry *book = ConvertMapToBook(mappy) ;
	//Entry *book = BuildAddressBook();
	PrintList(book);
	return 0;
}
