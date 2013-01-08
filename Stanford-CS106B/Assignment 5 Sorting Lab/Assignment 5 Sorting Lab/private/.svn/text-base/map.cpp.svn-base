/*
 * File: private/map.cpp
 * Last modified on Thu Jun 11 12:56:31 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the map.cpp interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _map_h

/*
 * Implementation notes: Map class
 * -------------------------------
 * In this map implementation, the entries are stored in a hashtable.
 * The hashtable keeps a vector of "buckets", where each bucket is a
 * linked list of elements that share the same hash code (i.e. hash
 * collisions are resolved by chaining). The buckets are dynamically
 * allocated so that we can change the the number of buckets (rehash)
 * when the load factor becomes too high. The map should provide O(1)
 * performance on the put/remove/get operations.
 */

template <typename ValueType>
Map<ValueType>::Map(int sizeHint) {
	if (sizeHint < 0) Error("Negative sizeHint given to Map constructor");
	initBuckets(sizeHint);
	timestamp = 0L;
}

template <typename ValueType>
Map<ValueType>::~Map() {
	deleteBuckets(buckets);
}

template <typename ValueType>
int Map<ValueType>::size() {
	return numEntries;
}

template <typename ValueType>
bool Map<ValueType>::isEmpty() {
	return size() == 0;
}

template <typename ValueType>
void Map<ValueType>::put(string key, ValueType value) {
	(*this)[key] = value;
}

template <typename ValueType>
void Map<ValueType>::remove(string key) {
	int hashCode = hash(key);
	cellT *prev;
	cellT *found = findCell(buckets[hashCode], key, &prev);
	if (found != NULL) {
		if (prev != NULL) {
			prev->next = found->next;
		} else {
			buckets[hashCode] = found->next;
		}
		numEntries--;
		delete found;
	}
	timestamp++;
}

template <typename ValueType>
void Map<ValueType>::clear() {
	deleteBuckets(buckets);
	numEntries = 0;
	timestamp++;
}

template <typename ValueType>
bool Map<ValueType>::containsKey(string key) {
	int hashCode = hash(key);
	return findCell(buckets[hashCode], key) != NULL;
}

template <typename ValueType>
ValueType Map<ValueType>::get(string key) {
	if (containsKey(key)) return (*this)[key];
	Error("Attempt to get value for key which is not contained in map.");
	return ValueType();
}

template <typename ValueType>
ValueType & Map<ValueType>::operator[](string key) {
	int hashCode = hash(key);
	cellT *cp = findCell(buckets[hashCode], key);
	if (cp == NULL) {
		if (numEntries > buckets.size()*2) expandAndRehash();
		hashCode = hash(key);
		cp = new cellT;
		cp->key = key;
		cp->value = ValueType();
		cp->next = buckets[hashCode];
		buckets[hashCode] = cp;
		numEntries++;
		timestamp++;
	}
	return cp->value;
}

template <typename ValueType>
const Map<ValueType> &Map<ValueType>::operator=(const Map & rhs) {
	if (this != &rhs) {
		deleteBuckets(buckets);
		copyOtherEntries(rhs);
		timestamp = 0L;
	}
	return *this;
}

template <typename ValueType>
Map<ValueType>::Map(const Map & rhs) {
	copyOtherEntries(rhs);
	timestamp = 0L;
}

template <typename ValueType>
void Map<ValueType>::add(string key, ValueType value) {
	put(key, value);
}

template <typename ValueType>
ValueType Map<ValueType>::getValue(string key) {
	return get(key);
}

template <typename ValueType>
template <typename ClientData>
void Map<ValueType>::mapAll(void (*fn)(string, ValueType, ClientData &),
                            ClientData & data) {
	long t0 = timestamp;
	for (int i = 0 ; i < buckets.size(); i++) {
		for (cellT *cp = buckets[i]; cp != NULL; cp = cp->next) {
			fn(cp->key, cp->value, data);
			if (t0 != timestamp) {
				Error("mapAll: Map structure changed");
			}
		}
	}
}

template <typename ValueType>
void Map<ValueType>::mapAll(void (*fn)(string key, ValueType value)) {
	long t0 = timestamp;
	for (int i = 0 ; i < buckets.size(); i++) {
		for (cellT *cp = buckets[i]; cp != NULL; cp = cp->next) {
			fn(cp->key, cp->value);
			if (t0 != timestamp) {
				Error("mapAll: Map structure changed");
			}
		}
	}
}

/*
 * Private method: deleteBuckets
 * Usage: deleteBuckets(buckets);
 * ------------------------------
 * This function deletes all the cells in the linked lists contained in vector.
 */

template <typename ValueType>
void Map<ValueType>::deleteBuckets(Vector<cellT *> & b) {
	for (int i = 0; i < b.size(); i++) {
		while (b[i] != NULL) {
			cellT *next = b[i]->next;
			delete b[i];
			b[i] = next;
		}
	}
}

/*
 * Private method: findCell
 * Usage: cp = findCell(cp, key, &prev);
 * -------------------------------------
 * This function finds a cell in the chain beginning at cp that
 * matches key.  If a match is found, a pointer to that cell is
 * returned.  If no match is found, the function returns NULL.
 * The optional third argument is a pointer to the previous cell
 * pointer, which the client may need if attempting to splice out
 * the found cell. If not specified, NULL is the default value.
 */

