/*
 * File: private/grid.h
 * Last modified on Fri Jun  5 15:40:23 2009 by eroberts
 * -----------------------------------------------------
 * This file contains the private section of the grid.h interface.
 * This portion of the class definition is taken out of the grid.h
 * header so that the client need not have to see all of these
 * details.
 */

public:

/*
 * Legacy method: operator()
 * Usage: grid(0, 0) = grid(1, 1);
 * -------------------------------
 * This method overloads () to access elements from this grid.
 * It has been superseded by the [] operator and is not used in
 * new code.
 */
	ElemType & operator()(int row, int col);

/*
 * Class: Grid<ValType>::GridRow
 * -----------------------------
 * This section of the code defines a nested class within the Grid template
 * that makes it possible to use traditional subscripting on Grid values.
 */
	class GridRow {
	public:
		GridRow();
		ElemType & operator[](int col);

	private:
		GridRow(Grid *gridRef, int index);
		Grid *gp;
		int row;
		friend class Grid;
	};
	friend class GridRow;

/*
 * Class: Grid<ElemType>::Iterator
 * -------------------------------
 * This interface defines a nested class within the Grid template that
 * provides iterator access to the Grid contents.
 */
	class Iterator : public FE_Iterator {
	public:
		Iterator();
		bool hasNext();
		ElemType next();

	private:
		Iterator(Grid *gridRef);
		Grid *gp;
		int curRow;
		int curCol;
		long timestamp;
		friend class Grid;
	};
	friend class Iterator;
	ElemType foreachHook(FE_State & _fe);

/*
 * Deep copying support
 * --------------------
 * This copy constructor and operator= are defined to make a
 * deep copy, making it possible to pass/return grids by value
 * and assign from one grid to another. The entire contents of
 * the grid, including all elements, are copied. Each grid
 * element is copied from the original grid to the copy using
 * assignment (operator=). Making copies is generally avoided
 * because of the expense and thus, grids are typically passed by
 * reference, however, when a copy is needed, these operations
 * are supported.
 */
	const Grid & operator=(const Grid & rhs);
	Grid(const Grid & rhs);

private:

	ElemType *elements;
	int nRows, nCols;
	long timestamp;

	void checkRange(int row, int col);
	void copyContentsFrom(const Grid & other);
