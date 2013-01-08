/*
 * File: cmpfn.h
 * Last modified on Wed Sep 18 14:38:14 2002 by zelenski
 * -----------------------------------------------------
 * This interface exports a comparison function template.
 */

#ifndef _cmpfn_h
#define _cmpfn_h

/*
 * Function template: OperatorCmp
 * Usage:  int sign = OperatorCmp(val1, val2);
 * -------------------------------------------
 * This function template is a generic function to
 * compare two values using the built-in == and < operators.
 * It is supplied as a convenience for those situations
 * where a comparison function is required, and the type
 * has a built-in ordering that you would like to use.
 */
template <typename Type>
int OperatorCmp(Type one, Type two) {
	if (one == two) return 0;
	if (one < two) return -1;
	return 1;
}

#endif
