/*
 * File: private/lexicon.h
 * Last modified on Fri Jun 19 17:43:00 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the lexicon.h interface.
 * This portion of the class definition is taken out of the lexicon.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Class: Lexicon::Iterator
 * ------------------------
 * This interface defines a nested class within the Lexicon class that
 * provides iterator access to the words in the lexicon.
 */
	class Iterator : public FE_Iterator {
	public:
		Iterator();
		bool hasNext();
		string next();

	private:
		Iterator(Lexicon *lp);
		Lexicon *lex;
		string wordFromDAWG;
		string wordFromSet;
		void *edgePtr;
		Stack<void *> stack;
		Set<string>::Iterator setIterator;
		long timestamp;
		void advanceToNextWordInDAWG();
		void advanceToNextWordInSet();
		void advanceToNextEdge();
		friend class Lexicon;
	};
	friend class Iterator;
	string foreachHook(FE_State & _fe);

/*
 * Deep copying support
 * --------------------
 * This copy constructor and operator= are defined to make a
 * deep copy, making it possible to pass/return lexicons by value
 * and assign from one lexicon to another. The entire contents of
 * the lexicon, including all words, are copied. Making copies is
 * generally avoided because of the expense and thus, lexicons are
 * typically passed by reference, however, when a copy is needed,
 * these operations are supported.
 */
	Lexicon(const Lexicon & rhs);
	const Lexicon & operator=(const Lexicon & rhs);

private:

#ifdef _MSC_VER
#define LITTLE_ENDIAN 1
#define BYTE_ORDER LITTLE_ENDIAN
#endif

        struct Edge {
#if defined(BYTE_ORDER) && BYTE_ORDER == LITTLE_ENDIAN
                unsigned long letter:5;
                unsigned long lastEdge:1;
                unsigned long accept:1;
                unsigned long unused:1;
                unsigned long children:24;
#else
                unsigned long children:24;
                unsigned long unused:1;
                unsigned long accept:1;
                unsigned long lastEdge:1;
                unsigned long letter:5;
#endif
        };

	Edge *edges, *start;
	int numEdges, numDawgWords;
	long timestamp;
	Set<string> otherWords;

	Edge *findEdgeForChar(Edge *children, char ch);
	Edge *traceToLastEdge(const string & s);
	void readBinaryFile(string filename);
	void copyContentsFrom(const Lexicon & rhs);

	unsigned int charToOrd(char ch) {
		return ((unsigned int)(tolower(ch) - 'a' + 1));
	}

	char ordToChar(unsigned int ord) {
		return ((char)(ord - 1 + 'a'));
	}
