/*
 * File: foreach.h
 * Last modified on Thu Jun 11 12:04:09 2009 by eroberts
 * -----------------------------------------------------
 * This interface defines the foreach keyword, which is used to
 * simplify iteration.  All iterable classes import this interface,
 * so clients never need to do so explicitly.
 */

#ifndef _foreach_h
#define _foreach_h

#include "genlib.h"

/* These #includes are for files that contain "in" as a token */

#include <ios>
#include <fstream>
#include <sstream>

/* Redefine the ios constants (one of which is "in") */

static const ios::openmode IOS_APP = ios::app;
static const ios::openmode IOS_ATE = ios::ate;
static const ios::openmode IOS_BINARY = ios::binary;
static const ios::openmode IOS_IN = ios::in;
static const ios::openmode IOS_OUT = ios::out;
static const ios::openmode IOS_TRUNC = ios::trunc;

/*
 * Class: FE_Iterator
 * ------------------
 * This class is a base class for all Iterators that can work with
 * the foreach construct.  The only purpose of this class is to make
 * it possible to freeing the iterators after they are no longer needed.
 *
 * Note: FE_Iterator is implemented in lexicon.cpp, which is the only
 * iterable class that is not a template class.
 */

class FE_Iterator {
public:
	FE_Iterator();
	~FE_Iterator();
};

/*
 * Class: FE_State
 * ---------------
 * This class is used to maintain the state of the foreach processing.
 * The class itself is essentially private, but the implementations in
 * the different classes use the fields directly.
 *
 * Note: FE_State is implemented in lexicon.cpp, which is the only
 * iterable class that is not a template class.
 */

class FE_State {
public:
	int state;
	FE_Iterator *iter;

	FE_State();
	~FE_State();
};

/*
 * Macro: foreach
 * Usage: foreach (type var in collection) { . . . }
 * -------------------------------------------------
 * Provides a much simpler hook to the iterator facility.
 */

#define foreach(arg) \
  for (FE_State _fe; _fe.state < 2; ) \
    for (arg.foreachHook(_fe); _fe.state++ == 1; _fe.state = 0)

#define in =

#endif
