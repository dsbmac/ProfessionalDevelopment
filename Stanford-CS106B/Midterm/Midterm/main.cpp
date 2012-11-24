/*
 * Project: Midterm
 * Created by CS106 C++ Assignment Wizard 0.1
 *
 * Name: [TODO: enter name here]
 * Section: [TODO: enter section leader here]
 * [TODO: Describe assignment]
 */

#include "genlib.h"
#include "simpio.h"
#include "vector.h"
#include "set.h"
#include "map.h"
#include "lexicon.h"
#include "queue.h"
#include "stack.h"
#include <iostream>

//P1
string ConvertMacLineEndingsToPC(string str) {
	string result = str;
	int i = 0;
	while (true) {
		int i = result.find("\n", i);	
		if(i  == string::npos) break;
		result.replace(i, 1, "\r\n");
		i +=2;
	}
	return result;
}

//P2 
double Similarity(Vector<char> & v1, Vector<char> & v2) {
	Set<char> common; //i think this was written inefficiently. it doesn't take advantage of the sorted order.
	for(int i = 0; i < v1.size(); i++) {
		for(int j = 0; j < v2.size(); j++) {
			if(v1[i] == v2[j]) common.add(v1[i]);			
		}
	}
	Set<char>::Iterator iter = common.iterator();
	while (iter.hasNext()) {
		char value = iter.next();
		cout << value << "," ;
	}
	cout << endl;
	float avg = (float)(v1.size() + v2.size()) / 2;		
	return (float) common.size() / avg;
}

void testSimilarity() {
	Vector<char> v1, v2;
	v1.add('j');
	v1.add('k');
	v1.add('k');
	v2.add('k');
	v2.add('z');
	cout << Similarity(v1, v2) << endl;
}

//P2b
bool MarkovMatch(Map<Vector<char> > & m1, Map<Vector<char> > & m2) {
	//find common seeds in m1 and m2
	//traverse the seeds and see if they're similar
	Map<Vector<char> >::Iterator iter = m1.iterator();
	while(iter.hasNext()) {
		string key = iter.next();	
		if( m2.containsKey(key) ) {			
			if(Similarity(m1[key], m2[key]) < 0.7) return false;
		}
	}
	return true;
}	
	
//P3
void RecPermute(string soFar, string rest, Lexicon &lex, Set<string> &words) {
	if (!lex.containsPrefix(soFar)) return;
	if (rest == "") {
		if (lex.containsWord(soFar)) words.add(soFar);
		return;
	} else {
		for (int i = 0; i < rest.length(); i++) {			
			string remaining = rest.substr(0, i) + rest.substr(i+1);
			RecPermute(soFar + rest[i], remaining, lex, words);
		}
	}
}

int Permute(string rest, Lexicon &lex) {
	Set<string> words;
	RecPermute("", rest, lex, words) ;
	return words.size();
}

int PermuteSolution(string soFar, string rest, Lexicon &lex)
{
	if (!lex.containsPrefix(soFar)) return 0;
	   if (rest == "") {
		   return (lex.containsWord(soFar) ? 1 : 0);
	   } else {
		   int count = 0;
		   for (int i = 0; i < rest.length(); i++) {
			   if (rest.find(rest[i], i+1) == string::npos) { // skip dup char
				   string rem = rest.substr(0, i) + rest.substr(i+1);
				   count += PermuteSolution(soFar + rest[i], rem, lex);
			   }
		   }
		   return count;
	   }
}

//P4
bool CanSpell(string word, Vector<string> & cubes, string usedCubes="") {	
	if (word.length() > cubes.size()) return false;
	if (word == "") return true;	
	for(int i = 0; i < cubes.size(); i++) {		
		string indexStr = IntegerToString(i);		
		if (usedCubes.find(indexStr) == string::npos) {
			for(int j = 0; j < 6; j++) {
				char letter = cubes[i][j];
				if (letter == word[0] ) {										
					if (CanSpell(word.substr(1), cubes, usedCubes + ',' + indexStr)) return true;
				}
			}
		}		
	}
	return false;
}

