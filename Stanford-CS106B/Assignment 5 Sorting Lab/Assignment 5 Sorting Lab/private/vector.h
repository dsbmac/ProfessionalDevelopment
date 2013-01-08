/*
 * File: private/vector.h
 * Last modified on Fri Jun  5 15:39:26 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the vector.h interface.
 * This portion of the class definition is taken out of the vector.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Class: Vector<ElemType>::Iterator
 * ---------------------------------
 * This interface defines a nested class within the Vector template that
 * provides iterator access to the Vector contents.
 */
	class Iterator : public FE_Iterator {
	public:
		Iterator();
		bool hasNext();
		ElemType next();

	private:
		Iterator(Vector *vecRef);
		Vector *vp;
		int curIndex;
		long timestamp;
		friend class Vector;
	};
	friend class Iterator;
	ElemType foreachHook(FE_State & _fe);

/*
 * Deep copying support
 * --------------------
 * This copy constructor and operator= are defined to make a
 * deep copy, making it possible to pass/return vectors by value
 * and assign from one vector to another. The entire contents of
 * the vector, including all elements, are copied. Each vector
 * element is copied from the original vector to the copy using
 * assignment (operator=). Making copies is generally avoided
 * because of the expense and thus, vectors are typically passed
 * by reference, however, when a copy is needed, these operations
 * are supported.
 */
	const Vector & operator=(const Vector & rhs);
	Vector(const Vector & rhs);

private:
	ElemType *elements;
	int numAllocated, numUsed;
	long timestamp;

	void checkRange(int index, const char *msg);
	void enlargeCapacity();
	void copyInternalData(const Vector & other);