template <typename ValueType>
typename Map<ValueType>::cellT
         *Map<ValueType>::findCell(cellT *cp, string key, cellT **prevByRef) {
	cellT *prev = NULL;
	while (cp != NULL && key != cp->key) {
		prev = cp;
		cp = cp->next;
	}
	if (prevByRef != NULL) *prevByRef = prev;
	return cp;
}

/*
 * Private method: hash
 * Usage: bucket = hash(key);
 * --------------------------
 * This function takes the key and uses it to derive a hash code,
 * which is an integer in the range [0, buckets.size() - 1].  The hash
 * code is computed using a method called linear congruence.
 */

template <typename ValueType>
int Map<ValueType>::hash(string s) {
	const long Multiplier = -1664117991;
	unsigned long hashcode = 0;
	for (string::size_type i = 0; i < s.length(); i++) {
		hashcode = hashcode * Multiplier + s[i];
	}
	return hashcode % buckets.size();
}

/*
 * Private method: expandAndRehash
 * Usage: expandAndRehash();
 * -------------------------
 * This method is used to increase the number of buckets in the map
 * and then rehashes all existing entries and adds them into new buckets.
 * This operation is used when the load factor (i.e. the number of cells
 * per bucket) has increased enough to warrant this O(N) operation to
 * enlarge and redistribute the entries.
 */

template <typename ValueType>
void Map<ValueType>::expandAndRehash() {
	Vector<cellT *>oldBuckets = buckets;
	initBuckets(oldBuckets.size()*2 + 1);
	for (int i = 0; i < oldBuckets.size(); i++) {
		for (cellT *cp = oldBuckets[i]; cp != NULL; cp = cp->next) {
			put(cp->key, cp->value);
		}
	}
	deleteBuckets(oldBuckets);
}

/*
 * Private method: initBuckets
 * Usage: initBuckets(101);
 * -----------------------
 * This methods sets up the vector of buckets to have nBuckets
 * entries, each NULL. If asked to make empty vector, makes one bucket
 * just to simplify handling elsewhere.
 */

template <typename ValueType>
void Map<ValueType>::initBuckets(int nBuckets) {
	if (nBuckets == 0) nBuckets = 1;
	buckets = Vector<cellT *>(nBuckets);
	for (int i = 0; i < nBuckets; i++) {
		buckets.add(NULL);
	}
	numEntries = 0;
}

template <typename ValueType>
static void AddToMap(string key, ValueType val, Map<ValueType> & map) {
	map.put(key, val);
}

/*
 * Private method: copyOtherEntries
 * Usage: copyOtherEntries(otherMap);
 * ----------------------------------
 * This methods adds a copy of all entries from the other map to
 * this one.
 *
 * Implementation note: We aren't really adhering to const. Even though
 * the methods invoked on rhs don't modify it, they aren't marked const,
 * and thus trigger compiler problems. We cast away const-ness to avoid
 * this erroneous complaints. Sigh.
 */

template <typename ValueType>
void Map<ValueType>::copyOtherEntries(const Map & constRhs) {
	Map & rhs = const_cast<Map &>(constRhs);
	initBuckets(rhs.size());
	rhs.mapAll< Map<ValueType> >(AddToMap, *this);
}

/*
 * Map::Iterator class implementation
 */

template <typename ValueType>
Map<ValueType>::Iterator::Iterator() {
	mp = NULL;
}

template <typename ValueType>
typename Map<ValueType>::Iterator Map<ValueType>::iterator() {
	return Iterator(this);
}

template <typename ValueType>
Map<ValueType>::Iterator::Iterator(Map *mapptr) {
	mp = mapptr;
	bucketIndex = -1;
	cellPtr = NULL;
	timestamp = mp->timestamp;
	advanceToNextKey();
}

template <typename ValueType>
bool Map<ValueType>::Iterator::hasNext() {
	if (mp == NULL) Error("hasNext called on uninitialized iterator");
	if (timestamp != mp->timestamp) {
		Error("Map structure has been modified");
	}
	return cellPtr != NULL;
}

template <typename ValueType>
string Map<ValueType>::Iterator::next() {
	if (mp == NULL) Error("next called on uninitialized iterator");
	if (!hasNext()) {
		Error("Attempt to get next from iterator"
		      " where hasNext() is false");
	}
	string result = ((cellT *) cellPtr)->key;
	advanceToNextKey();
	return result;
}

template <typename ValueType>
void Map<ValueType>::Iterator::advanceToNextKey() {
	cellT *cp = (cellT *) cellPtr;
	if (cp != NULL) cp = cp->next;
	while (cp == NULL && ++bucketIndex < mp->buckets.size()) {
		cp = mp->buckets[bucketIndex];
	}
	cellPtr = (void *) cp;
}

template <typename ValueType>
string Map<ValueType>::foreachHook(FE_State & fe) {
	if (fe.state == 0) fe.iter = new Iterator(this);
	if (((Iterator *) fe.iter)->hasNext()) {
		fe.state = 1;
		return ((Iterator *) fe.iter)->next();
	} else {
		fe.state = 2;
		return "";
	}
}

#endif
