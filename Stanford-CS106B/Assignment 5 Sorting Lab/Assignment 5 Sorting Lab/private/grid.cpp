/*
 * File: private/grid.cpp
 * Last modified on Fri Jun  5 16:21:12 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the implementation of the grid.h interface.
 * Because of the way C++ compiles templates, this code must be
 * available to the compiler when it reads the header file.
 */

#ifdef _grid_h

/*
 * Grid class implementation
 * ---------------------------
 * The Grid is internally managed as a dynamic array of elements.  The array
 * itself is one-dimensional, the logical separation into rows and columns
 * is done manually.  The layout is in row-major order, which is to say that
 * the first entire row is laid out contiguously, followed by the entire
 * next row and so on. All access is bounds-checked for safety.
 */

template <typename ElemType>
Grid<ElemType>::Grid() {
	nRows = 0;
	nCols = 0;
	timestamp = 0L;
	elements = NULL;
}

template <typename ElemType>
Grid<ElemType>::Grid(int numRows, int numCols) {
	elements = NULL;
	timestamp = 0L;
	resize(numRows, numCols);
}

template <typename ElemType>
Grid<ElemType>::~Grid() {
	delete[] elements;
}

template <typename ElemType>
int Grid<ElemType>::numRows() {
	return nRows;
}

template <typename ElemType>
int Grid<ElemType>::numCols() {
	return nCols;
}

template <typename ElemType>
void Grid<ElemType>::resize(int numRows, int numCols) {
	if (numRows < 0 || numCols < 0) {
		Error("Attempt to resize grid to invalid size ("
		      + IntegerToString(numRows) + ", "
		      + IntegerToString(numCols) + ")");
	}
	if (elements) delete[] elements;
	nRows = numRows;
	nCols = numCols;
	elements = new ElemType[nRows * nCols];
	timestamp++;
}

template <typename ElemType>
ElemType Grid<ElemType>::getAt(int row, int col) {
	return (*this)(row, col);
}

template <typename ElemType>
void Grid<ElemType>::setAt(int row, int col, ElemType value) {
	(*this)(row, col) = value;
}

template <typename ElemType>
bool Grid<ElemType>::inBounds(int row, int col) {
	return row >= 0 && col >= 0 && row < nRows && col < nCols;
}

template <typename ElemType>
ElemType &Grid<ElemType>::operator()(int row, int col) {
	checkRange(row,col);
	return elements[(row * nCols) + col];
}

template <typename ElemType>
typename Grid<ElemType>::GridRow Grid<ElemType>::operator[](int row) {
	return GridRow(this, row);
}

template <typename ElemType>
const Grid<ElemType> & Grid<ElemType>::operator=(const Grid & rhs) {
	if (this != &rhs) {
		delete[] elements;
		copyContentsFrom(rhs);
		timestamp = 0L;
	}
	return *this;
}

template <typename ElemType>
Grid<ElemType>::Grid(const Grid & rhs) {
	copyContentsFrom(rhs);
	timestamp = 0L;
}

template <typename ElemType>
void Grid<ElemType>::checkRange(int row, int col) {
	if (row < 0 || row >= numRows() || col < 0 || col >= numCols()) {
		Error("Attempt to access location ("
		      + IntegerToString(row) + ", " + IntegerToString(col)
		      + ") in a grid of size (" + IntegerToString(numRows())
		      + ", " + IntegerToString(numCols()) + ")");
	}
}

template <typename ElemType>
void Grid<ElemType>::copyContentsFrom(const Grid & other) {
	nRows = other.nRows;
	nCols = other.nCols;
	elements = new ElemType[nRows * nCols];
	for (int i = 0; i < nRows * nCols; i++) {
		elements[i] = other.elements[i];
	}
}

template <typename ElemType>
void Grid<ElemType>::mapAll(void (*fn)(ElemType)) {
	long t0 = timestamp;
	for (int i = 0; i < nRows * nCols; i++) {
		if (timestamp != t0) {
			Error("Grid structure has been modified");
		}
		fn(elements[i]);
	}
}

template <typename ElemType>
template <typename ClientDataType>
void Grid<ElemType>::mapAll(void (*fn)(ElemType, ClientDataType&),
                            ClientDataType & data) {
	long t0 = timestamp;
	for (int i = 0; i < nRows * nCols; i++) {
		if (timestamp != t0) {
			Error("Grid structure has been modified");
		}
		fn(elements[i], data);
	}
}

/*
 * Grid::Iterator class implementation
 * ----------------------------------
 * The Iterator for Grid maintains a pointer to the original Grid and
 * an index into that vector that identifies the next element to return.
 */

template <typename ElemType>
Grid<ElemType>::Iterator::Iterator() {
	gp = NULL;
}

template <typename ElemType>
typename Grid<ElemType>::Iterator Grid<ElemType>::iterator() {
	return Iterator(this);
}

template <typename ElemType>
Grid<ElemType>::Iterator::Iterator(Grid *gridRef) {
	gp = gridRef;
	curRow = 0;
	curCol = 0;
	timestamp = gp->timestamp;
}

template <typename ElemType>
bool Grid<ElemType>::Iterator::hasNext() {
	if (gp == NULL) Error("hasNext called on uninitialized iterator");
	if (timestamp != gp->timestamp) {
		Error("Grid structure has been modified");
	}
	return curRow < gp->numRows() && curCol < gp->numCols();
}

template <typename ElemType>
ElemType Grid<ElemType>::Iterator::next() {
	if (gp == NULL) Error("next called on uninitialized iterator");
	if (!hasNext()) {
		Error("Attempt to get next from iterator"
		      " where hasNext() is false");
	}
	int row = curRow;
	int col = curCol++;
	if (curCol == gp->numCols()) {
		curCol = 0;
		curRow++;
	}
	return (*gp)(row, col);
}

template <typename ElemType>
ElemType Grid<ElemType>::foreachHook(FE_State & fe) {
	if (fe.state == 0) fe.iter = new Iterator(this);
	if (((Iterator *) fe.iter)->hasNext()) {
		fe.state = 1;
		return ((Iterator *) fe.iter)->next();
	} else {
		fe.state = 2;
		return ElemType();
	}
}

/* GridRow implementation */

template <typename ElemType>
Grid<ElemType>::GridRow::GridRow() {
	/* Empty */
}

template <typename ElemType>
Grid<ElemType>::GridRow::GridRow(Grid *gridRef, int index) {
	gp = gridRef;
	row = index;
}

template <typename ElemType>
ElemType & Grid<ElemType>::GridRow::operator[](int col) {
	return (*gp)(row,col);
}

#endif
