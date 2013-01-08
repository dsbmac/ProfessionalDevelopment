/*
 * File: stack.h
 * Last modified on Wed Apr  1 08:22:08 2009 by eroberts
 *      modified on Tue Jan  2 13:40:51 2007 by zelenski
 * -----------------------------------------------------
 * This interface file contains the Stack class template,
 * which provides a linear LIFO collection.
 */

#ifndef _stack_h
#define _stack_h

#include "vector.h"

/*
 * Class: Stack
 * ------------
 * This interface defines a class template that models a "stack":
 * that is, a linear collection of values stacked one on top of
 * the other. Values added and removed only from the top of the stack.
 * The fundamental stack operations are push (add to top) and pop
 * (remove from top). A stack is said to operate in last-in-first-out
 * (LIFO) order.
 *
 * For maximum generality, the Stack is supplied as a class template.
 * The client specializes the stack to hold values of a specific type,
 * e.g. Stack<string> or Stack<stateT>, as needed.
 */

template <typename ElemType>
class Stack {

public:

/*
 * Constructor: Stack
 * Usage: Stack<int> stack;
 *        Stack<string> *sp = new Stack<string>;
 * ---------------------------------------------
 * The constructor initializes a new empty stack.
 */
	Stack();

/*
 * Destructor: ~Stack
 * Usage: delete sp;
 * -----------------
 * The destructor deallocates storage associated with this stack.
 */
	~Stack();

/*
 * Method: size
 * Usage: nElems = stack.size();
 * -----------------------------
 * This method returns the number of elements in this stack.
 */
	int size();

/*
 * Method: isEmpty
 * Usage: if (stack.isEmpty())...
 * -------------------------------
 * This method returns true if this stack contains no
 * elements, false otherwise.
 */
	bool isEmpty();

/*
 * Method: push
 * Usage: stack.push(element);
 * ----------------------------
 * This method pushes the specified element onto this
 * stack. That element becomes the top element on the stack. The
 * stack's size increases by one.
 */
	void push(ElemType elem);

/*
 * Method: pop
 * Usage: top = stack.pop();
 * -------------------------
 * This method removes the top element from this stack and
 * returns it. The top element is the one that was last pushed. The
 * stack's size decreases by one. This function raises an error if
 * called on an empty stack.
 */
	ElemType pop();

/*
 * Method: peek
 * Usage: top = stack.peek();
 * --------------------------
 * This method returns the value of top element from this
 * stack, without removing it.  The stack's size is unchanged.
 * Raises an error if peek is called on an empty stack.
 */
	ElemType peek();

/*
 * Method: clear
 * Usage: stack.clear();
 * ---------------------
 * This method removes all elements from this stack. The
 * stack is made empty and will have size() = 0.
 */
	void clear();

private:

#include "private/stack.h"

};

#include "private/stack.cpp"

#endif
