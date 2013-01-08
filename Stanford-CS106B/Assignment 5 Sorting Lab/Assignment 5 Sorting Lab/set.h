/*
 * File: set.h
 * Last modified on Thu Jun 11 09:17:43 2009 by eroberts
 *      modified on Tue Jan  2 14:34:06 2007 by zelenski
 * -----------------------------------------------------
 * This interface file contains the Set class template, a
 * collection for efficiently storing a set of distinct elements.
 */

#ifndef _set_h
#define _set_h

#include "cmpfn.h"
#include "bst.h"
#include "vector.h"
#include "foreach.h"

/*
 * Class: Set
 * ----------
 * This interface defines a class template that stores a collection of
 * distinct elements, using a sorted relation on the elements to
 * provide efficient managaement of the collection.
 * For maximum generality, the Set is supplied as a class template.
 * The element type is determined by the client. The client configures
 * the set to hold values of a specific type, e.g. Set<int> or
 * Set<studentT>. The one requirement on the element type is that the
 * client must supply a comparison function that compares two elements
 * (or be willing to use the default comparison function that uses
 * the built-on operators  < and ==).
 */

template <typename ElemType>
class Set {

public:

/* Forward references */
	class Iterator;

/*
 * Constructor: Set
 * Usage: Set<int> set;
 *        Set<student> students(CompareStudentsById);
 *        Set<string> *sp = new Set<string>;
 * -----------------------------------------
 * The constructor initializes an empty set. The optional
 * argument is a function pointer that is applied to
 * two elements to determine their relative ordering. The
 * comparison function should return 0 if the two elements
 * are equal, a negative result if first is "less than" second,
 * and a positive resut if first is "greater than" second. If
 * no argument is supplied, the OperatorCmp template is used as
 * a default, which applies the bulit-in < and == to the
 * elements to determine ordering.
 */
	Set(int (*cmpFn)(ElemType, ElemType) = OperatorCmp);

/*
 * Destructor: ~Set
 * Usage: delete sp;
 * -----------------
 * The destructor deallocates  storage associated with set.
 */
	~Set();

/*
 * Method: size
 * Usage: count = set.size();
 * --------------------------
 * This method returns the number of elements in this set.
 */
	int size();

/*
 * Method: isEmpty
 * Usage: if (set.isEmpty())...
 * ----------------------------
 * This method returns true if this set contains no
 * elements, false otherwise.
 */
	bool isEmpty();

/*
 * Method: add
 * Usage: set.add(value);
 * ----------------------
 * This method adds an element to this set. If the
 * value was already contained in the set, the existing entry is
 * overwritten by the new copy, and the set's size is unchanged.
 * Otherwise, the value is added and set's size increases by one.
 */
	void add(ElemType elem);

/*
 * Method: remove
 * Usage: set.remove(value);
 * -----------------------
 * This method removes an element from this set. If the
 * element was not contained in the set, the set is unchanged.
 * Otherwise, the element is removed and the set's size decreases
 * by one.
 */
	void remove(ElemType elem);

/*
 * Method: contains
 * Usage: if (set.contains(value))...
 * -----------------------------------
 * Returns true if the element in this set, false otherwise.
 */
	bool contains(ElemType elem);

/*
 * Method: find
 * Usage: eptr = set.find(elem);
 * -----------------------------
 * If the element is contained in this set, returns a pointer
 * to that elem.  The pointer allows you to update that element
 * in place. If element is not contained in this set, NULL is
 * returned.
 */
	ElemType *find(ElemType elem);

/*
 * Method: equals
 * Usage: if (set.equals(set2)) . . .
 * -----------------------------------
 * This predicate function implements the equality relation
 * on sets.  It returns true if this set and set2 contain
 * exactly the same elements, false otherwise.
 */
	bool equals(Set & otherSet);

/*
 * Method: isSubsetOf
 * Usage: if (set.isSubsetOf(set2)) . . .
 * --------------------------------------
 * This predicate function implements the subset relation
 * on sets.  It returns true if all of the elements in this
 * set are contained in set2.  The set2 does not have to
 * be a proper subset (that is, it may be equals).
 */
	bool isSubsetOf(Set & otherSet);

/*
 * Methods: unionWith, intersectWith, subtract
 * Usage: set.unionWith(set2);
 *        set.intersectWith(set2);
 *        set.subtract(set2);
 * -------------------------------
 * These fmember unctions modify the receiver set as follows:
 *
 * set.unionWith(set2);      Adds all elements from set2 to this set.
 * set.intersectWith(set2);  Removes any element not in set2 from this set.
 * set.subtract(set2);       Removes all element in set2 from this set.
 */
	void unionWith(Set & otherSet);
	void intersectWith(Set & otherSet);
	void subtract(Set & otherSet);

/*
 * Method: clear
 * Usage: set.clear();
 * -------------------
 * This method removes all elements from this set. The
 * set is made empty and will have size() = 0 after being cleared.
 */
	void clear();

/*
 * SPECIAL NOTE: mapping/iteration support
 * ---------------------------------------
 * The set supports both a mapping operation and an iterator which
 * allow the client access to all elements one by one.  In general,
 * these  are intended for _viewing_ elements and can behave
 * unpredictably if you attempt to modify the set's contents during
 * mapping/iteration.
 */

/*
 * Method: mapAll
 * Usage: set.mapAll(Print);
 * -------------------------
 * This method iterates through this set's contents
 * and calls the function fn once for each element.
 */
	void mapAll(void (*fn)(ElemType elem));

/*
 * Method: mapAll
 * Usage: set.mapAll(PrintToFile, outputStream);
 * --------------------------------------------
 * This method iterates through this set's contents
 * and calls the function fn once for each element, passing
 * the element and the client's data. That data can be of whatever
 * type is needed for the client's callback.
 */
	template <typename ClientDataType>
	void mapAll(void (*fn)(ElemType elem, ClientDataType & data),
	            ClientDataType & data);

/*
 * Method: iterator
 * Usage: iter = set.iterator();
 * -----------------------------
 * This method creates an iterator that allows the client to
 * iterate through the elements in this set.  The elements are
 * returned in the order determined by the comparison function.
 *
 * The idiomatic code for accessing elements using an iterator is
 * to create the iterator from the collection and then enter a loop
 * that calls next() while hasNext() is true, like this:
 *
 *     Set<int>::Iterator iter = set.iterator();
 *     while (iter.hasNext()) {
 *         int value = iter.next();
 *         . . .
 *     }
 *
 * This pattern can be abbreviated to the following more readable form:
 *
 *     foreach (int value in set) {
 *         . . .
 *     }
 *
 * To avoid exposing the details of the class, the definition of the
 * Iterator class itself appears in the private/set.h file.
 */
	Iterator iterator();

private:

#include "private/set.h"

};

#include "private/set.cpp"

#endif