bool CanSpellSolution(string word, Vector<string> & cubes)
{
	if (word == "") return true;
	for (int i = 0; i < cubes.size(); i++) {
		string curCube = cubes[i];
		if (curCube.find(word[0]) != string::npos) {
			cubes.removeAt(i); // remove cube so not used again
			if (CanSpellSolution(word.substr(1), cubes)) {
				cubes.insertAt(i, curCube);
				return true;
			}
			cubes.insertAt(i, curCube);// backtrack, replace cube
		}
	}
	return false; // trigger backtracking
}

void test4() {
	Vector<string> cubes;
	cubes.add("etaoin");
	cubes.add("shrdlu");
	cubes.add("qwerty");
	cubes.add("aeious");
	string word = "tire";	
	cout << "my answer: " << boolalpha << CanSpell(word, cubes) << endl;
	cout << "solution: " << boolalpha << CanSpellSolution(word, cubes) << endl;
}

//P5
Queue<int> ExtractStrand(Queue<int> & q) {
	Queue<int> result ;
	Queue<int> holder ;
	result.enqueue(q.dequeue());
	while(!q.isEmpty()) {
		if (q.peek() > result.peek()) {
			result.enqueue(q.dequeue());
		} else {
			holder.enqueue(q.dequeue());
		}
	}
	while(!holder.isEmpty()) {
		q.enqueue(holder.dequeue());
	}
	return result;
}

//P6
struct cellT {
	int val;
	cellT *next;
};

bool Contains(cellT *list, cellT *sub) {
	cellT *start = list;	
	for (cellT *curSub = sub; curSub!= NULL; curSub = curSub->next) {
		bool found = false;
		for (cellT *curList = start; curList!= NULL; curList = curList->next) {
			if(curList->val == curSub->val) {
				start = curList;
				found = true;
				break;
			}
		if (!found) return false;
		}
	}
}

//P7
void Roll(Stack<char> &s, int nElems, int nPos) {
	Vector<int> vec;
	Stack<int> stack;
	for (int i = 0; i < nElems; i++) {
		stack.push(s.pop());
	}
	int shift = stack.pop();
	for(int i = 0; i < nPos; i++) {
		s.push(stack.pop());
	}
	s.push(shift);
	for(int i = 0; i < stack.size(); i++) {
		s.push(stack.pop());
	}	
}

//P8
/*
void Winky(int n)
{
for (int i = 0; i < n; i++) <-O(n)
Winky(i);

simplifies to O(n). you discard the lower order recursive stuff

b)
void Toss(Stack<string> s)
{
	Stack<string> tmp; 
	while (!s.isEmpty())
	   tmp.push(s.pop());
	s = tmp; //this function reverses the order of the items in s but it doesn't return it is a
	//copy so nothing happens to the original
}

int main()	{
	Stack<string> salad;
	salad.push("lettuce"); //{lettuce}
	salad.push("tomato"); //{lettuce, tomato}
	salad.push("cucumber"); //{lettuce, tomato, cucumber}
	Toss(salad); //{lettuce, tomato, cucumber} 
	cout << salad.pop() << endl; //cucumber
	return 0;
}
prints out cucumber. the stack is unchanged from the Toss.
if the parameter is changed to &s: it prints out lettuce. the stack now contains {cucumber, tomato}

c) you want selection sort. It will go through the entire dorm and find the smallest each time and then shift it.
 one swap per iteration.
*/
int main ()
{
	//P1
	//cout << ConvertMacLineEndingsToPC("\near to m\ne") << endl;	
	//P2
	//testSimilarity();
	//P2b
	//P3
	//string s = "steam";
	//Lexicon lex("lexicon.dat");
	//cout << "solution: " << PermuteSolution("", s, lex) << endl;
	//cout << "my answer: " << Permute(s, lex) << endl;
	//P4
	test4();

	return 0;
}

