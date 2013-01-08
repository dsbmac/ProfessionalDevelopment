/*
 * File: private/stack.cpp
 * Last modified on Fri Jun  5 10:51:26 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the implementation of the stack.h interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _stack_h

/*
 * Stack class implementation
 * ---------------------------
 * The Stack is internally managed using a Vector. This layered
 * implementation makes the job quite trivial, most methods are
 * one-liners.
 */

template <typename ElemType>
Stack<ElemType>::Stack() {
	/* Empty */
}

template <typename ElemType>
Stack<ElemType>::~Stack() {
	/* Empty */
}

template <typename ElemType>
int Stack<ElemType>::size() {
	return elems.size();
}

template <typename ElemType>
bool Stack<ElemType>::isEmpty() {
	return size() == 0;
}

template <typename ElemType>
void Stack<ElemType>::push(ElemType elem) {
	elems.add(elem);
}

template <typename ElemType>
ElemType Stack<ElemType>::pop() {
	if (isEmpty()) Error("Attempt to pop from empty stack");
	ElemType top = elems[elems.size()-1];
	elems.removeAt(elems.size()-1);
	return top;
}

template <typename ElemType>
ElemType Stack<ElemType>::peek() {
	if (isEmpty()) Error("Attempt to peek at empty stack");
	return elems[elems.size()-1];
}

template <typename ElemType>
void Stack<ElemType>::clear() {
	elems.clear();
}

#endif
