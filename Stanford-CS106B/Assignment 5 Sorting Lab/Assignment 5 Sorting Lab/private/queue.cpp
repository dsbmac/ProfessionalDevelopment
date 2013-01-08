/*
 * File: private/queue.cpp
 * Last modified on Tue Jun  9 07:53:03 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the implementation of the queue.h interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _queue_h

/*
 * Queue class implementation
 * --------------------------
 * The Queue is internally managed as a singly linked list of cells, with a
 * head and tail pointer.  The front of the queue is at the head; the end
 * is at the tail.
 */

template <typename ElemType>
Queue<ElemType>::Queue() {
	head = tail = NULL;
	count = 0;
}

template <typename ElemType>
Queue<ElemType>::~Queue() {
	deleteCells();
}

template <typename ElemType>
int Queue<ElemType>::size() {
	return count;
}

template <typename ElemType>
bool Queue<ElemType>::isEmpty() {
	return count == 0;
}

template <typename ElemType>
void Queue<ElemType>::enqueue(ElemType elem) {
	cellT *newOne = new cellT;
	newOne->elem = elem;
	newOne->next = NULL;
	if (head != NULL) {
		tail->next = newOne;
	} else {
		head = newOne;
	}
	tail = newOne;
	count++;
}

template <typename ElemType>
ElemType Queue<ElemType>::dequeue() {
	if (isEmpty()) Error("Attempt to dequeue from empty queue");
	ElemType first = head->elem;
	cellT *toDelete = head;
	head = head->next;
	delete toDelete;
	count--;
	return first;
}

template <typename ElemType>
ElemType Queue<ElemType>::peek() {
	if (isEmpty()) Error("Attempt to peek at empty queue");
	return head->elem;
}

template <typename ElemType>
void Queue<ElemType>::clear() {
	deleteCells();
	count = 0;
}

template <typename ElemType>
void Queue<ElemType>::deleteCells() {
	while (head != NULL) {
		cellT *next = head->next;
		delete head;
		head = next;
	}
	tail = NULL;
}

template <typename ElemType>
const Queue<ElemType> &Queue<ElemType>::operator=(const Queue & rhs) {
	if (this != &rhs) {
		clear();
		copyOtherData(rhs);
	}
	return *this;
}

template <typename ElemType>
Queue<ElemType>::Queue(const Queue & rhs) {
	head = tail = NULL;
	count = 0;
	copyOtherData(rhs);
}

template <typename ElemType>
void Queue<ElemType>::copyOtherData(const Queue & rhs) {
	for (cellT *cur = rhs.head; cur != NULL; cur = cur->next) {
		enqueue(cur->elem);
	}
}
#endif
