/*
 * File: vector.h
 * Last modified on Fri Jun  5 15:35:35 2009 by eroberts
 *      modified on Tue Jan  2 13:56:15 2007 by zelenski
 * -----------------------------------------------------
 * This interface file contains the Vector class template, an
 * efficient, safer, convenient replacement for the built-in array.
 */

#ifndef _vector_h
#define _vector_h

#include "genlib.h"
#include "strutils.h"
#include "foreach.h"

/*
 * Class: Vector
 * -------------
 * This interface defines a class template that stores a homogeneous
 * indexed collection. The basic operations are similar to those
 * in the built-in array type, with the added features of dynamic
 * memory management, bounds-checking on indexes, and convenient
 * insert/remove operations. Like an array, but better!
 * For maximum generality, the Vector is supplied as a class template.
 * The client specializes the vector to hold values of a specific
 * type, e.g. Vector<int> or Vector<studentT>, as needed
 */

template <typename ElemType>
class Vector {

public:

/* Forward references */
	class Iterator;

/*
 * Constructor: Vector
 * Usage: Vector<int> vec;
 *        Vector<student> dormlist(200);
 *        Vector<string> *vp = new Vector<string>;
 * -----------------------------------------------
 * The constructor initializes a new empty vector. The optional
 * argument is a hint about the expected number of elements that
 * this vector will hold, which allows vector to configure itself
 * for that capacity during initialization.  If not specified,
 * it is initialized with default capacity and grows as elements
 * are added. Note that capacity does NOT mean size, a newly
 * constructed vector always has size() = 0. A large starting
 * capacity allows you to add that many elements without requiring
 * any internal reallocation. The explicit keyword is required to
 * avoid accidental construction of a vector from an int.
 */
	explicit Vector(int sizeHint = 0);

/*
 * Destructor: ~Vector
 * Usage: delete vp;
 * -----------------
 * The destructor deallocates storage associated with this vector.
 */
	~Vector();

/*
 * Method: size
 * Usage: nElems = vec.size();
 * ---------------------------
 * This method returns the number of elements in
 * this vector.
 */
	int size();

/*
 * Method: isEmpty
 * Usage: if (vec.isEmpty())...
 * -----------------------------
 * This method returns true if this vector contains no
 * elements, false otherwise.
 */
	bool isEmpty();

/*
 * Method: getAt
 * Usage: val = vec.getAt(3);
 * --------------------------
 * This method returns the element at the specified index
 * in this vector. Elements are indexed starting from 0.  A call to
 * vec.getAt(0) returns the first element, vec.getAt(vec.size()-1)
 * returns the last. Raises an error if index is outside the range
 * [0, size()-1].
 */
	ElemType getAt(int index);

/*
 * Method: setAt
 * Usage: vec.setAt(3, value);
 * ---------------------------
 * This method replaces the element at the specified index
 * in this vector with a new value.  The previous value at that
 * index is overwritten with the new value. The size of the vector
 * is unchanged. Raises an error if index is not within the
 * range [0, size()-1].
 */
	void setAt(int index, ElemType value);

/*
 * Method: operator[]
 * Usage: vec[0] = vec[1];
 * -----------------------
 * This method overloads [] to access elements from
 * this vector. This allows the client to use array-like notation
 * to get/set individual vector elements. Returns a reference to
 * the element to allow in-place modification of values. Raises
 * an error if index is not within the range [0, size()-1].
 */
	ElemType & operator[](int index);

/*
 * Method: add
 * Usage: vec.add(value);
 * ----------------------
 * This method adds an element to the end of this vector.
 * The vector's size increases by one.
 */
	void add(ElemType elem);

/*
 * Method: insertAt
 * Usage: vec.insertAt(0, value);
 * ------------------------------
 * This method inserts the element into this vector at
 * the specified index, shifting all subsequent elements one
 * index higher. A call to vec.insertAt(0, val) inserts a new
 * element at the beginning, vec.insertAt(vec.size(), val) add
 * a new element to the end. The vector's size increases by one.
 * Raises an error if index is outside the range [0, size()].
 */
	void insertAt(int index, ElemType elem);

/*
 * Method: removeAt
 * Usage: vec.removeAt(3);
 * -----------------------
 * This method removes the element at the specified
 * index from this vector, shifting all subsequent elements one
 * index lower. A call to vec.removeAt(0) removes the first
 * element, vec.removeAt(vec.size()-1), removes the last. The
 * vector's size decreases by one. Raises an error if index is
 * outside the range [0, size()-1].
 */
	void removeAt(int index);

/*
 * Method: clear
 * Usage: vec.clear();
 * -------------------
 * This method removes all elements from this vector. The
 * vector is made empty and will have size() = 0.
 */
	void clear();

/*
 * SPECIAL NOTE: mapping/iteration support
 * ---------------------------------------
 * The Vector class supports both a mapping operation and an iterator which
 * allow the client access to all elements one by one.  In general,
 * these  are intended for _viewing_ elements and can behave
 * unpredictably if you attempt to modify the vector's contents during
 * mapping/iteration.
 */

/*
 * Method: mapAll
 * Usage: vector.mapAll(Print);
 * ----------------------------
 * This method iterates through this vector's contents
 * and calls the function fn once for each element.
 */
	void mapAll(void (*fn)(ElemType elem));

/*
 * Method: mapAll
 * Usage: vector.mapAll(PrintToFile, outputStream);
 * ------------------------------------------------
 * This method iterates through this vector's contents
 * and calls the function fn once for each element, passing
 * the element and the client's data. That data can be of whatever
 * type is needed for the client's callback.
 */
	template <typename ClientDataType>
	void mapAll(void (*fn)(ElemType elem, ClientDataType & data),
	            ClientDataType & data);

/*
 * Method: iterator
 * Usage: iter = vector.iterator();
 * --------------------------------
 * This method creates an iterator that allows the client to
 * iterate through the elements in this vector.  The elements are
 * returned in index order.
 *
 * The idiomatic code for accessing elements using an iterator is
 * to create the iterator from the collection and then enter a loop
 * that calls next() while hasNext() is true, like this:
 *
 *     Vector<int>::Iterator iter = vector.iterator();
 *     while (iter.hasNext()) {
 *         int elem = iter.next();
 *         . . .
 *     }
 *
 * This pattern can be abbreviated to the following more readable form:
 *
 *     foreach (int elem in vector) {
 *         . . .
 *     }
 *
 * To avoid exposing the details of the class, the definition of the
 * Iterator class itself appears in the private/vector.h file.
 */
	Iterator iterator();

private:

#include "private/vector.h"

};

#include "private/vector.cpp"

#endif
