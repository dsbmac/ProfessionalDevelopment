/*
 * File: private/stack.h
 * Last modified on Fri Jun  5 10:50:28 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the stack.h interface.
 * This portion of the class definition is taken out of the stack.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Deep copying support
 * --------------------
 * Because all data members have correct behavior on operator=
 * and copy constructor, the default as synthesized by
 * the compiler make a correct copy of the Stack. When pass/return
 * stacks by value, or assign one to another, the entire contents
 * of the stack, including all elements, are copied. Each stack
 * element is copied from the original stack to the copy using
 * assignment (operator=). Making copies is generally avoided
 * because of the expense and thus, stacks are typically passed by
 * reference, however, when a copy is needed, these operations
 * correctly are supported.
 *
 * const Stack & operator=(const Stack & rhs);
 * Stack(const Stack & rhs);
 */

private:
	Vector<ElemType> elems;
