/*
 * File: grid.h
 * Last modified on Fri Jun  5 15:37:17 2009 by eroberts
 *      modified on Tue Jan  2 13:40:51 2007 by zelenski
 * -----------------------------------------------------
 * This interface defines a class template to store a homogeneous 2-D
 * indexed collection. The basic operations are similar to those
 * on C++ built-in multi-dimensional arrays with the added features of
 * dynamic resizing, deep copying, and bounds-checking on indexes.
 *
 * Here is some sample code showing use of a Grid of strings:
 *
 *      Grid<string> g(4, 6);  <= creates 4x6 grid, each string empty
 *
 *      g[0][2] = "blue";      <= can set elemes using [] or setAt
 *      g.setAt(2, 3, "red");
 *
 *      for (int row = 0; row < g.numRows(); row++) {
 *          for (int col = 0; col < g.numCols(); col++) {
 *               cout << g[row][col] << " ";
 *          }
 *  }
 *
 * Access to individual elements in the grid is provided via the
 * setAt/getAt methods, as well as an overloaded operator[].
 * Either refers to cells by row/col location; indexes start at 0 in
 * each dimension.
 */

#ifndef _grid_h
#define _grid_h

#include "genlib.h"
#include "strutils.h"
#include "foreach.h"

/*
 * Class: Grid
 * ------------
 * The class Grid stores an indexed, two-dimensional collection.
 * It is supplied as a class template. The client specializes the grid
 * to hold values of a specific type. Because the class is defined
 * with private data members, clients have no access to the underlying
 * data members and can only manipulate a grid object through
 * its public methods.
 */

template <typename ElemType>
class Grid {

public:

/* Forward references */
	class GridRow;
	class Iterator;

/*
 * Constructor: Grid
 * Usage: Grid<bool> grid;
 *        Grid<string> *gp = new Grid<string>;
 * -------------------------------------------
 * This no-argument constructor initializes a new empty grid with
 * 0 rows and 0 cols.
 */
	Grid();

/*
 * Constructor: Grid
 * Usage: Grid<bool> grid(10, 20)
 * Grid<string> *gp = new Grid<string>(10, 20);
 * --------------------------------------------
 * This two-argument constructor initializes a new grid with the
 * specified number of rows and cols. Each element in the grid has
 * value equal to the default for that element type (e.g. for strings
 * it would be empty string, for ints, the default value is uninitialized).
 * Raises an error if numRows or numCols is negative.
 */
	Grid(int numRows, int numCols);

/*
 * Destructor: ~Grid
 * Usage: delete gp;
 * -----------------
 * The destructor deallocates storage associated with this grid.
 */
	~Grid();

/*
 * Methods: numRows, numCols
 * Usage: nRows = grid.numRows();
 * ------------------------------
 * These methods returns the number of rows or columns in
 * this grid.
 */
	int numRows();
	int numCols();

/*
 * Method: resize
 * Usage: grid.resize(5, 10);
 * --------------------------
 * This method sets the number of rows and columns in this
 * grid to the specified values. Any previous grid contents are
 * discarded.   Each element in the  resized grid has value equal
 * to the default for that element type. Raises an error if numRows
 * or numCols is negative.
 */
	void resize(int numRows, int numCols);

/*
 * Method: getAt
 * Usage: val = grid.getAt(3, 10);
 * -------------------------------
 * This method returns the element at specified row/col
 * location in this grid. Locations are indexed starting from 0.
 * Raises an error if row is outside range [0, numRows()-1] or if
 * col is outside range [0, numCols()-1].
 */
	ElemType getAt(int row, int col);

/*
 * Method: setAt
 * Usage: grid.setAt(3, 10, value);
 * --------------------------------
 * This method replaces the element at the specified
 * row/col location in this grid with a new value.  The previous
 * value at that location is overwritten with the new value.
 * Raises an error if row is outside the range [0, numRows()-1]
 * or if col is outside the range [0, numCols()-1].
 */
	void setAt(int row, int col, ElemType value);

/*
 * Method: inBounds
 * Usage: if (grid.inBounds(row, col);
 * -----------------------------------
 * This method returns true if the specified row and column position
 * are inside the bounds of the grid.
 */
	bool inBounds(int row, int col);

/*
 * Method: operator[]
 * Usage: grid[0][0] = grid[1][1];
 * -------------------------------
 * This method overloads [] to select elements from this grid.
 * This extension allows the client to use C/Java-like notation
 * to get/set individual elements. Returns a reference to the
 * element to allow in-place modification of values. Raises an
 * error if row is outside the range [0, numGridRows()-1] or if col is
 * outside the range [0, numCols()-1].
 */
	GridRow operator[](int row);

/*
 * SPECIAL NOTE: mapping/iteration support
 * ---------------------------------------
 * The Grid class supports both a mapping operation and an iterator which
 * allow the client access to all elements one by one.  In general,
 * these are intended for _viewing_ elements and can behave
 * unpredictably if you attempt to modify the grid's contents during
 * mapping/iteration.
 */

/*
 * Method: mapAll
 * Usage: grid.mapAll(Print);
 * --------------------------
 * This method iterates through this grid's contents
 * and calls the function fn once for each element.
 */
	void mapAll(void (*fn)(ElemType elem));

/*
 * Method: mapAll
 * Usage: grid.mapAll(PrintToFile, outputStream);
 * ----------------------------------------------
 * This method iterates through this grid's contents
 * and calls the function fn once for each element, passing
 * the element and the client's data. That data can be of whatever
 * type is needed for the client's callback.
 */
	template <typename ClientDataType>
	void mapAll(void (*fn)(ElemType elem, ClientDataType & data),
	            ClientDataType & data);

/*
 * Method: iterator
 * Usage: iter = grid.iterator();
 * ------------------------------
 * This method creates an iterator that allows the client to
 * iterate through the elements in this grid.  The elements are
 * returned in row-major order.
 *
 * The idiomatic code for accessing elements using an iterator is
 * to create the iterator from the collection and then enter a loop
 * that calls next() while hasNext() is true, like this:
 *
 *     Grid<int>::Iterator iter = grid.iterator();
 *     while (iter.hasNext()) {
 *         int elem = iter.next();
 *         . . .
 *     }
 *
 * This pattern can be abbreviated to the following more readable form:
 *
 *     foreach (int elem in grid) {
 *         . . .
 *     }
 *
 * To avoid exposing the details of the class, the definition of the
 * Iterator class itself appears in the private/grid.h file.
 */
	Iterator iterator();

private:

#include "private/grid.h"

};

#include "private/grid.cpp"

#endif
