/*
 * File: private/vector.cpp
 * Last modified on Fri Jun  5 16:19:42 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the implementation of the vector.h interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _vector_h

/*
 * Vector class implementation
 * ---------------------------
 * The Vector is internally managed as a dynamic array of elements.
 * It tracks capacity (numAllocated) separately from size (numUsed).
 * All access is bounds-checked for safety.
 */

template <typename ElemType>
Vector<ElemType>::Vector(int capacity) {
	elements = new ElemType[capacity];
	numAllocated = capacity;
	numUsed = 0;
	timestamp = 0L;
}

template <typename ElemType>
Vector<ElemType>::~Vector() {
	if (elements != NULL) delete[] elements;
}

template <typename ElemType>
inline int Vector<ElemType>::size() {
	return numUsed;
}

template <typename ElemType>
bool Vector<ElemType>::isEmpty() {
	return size() == 0;
}

template <typename ElemType>
ElemType Vector<ElemType>::getAt(int index) {
	checkRange(index, "getAt");
	return elements[index];
}

template <typename ElemType>
void Vector<ElemType>::setAt(int index, ElemType elem) {
	checkRange(index, "setAt");
	elements[index] = elem;
}

/* Private method: checkRange
 * --------------------------
 * Verifies that index is in range for this vector, if not, raises an
 * error.  The verb string is used in the error message to describe the
 * operation that caused the range error, .e.g "setAt" or "removeAt".
 */

template <typename ElemType>
inline void Vector<ElemType>::checkRange(int index, const char *verb) {
	if (index < 0 || index >= size()) {
		Error("Attempt to " + string(verb) + " index "
		      + IntegerToString(index) + " in a vector of size "
		      + IntegerToString(size()) + ".");
	}
}

template <typename ElemType>
inline ElemType &Vector<ElemType>::operator[](int index) {
	checkRange(index, "access");
	return elements[index];
}

template <typename ElemType>
void Vector<ElemType>::add(ElemType elem) {
	insertAt(numUsed, elem);
}

template <typename ElemType>
void Vector<ElemType>::insertAt(int index, ElemType elem) {
	if (numAllocated == numUsed) enlargeCapacity();
	if (index != numUsed) checkRange(index, "insertAt");
	for (int i = numUsed; i > index; i--) {
		elements[i] = elements[i-1];
	}
	elements[index] = elem;
	numUsed++;
	timestamp++;
}

template <typename ElemType>
void Vector<ElemType>::removeAt(int index) {
	checkRange(index, "removeAt");
	for (int i = index; i < numUsed-1; i++) {
		elements[i] = elements[i+1];
	}
	numUsed--;
	timestamp++;
}

template <typename ElemType>
void Vector<ElemType>::clear() {
	delete[] elements;
	elements = NULL;
	numUsed = numAllocated = 0;
	timestamp++;
}

template <typename ElemType>
const Vector<ElemType> &Vector<ElemType>::operator=(const Vector & rhs) {
	if (this != &rhs) {
		clear();
		copyInternalData(rhs);
		timestamp = 0L;
	}
	return *this;
}

template <typename ElemType>
Vector<ElemType>::Vector(const Vector & rhs) {
	copyInternalData(rhs);
	timestamp = 0L;
}

template <typename ElemType>
void Vector<ElemType>::mapAll(void (*fn)(ElemType)) {
	long t0 = timestamp;
	for (int i = 0; i < numUsed; i++) {
		if (timestamp != t0) {
			Error("Vector structure has been modified");
		}
		fn(elements[i]);
	}
}

template <typename ElemType>
template <typename ClientDataType>
void Vector<ElemType>::mapAll(void (*fn)(ElemType, ClientDataType&),
                              ClientDataType & data) {
	long t0 = timestamp;
	for (int i = 0; i < numUsed; i++) {
		if (timestamp != t0) {
			Error("Vector structure has been modified");
		}
		fn(elements[i], data);
	}
}

/*
 * Vector::Iterator class implementation
 * ----------------------------------
 * The Iterator for Vector maintains a pointer to the original Vector and
 * an index into that vector that identifies the next element to return.
 */

template <typename ElemType>
Vector<ElemType>::Iterator::Iterator() {
	vp = NULL;
}

template <typename ElemType>
typename Vector<ElemType>::Iterator Vector<ElemType>::iterator() {
	return Iterator(this);
}

template <typename ElemType>
Vector<ElemType>::Iterator::Iterator(Vector *vecRef) {
	vp = vecRef;
	curIndex = 0;
	timestamp = vp->timestamp;
}

template <typename ElemType>
bool Vector<ElemType>::Iterator::hasNext() {
	if (vp == NULL) Error("hasNext called on uninitialized iterator");
	if (timestamp != vp->timestamp) {
		Error("Vector structure has been modified");
	}
	return curIndex < vp->size();
}

template <typename ElemType>
ElemType Vector<ElemType>::Iterator::next() {
	if (vp == NULL) Error("next called on uninitialized iterator");
	if (!hasNext()) {
		Error("Attempt to get next from iterator"
		      " where hasNext() is false");
	}
	return (*vp)[curIndex++];
}

template <typename ElemType>
ElemType Vector<ElemType>::foreachHook(FE_State & fe) {
	if (fe.state == 0) fe.iter = new Iterator(this);
	if (((Iterator *) fe.iter)->hasNext()) {
		fe.state = 1;
		return ((Iterator *) fe.iter)->next();
	} else {
		fe.state = 2;
		return ElemType();
	}
}

/* Private method: enlargeCapacity
 * -------------------------------
 * Doubles the current capacity of the vector's internal storage,
 * copying all existing values.
 */

template <typename ElemType>
void Vector<ElemType>::enlargeCapacity() {
	numAllocated = (numAllocated == 0 ? 10 : numAllocated*2);
	ElemType *newArray = new ElemType[numAllocated];
	for (int i = 0; i < numUsed; i++) {
		newArray[i] = elements[i];
	}
	delete[] elements;
	elements = newArray;
}

/* Private method: copyInternalData
 * --------------------------------
 * Common code factored out of the copy constructor and operator= to
 * copy the contents from the other vector.
 */

template <typename ElemType>
void Vector<ElemType>::copyInternalData(const Vector & other) {
	elements = new ElemType[other.numUsed];
	for (int i = 0; i < other.numUsed; i++) {
		elements[i] = other.elements[i];
	}
	numUsed = other.numUsed;
	numAllocated = other.numUsed;
}

#endif
