/*
 * File: private/queue.h
 * Last modified on Fri Jun  5 10:06:00 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the queue.h interface.
 * This portion of the class definition is taken out of the queue.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Deep copying support
 * --------------------
 * This copy constructor and operator= are defined to make a
 * deep copy, making it possible to pass/return queues by value
 * and assign from one queue to another. The entire contents of
 * the queue, including all elements, are copied. Each queue
 * element is copied from the original queue to the copy using
 * assignment (operator=). Making copies is generally avoided
 * because of the expense and thus, queues are typically passed
 * by reference, however, when a copy is needed, these operations
 * are supported.
 */
	const Queue & operator=(const Queue & rhs);
	Queue(const Queue & rhs);

private:
	struct cellT {
		ElemType elem;
		cellT *next;
	};

	cellT *head;
	cellT *tail;
	int count;
	void deleteCells();
	void copyOtherData(const Queue & rhs);
