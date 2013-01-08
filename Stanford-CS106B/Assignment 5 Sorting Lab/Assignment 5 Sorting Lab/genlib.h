/*
 * File: genlib.h
 * Last modified on Sun Jul 17 2011 by Colin Leach
 *      modified on Mon Jun  8 20:16:05 2009 by eroberts
 *      modified on Wed Sep 18 13:41:31 2002 by zelenski
 * -----------------------------------------------------
 * This header file is indicated to be included in
 * all the programs written for CS106B/X and provides a few
 * common definitions. Note this header has a "using namespace std"
 * clause. If a file includes this header, it can then use
 * features from the std namespace without qualifying by scope.
 *
 * IMPORTANT!!  I had to change the interface after failing to
 * implement the Stanford version. Hence the genlib.h bundled
 * with CS106B exercises is NOT compatible - don't use it with 
 * Colin's open-source library code.
 * Apologies for the inconvenience, but I'm a C++ novice doing
 * the best I can.
 */

#ifndef _genlib_h
#define _genlib_h

/* This strange-looking pragma is here to disable a warning from Visual C++
 * about truncating long identifiers for debugging symbols. The warning is
 * harmless, but a little disconcerting, so we suppress it. It comes up
 * using STL and other long template expansions.
 */
#if defined(_MSC_VER)
#pragma warning(disable: 4786)
#endif

#include <string>
#include <exception>
using namespace std;

/*
 * Class: ErrorException
 * ---------------------
 * This exception is raised by calls to the Error function, which
 * makes it possible for clients to respond to error conditions
 * without having their programs bomb completely.
 */

class ErrorException : public exception {
public:
    ErrorException(string msg);
    virtual ~ErrorException() throw ();
    virtual const char* what() const throw ();
    //virtual string getMessage();
private:
    string msg;
};

/*
 * Function: Error
 * Usage: Error(msg);
 * ------------------
 * Error is used to signal an error condition in a program.  It first
 * throws an ErrorException.  If that isn't caught, it outputs the
 * error message string to the cerr stream and then exits the program
 * with a status code indicating failure.
 */

void Error(string str);

/*
 * Function macro: main
 * --------------------
 * The purpose of this macro definition is to rename the student
 * main to Main in order to allow a custom main defined in our
 * libraries to configure the application before passing control
 * back to the student program.
 *
 * Note that this non-Stanford version only affects the zero-argument
 * form of main(), not main(int argc, char* argv[]).
 * If you want to use command-line arguments, you also have to catch
 * your own ErrorException - see init.h/init.cpp for details.
 */

#define main() Main()

#endif
