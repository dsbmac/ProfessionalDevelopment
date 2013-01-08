/*
 * File: bst.h
 * Last modified on Fri Jun  5 15:08:03 2009 by eroberts
 *      modified on Tue Jan  2 14:23:33 2007 by zelenski
 * -----------------------------------------------------
 * This interface file contains the BST class template, an
 * implementation of a general binary search tree.
 *
 */

#ifndef _bst_h
#define _bst_h

#include "genlib.h"
#include "cmpfn.h"
#include "stack.h"
#include "foreach.h"

/*
 * Class: BST
 * ----------
 * This interface defines a class template for a binary search tree.
 * For maximum generality, the BST is supplied as a class template.
 * The element type is set by the client. The client specializes
 * the tree for specific type, e.g. BST<int> or BST<studentT>.
 * The one requirement on the element type is that the client must
 * supply a comparison fn that compares two elements (or be willing
 * to use the default comparison function that relies on < and ==).
 */

template <typename ElemType>
class BST {
public:

/* Forward references */
	class Iterator;

/*
 * Constructor: BST
 * Usage: BST<int> bst;
 *        BST<song> songs(CompareSong)
 *        BST<string> *bp = new BST<string>;
 * -----------------------------------------
 * The constructor initializes a new empty binary search tree.
 * The one argument is a comparison function, which is called
 * to compare data values.  This argument is optional, if not
 * given, the OperatorCmp function from cmpfn.h is used, which
 * applies the built-in operator < to its operands. If the
 * behavior of < on your ElemType is defined and sufficient,
 * you do not need to supply your own comparison function.
 */
	BST(int (*cmpFn)(ElemType one, ElemType two) = OperatorCmp);

/*
 * Destructor: ~BST
 * Usage: delete bp;
 * ------------------
 * The destructor deallocates storage for this tree.
 */
	~BST();

/*
 * Method: size
 * Usage: count = bst.size();
 * --------------------------
 * This method returns the number of elements in
 * this tree.
 */
	int size();

/*
 * Method: isEmpty
 * Usage: if (bst.isEmpty())...
 * ----------------------------
 * This method returns true if this tree contains no
 * elements, false otherwise.
 */
	bool isEmpty();

/*
 * Method: find
 * Usage:  if (bst.find(key) != NULL) . . .
 * ----------------------------------------
 * This method applies the binary search algorithm to
 * find a particular key in this tree.  The second argument is
 * the key to use for comparison. If a node matching key appears
 * in the tree, find returns a pointer to the data in that node;
 * otherwise, find returns NULL.
 */
	ElemType *find(ElemType key);

/*
 * Method: add
 * Usage: bst.add(val);
 * --------------------
 * This method adds a new node to this tree. The elem
 * argument is compared with the data in existing nodes to find
 * the proper position. If a node with the same value already
 * exists, the contents are overwritten with the new copy and
 * false is returned.  If no matching node is found, a new node
 * is allocated and added to the tree, true is returned.
 */
	bool add(ElemType elem);

/*
 * Method: remove
 * Usage: bst.remove(key);
 -------------------------
 * This method removes a node in this tree that matches
 * the specified key. If a node matching key is found, the node
 * is removed from the tree and true is returned. If no match
 * is found, no changes are made and false is returned.
 */
	bool remove(ElemType key);

/*
 * Method: clear
 * Usage: bst.clear();
 * -------------------
 * This method removes all elements from this tree. The
 * tree is made empty and will have no nodes after being cleared.
 */
	void clear();

/*
 * Method: mapAll
 * Usage: bst.mapAll(Print);
 * -------------------------
 * This method iterates through this tree and calls the
 * function fn once for each element. The order is determined by an
 * InOrder walk of the tree.
 */
	void mapAll(void (*fn)(ElemType elem));

/*
 * Method: mapAll
 * Usage: bst.mapAll(PrintToFile, outputStream);
 * ---------------------------------------------
 * This method iterates through this tree con
 * and calls the function fn once for each element, passing
 * the element and the client's data. That data can be of
 * whatever type is needed for the client's callback. The order
 * of calls is determined by an InOrder walk of the tree.
 */
	template <typename ClientDataType>
	void mapAll(void (*fn)(ElemType elem, ClientDataType & data),
                    ClientDataType & data);

/*
 * Method: iterator
 * Usage: iter = bst.iterator();
 * -----------------------------
 * This method creates an iterator that allows the client to
 * iterate through the elements in this binary search tree.  The
 * order of elements produced by the iterator is that of an InOrder
 * walk of the tree.
 *
 * The idiomatic code for accessing elements using an iterator is
 * to create the iterator from the collection and then enter a loop
 * that calls next() while hasNext() is true, like this:
 *
 *     BST<string>::Iterator iter = bst.iterator();
 *     while (iter.hasNext()) {
 *         string key = iter.next();
 *         . . .
 *     }
 *
 * This pattern can be abbreviated to the following more readable form:
 *
 *     foreach (string key in bst) {
 *         . . .
 *     }
 *
 * To avoid exposing the details of the class, the definition of the
 * Iterator class itself appears in the private/bst.h file.
 */
	Iterator iterator();

private:

#include "private/bst.h"

};

#include "private/bst.cpp"

#endif
