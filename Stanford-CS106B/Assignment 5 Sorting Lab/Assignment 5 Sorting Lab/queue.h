/*
 * File: queue.h
 * Last modified on Fri Jun  5 15:36:11 2009 by eroberts
 *      modified on Tue Jan  2 13:51:36 2007 by zelenski
 * -----------------------------------------------------
 * This interface file contains the Queue class template,
 * which provides a linear FIFO collection.
 */

#ifndef _queue_h
#define _queue_h

#include "genlib.h"

/*
 * Class: Queue
 * ------------
 * This interface defines a class that models a queue, or waiting
 * line. It is a linear collection managed in first-in-first-out
 * order. Values are added to the end and removed from the front.
 * The queue operations are enqueue (add to end) and dequeue (remove
 * from front).
 *
 * For maximum generality, the Queue is supplied as a class template.
 * The client specializes the queue to hold values of a specific type,
 * e.g. Queue<customerT> or Queue<string>, as needed
 */

template <typename ElemType>
class Queue {

public:

/*
 * Constructor: Queue
 * Usage: Queue<int> queue;
 *        Queue<string> *qp = new Queue<string>;
 * ---------------------------------------------
 * The constructor initializes a new empty queue.
 */
    Queue();

/*
 * Destructor: ~Queue
 * Usage: delete qp;
 * -----------------
 * The destructor deallocates storage associated with this queue.
 */
    ~Queue();

/*
 * Method: size
 * Usage: nElems = queue.size();
 * -----------------------------
 * This method returns the number of elements in this queue.
 */
    int size();

/*
 * Method: isEmpty
 * Usage: if (queue.isEmpty())...
 * -------------------------------
 * This method returns true if this queue contains no
 * elements, false otherwise.
 */
    bool isEmpty();

/*
 * Method: enqueue
 * Usage: queue.enqueue(element);
 * -------------------------------
 * This method adds element to the end of this queue. That
 * element becomes the last element in the queue. The queue's size
 * increases by one.
 */
    void enqueue(ElemType elem);

/*
 * Method: dequeue
 * Usage: first = queue.dequeue();
 * -------------------------------
 * This method removes the front element from this queue
 * and returns it. The front element is the one that was first
 * enqueued. The queue's size decreases by one. This function
 * raises an error if called on an empty queue.
 */
    ElemType dequeue();

/*
 * Method: peek
 * Usage: first = queue.peek();
 * --------------------------
 * This method returns the value of front element in this
 * queue, without removing it.  The queue's size is unchanged.
 * Raises an error if peek is called on an empty queue.
 */
    ElemType peek();

/*
 * Method: clear
 * Usage: queue.clear();
 * ---------------------
 * This method removes all elements from this queue. The
 * queue is made empty and will have size() = 0.
 */
    void clear();

private:

#include "private/queue.h"

};

#include "private/queue.cpp"

#endif
