/*
 * File: private/lexicon.cpp
 * Last modified on Fri Jun  5 09:27:01 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the implementation of the lexicon.h interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _lexicon_h

template <typename ClientDataType>
void Lexicon::mapAll(void (*fn)(string word, ClientDataType &),
                     ClientDataType & clientData) {
	Lexicon::Iterator iter = iterator();
	while (iter.hasNext()) {
		fn(iter.next(), clientData);
	}
}

#endif
