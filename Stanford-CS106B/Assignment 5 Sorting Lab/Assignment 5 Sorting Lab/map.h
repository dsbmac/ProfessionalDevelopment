/*
 * File: map.h
 * Last modified on Fri Jun  5 15:06:35 2009 by eroberts
 *      modified on Tue Jan  2 14:14:44 2007 by zelenski
 * -----------------------------------------------------
 * This interface file contains the Map class template, a
 * collection for efficiently storing key-value pairs.
 */

#ifndef _map_h
#define _map_h

#include "genlib.h"
#include "vector.h"
#include "foreach.h"
#include <string>
#include <cstdlib>

/*
 * Class: Map
 * ----------
 * This interface defines a class template that stores a collection of
 * key-value pairs.  For maximum generality, the Map is supplied as a
 * class template.  The keys are always of type string, but the value
 * type is set by the client. The client specializes the map to hold
 * values of a specific type, e.g. Map<int> or Map<studentT>, as needed.
 */

template <typename ValueType>
class Map {

public:

/* Forward references */
	class Iterator;

/*
 * Constructor: Map
 * Usage: Map<int> map;
 *        Map<int> map(500);
 *        Map<string> *mp = new Map<string>;
 * -----------------------------------------
 * The constructor initializes a new empty map. The optional
 * argument is a hint about the expected number of entries
 * that this map will hold, which allows the map to configure
 * itself for efficiency at that size.  If not specified, a
 * reasonable default is used and the map will adapt as entries
 * are added. The explicit keyword is used to prevent
 * accidental construction of a Map from an integer.
 * Raises an error if sizeHint is negative.
 */
	explicit Map(int sizeHint = 101);

/*
 * Destructor: ~Map
 * Usage: delete mp;
 * -----------------
 * The destructor deallocates  storage associated with this map.
 */
	~Map();

/*
 * Method: size
 * Usage: nEntries = map.size();
 * -----------------------------
 * This method returns the number of entries in this map.
 */
	int size();

/*
 * Method: isEmpty
 * Usage: if (map.isEmpty())...
 * ----------------------------
 * This method returns true if this map contains no
 * entries, false otherwise.
 */
	bool isEmpty();

/*
 * Method: put
 * Usage: map.put(key, value);
 * ---------------------------
 * This method associates key with value in this map.
 * Any previous value associated with key is replaced by this new
 * entry. If there was already an entry for this key, the map's
 * size is unchanged; otherwise, it increments by one.
 */
	void put(string key, ValueType value);

/*
 * Method: remove
 * Usage: map.remove(key);
 * -----------------------
 * This method removes any entry for key from this map.
 * If there is no entry for the key, the map is unchanged.
 * Otherwise, the key and its associated value are removed and
 * the map's size decreases by one.
 */
	void remove(string key);

/*
 * Method: containsKey
 * Usage: if (map.containsKey(key))...
 * -----------------------------------
 * Returns true if there is an entry for key in this map,
 * false otherwise.
 */
	bool containsKey(string key);

/*
 * Method: get
 * Usage: value = map.get(key);
 * ---------------------------------
 * If key is found in this map, this method returns the
 * associated value.  If key is not found, raises an error. The
 * containsKey method can be used to verify the presence
 * of a key in the map before attempting to get its value.
 */
	ValueType get(string key);

/*
 * Method: operator[]
 * Usage: map[key] = newValue;
 * ---------------------------
 * This method overloads [] to access values from this
 * map by key. The argument inside the brackets is the key (a
 * string). This allows the client to use notation of an
 * "associative-array" to get/set the value associated with a key.
 * If the key is already present in the map, this function returns
 * a reference to its associated value, and the size of the map is
 * unchanged. If key is not present in the map, a new entry for the
 * key is added, and the size of the map increases by one. The
 * value for the newly entered key is set to the default for value
 * type, and a reference to that value is returned.  Because this
 * function returns the value by reference, it allows in-place
 * modification of the value.
 */
	ValueType & operator[](string key);

/*
 * Method: clear
 * Usage: map.clear();
 * -------------------
 * This method removes all entries from this map. The
 * map is made empty and will have size() = 0 after being cleared.
 */
	void clear();

/*
 * SPECIAL NOTE: mapping/iteration support
 * ---------------------------------------
 * The map supports both a mapping operation and an iterator which
 * allow the client access to all entries one by one.  In general,
 * these  are intended for _viewing_ entries and can behave
 * unpredictably if you attempt to modify the map's contents during
 * mapping/iteration.
 */

/*
 * Method: mapAll
 * Usage: map.mapAll(Print);
 * -------------------------
 * This method goes through every entry in this map
 * and calls the function fn, passing it two arguments:
 * the key and its associated value.
 */
	void mapAll(void (*fn)(string key, ValueType val));

/*
 * Method: mapAll
 * Usage: map.mapAll(PrintToFile, outputStream);
 * ---------------------------------------------
 * This method goes through every entry in this map
 * and calls the function fn, passing it three arguments:
 * the key, its associated value, and the client's data. That data
 * can be of whatever type is needed for the client's callback.
 */
	template <typename ClientDataType>
	void mapAll(void (*fn)(string, ValueType, ClientDataType &),
	            ClientDataType & data);

/*
 * Method: iterator
 * Usage: iter = map.iterator();
 * -----------------------------
 * This method creates an iterator that allows the client to
 * iterate through the keys in this map.  The map abstraction
 * makes no guarantees about the order in which keys are returned.
 *
 * The idiomatic code for accessing elements using an iterator is
 * to create the iterator from the collection and then enter a loop
 * that calls next() while hasNext() is true, like this:
 *
 *     Map<int>::Iterator iter = map.iterator();
 *     while (iter.hasNext()) {
 *         string key = iter.next();
 *         . . .
 *     }
 *
 * This pattern can be abbreviated to the following more readable form:
 *
 *     foreach (string key in map) {
 *         . . .
 *     }
 *
 * To avoid exposing the details of the class, the definition of the
 * Iterator class itself appears in the private/grid.h file.
 */
	Iterator iterator();

private:

#include "private/map.h"

};

#include "private/map.cpp"

#endif
