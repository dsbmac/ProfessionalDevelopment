/*
 * File: private/set.h
 * Last modified on Fri Jun  5 15:39:43 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the set.h interface.
 * This portion of the class definition is taken out of the set.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Legacy function: intersect
 * --------------------------
 * This name was changed to intersectWith for symmetry with unionWith.
 */
	void intersect(Set & otherSet);

/*
 * Class: Set<ElemType>::Iterator
 * ---------------------------------
 * This interface defines a nested class within the Set template that
 * provides iterator access to the Set contents.
 */
	class Iterator : public FE_Iterator {
	public:
		Iterator();
		bool hasNext();
		ElemType next();

	private:
		Iterator(Set *setptr);
		typename BST<ElemType>::Iterator iterator;
		friend class Set;
	};
	friend class Iterator;
	ElemType foreachHook(FE_State & _fe);

/*
 * Deep copying support
 * --------------------
 * Because all Set data members have correct behavior on operator=
 * and copy constructor, the default for these as synthesized by
 * the compiler make a correct copy of the Set. When pass/return
 * sets by value, or assign one to another, the entire contents of
 * the set, including all elements, are copied. Each set
 * element is copied from the original set to the copy using
 * assignment (operator=). Making copies is generally avoided
 * because of the expense and thus, sets are typically passed by
 * reference, however, when a copy is needed, these operations
 * are supported.
 */

private:
	BST<ElemType> bst;
	int (*cmpFn)(ElemType, ElemType);
