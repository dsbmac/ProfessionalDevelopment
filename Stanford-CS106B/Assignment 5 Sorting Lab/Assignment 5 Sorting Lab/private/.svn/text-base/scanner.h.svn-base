/*
 * File: private/scanner.h
 * Last modified on Tue Jun  9 00:19:57 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the scanner.h interface.
 * This portion of the class definition is taken out of the scanner.h
 * header so that the client need not have to see all of these
 * details.
 */

	enum realNumScanStateT {
		InitialState,
		BeforeDecimalPoint,
		AfterDecimalPoint,
		StartingExponent,
		FoundExponentSign,
		ScanningExponent,
		FinalState
	};

	string buffer;
	int buflen;
	int cp;
	istream *fp;
	spaceOptionT spaceOption;
	numberOptionT numberOption;
	stringOptionT stringOption;
	bracketOptionT bracketOption;
	Stack<string> savedTokens;

	void skipSpaces();
	int scanToEndOfIdentifier();
	int scanToEndOfInteger();
	int scanToEndOfReal();
	string scanQuotedString();
	char scanEscapeCharacter();
	string scanTag();
