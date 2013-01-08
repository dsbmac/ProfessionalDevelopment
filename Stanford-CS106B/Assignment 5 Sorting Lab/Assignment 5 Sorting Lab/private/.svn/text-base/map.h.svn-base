/*
 * File: private/map.h
 * Last modified on Fri Jun  5 15:39:52 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the map.h interface.
 * This portion of the class definition is taken out of the map.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Legacy method: add
 * ------------------
 * Old name for put method.  This name was changed for compatibility
 * with Java and to emphasize the symmetry between get and put.
 */
	void add(string key, ValueType value);

/*
 * Legacy method: getValue
 * -----------------------
 * Old name for get method.  This name was changed for compatibility
 * with Java and to emphasize the symmetry between get and put.
 */
	ValueType getValue(string key);

/*
 * Class: Map<ValType>::Iterator
 * ------------------------------
 * This interface defines a nested class within the Map template that
 * provides iterator access to the keys contained in the Map.
 */
	class Iterator : public FE_Iterator {
	public:
		Iterator();
		bool hasNext();
		string next();

	private:
		Iterator(Map *mp);
		Map *mp;
		int bucketIndex;
		void *cellPtr;
		long timestamp;
		void advanceToNextKey();
		friend class Map;
	};
	friend class Iterator;
	string foreachHook(FE_State & _fe);

/*
 * Deep copying support
 * --------------------
 * This copy constructor and operator= are defined to make a
 * deep copy, making it possible to pass/return maps by value
 * and assign from one map to another. The entire contents of
 * the map, including all entries, are copied. Each map
 * entry is copied from the original map to the copy using
 * assignment (operator=). Making copies is generally avoided
 * because of the expense and thus, maps are typically passed by
 * reference, however, when a copy is needed, these operations
 * are supported.
 */
	const Map & operator=(const Map & rhs);
	Map(const Map & rhs);

private:
	struct cellT {
		string key;
		ValueType value;
		cellT *next;
	};

	Vector<cellT *> buckets;
	int numEntries;
	long timestamp;

	void initBuckets(int nBuckets);
	void deleteBuckets(Vector<cellT *> & bucketsToDelete);
	int hash(string s);
	cellT *findCell(cellT *head, string key, cellT **prev = NULL);
	void expandAndRehash();
	void copyOtherEntries(const Map & rhs);
