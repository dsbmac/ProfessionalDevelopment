/*
 * File: private/set.cpp
 * Last modified on Thu Jun 11 09:34:08 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the implementation of the set.h interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _set_h

template <typename ElemType>
Set<ElemType>::Set(int (*cmp)(ElemType, ElemType)) : bst(cmp) {
	cmpFn = cmp;
}

template <typename ElemType>
Set<ElemType>::~Set() {
	/* Empty */
}

template <typename ElemType>
int Set<ElemType>::size() {
	return bst.size();
}

template <typename ElemType>
bool Set<ElemType>::isEmpty() {
	return bst.isEmpty();
}

template <typename ElemType>
void Set<ElemType>::add(ElemType element) {
	bst.add(element);
}

template <typename ElemType>
void Set<ElemType>::remove(ElemType element) {
	bst.remove(element);
}

template <typename ElemType>
bool Set<ElemType>::contains(ElemType element) {
	return find(element) != NULL;
}

template <typename ElemType>
ElemType *Set<ElemType>::find(ElemType element) {
	return bst.find(element);
}

template <typename ElemType>
void Set<ElemType>::clear() {
	bst.clear();
}

/*
 * Implementation notes: Set operations
 * ------------------------------------
 * The code for equals, isSubsetOf, unionWith, intersectWith, and subtract
 * is similar in structure.  Each one uses an iterator to walk over
 * one (or both) sets, doing add/remove/comparision.
 */

template <typename ElemType>
bool Set<ElemType>::equals(Set & otherSet) {
	if (cmpFn != otherSet.cmpFn) {
		Error("Equals: sets have different comparison functions");
	}
	Iterator thisItr = iterator(), otherItr = otherSet.iterator();
	while (thisItr.hasNext() && otherItr.hasNext()) {
		if (cmpFn(thisItr.next(), otherItr.next()) != 0) return false;
	}
	return !thisItr.hasNext() && !otherItr.hasNext();
}

template <typename ElemType>
bool Set<ElemType>::isSubsetOf(Set & otherSet) {
	if (cmpFn != otherSet.cmpFn) {
		Error("isSubsetOf: sets have different comparison functions");
	}
	Iterator iter = iterator();
	while (iter.hasNext()) {
		if (!otherSet.contains(iter.next())) return false;
	}
	return true;
}

template <typename ElemType>
void Set<ElemType>::unionWith(Set & otherSet) {
	if (cmpFn != otherSet.cmpFn) {
		Error("unionWith: sets have different comparison functions");
	}
	Iterator iter = otherSet.iterator();
	while (iter.hasNext()) {
		add(iter.next());
	}
}

/*
 * Implementation notes: intersectWith
 * -----------------------------------
 * The most obvious way to write this method (iterating over
 * one set and deleting members that are not in the second)
 * fails because you can't change the contents of a collection
 * over which you're iterating.  This code puts the elements
 * to be deleted in a vector and then deletes those.
 */

template <typename ElemType>
void Set<ElemType>::intersectWith(Set & otherSet) {
	if (cmpFn != otherSet.cmpFn) {
		Error("intersectWith:"
		      " sets have different comparison functions");
	}
	Iterator iter = iterator();
	Vector<ElemType> toDelete;
	while (iter.hasNext()) {
		ElemType elem = iter.next();
		if (!otherSet.contains(elem)) toDelete.add(elem);
	}
	for (int i = 0; i < toDelete.size(); i++) {
		remove(toDelete[i]);
	}
}

template <typename ElemType>
void Set<ElemType>::intersect(Set & otherSet) {
	if (cmpFn != otherSet.cmpFn) {
		Error("intersect: sets have different comparison functions");
	}
	intersectWith(otherSet);
}

template <typename ElemType>
void Set<ElemType>::subtract(Set & otherSet) {
	if (cmpFn != otherSet.cmpFn) {
		Error("subtract: sets have different comparison functions");
	}
	Iterator iter = otherSet.iterator();
	while (iter.hasNext()) {
		remove(iter.next());
	}
}

template <typename ElemType>
void Set<ElemType>::mapAll(void (*fn)(ElemType)) {
	bst.mapAll(fn);
}

template <typename ElemType>
template <typename ClientDataType>
void Set<ElemType>::mapAll(void (*fn)(ElemType, ClientDataType &),
                           ClientDataType & data) {
	bst.mapAll(fn, data);
}

/*
 * Set::Iterator class implementation
 * ----------------------------------
 * The Iterator for Set relies on the underlying implementation of the
 * Iterator for the BST class.
 */

template <typename ElemType>
Set<ElemType>::Iterator::Iterator() {
	/* Empty */
}

template <typename ElemType>
typename Set<ElemType>::Iterator Set<ElemType>::iterator() {
	return Iterator(this);
}

template <typename ElemType>
Set<ElemType>::Iterator::Iterator(Set *setptr) {
	iterator = setptr->bst.iterator();
}

template <typename ElemType>
bool Set<ElemType>::Iterator::hasNext() {
	return iterator.hasNext();
}

template <typename ElemType>
ElemType Set<ElemType>::Iterator::next() {
	return iterator.next();
}

template <typename ElemType>
ElemType Set<ElemType>::foreachHook(FE_State & fe) {
	if (fe.state == 0) fe.iter = new Iterator(this);
	if (((Iterator *) fe.iter)->hasNext()) {
		fe.state = 1;
		return ((Iterator *) fe.iter)->next();
	} else {
		fe.state = 2;
		return ElemType();
	}
}

#endif
