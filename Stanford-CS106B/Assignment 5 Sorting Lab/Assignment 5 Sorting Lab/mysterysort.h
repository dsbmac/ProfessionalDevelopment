/*
 * File: mysterysort.h
 * -------------------
 * This interface exports a set of mystery sorting routines.
 *
 * jzelenski Winter 2007-08
 */

#ifndef _mystsort_h
#define _mystsort_h

#include "vector.h"


/* Function: MysterySort1, MysterySort2, etc.
 * Usage:  MysterySort1(scores);
 * -----------------------------
 * Each of these functions will sort a vector of integers into ascending order.
 * Each uses a different sorting algoritm, and therein lies the mystery!
 *
 * The optional second argument is a value that limits the sort to a given
 * amount of processing time.  The maxSecs argument is expressed in seconds.
 * The function will return after that much time has elapsed (approximately), 
 * even if the sorting hasn't been finished. By choosing an appropriate stop, 
 * you can examine the data mid-sort, which allows you to look for patterns in 
 * how the data is being rearranged. The default argument sets maxSecs to -1,
 * which indicates the sort should be run to completion. Note that maxSecs can 
 * be specified as a fractional value (e.g. .001) which is handy because a lot 
 * of processing can occur in even just 1 whole second.
 */
void MysterySort1(Vector<int> &nums, double maxSecs = -1);
void MysterySort2(Vector<int> &nums, double maxSecs = -1);
void MysterySort3(Vector<int> &nums, double maxSecs = -1);
void MysterySort4(Vector<int> &nums, double maxSecs = -1);
void MysterySort5(Vector<int> &nums, double maxSecs = -1);

#endif
