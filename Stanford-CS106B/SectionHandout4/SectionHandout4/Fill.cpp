#include "Fill.h"

Fill::Fill(void)
{
}
void Fill::FillRegion(pointT pt, Grid<pixelStateT> &screen) {
	if (pt.row >= screen.numRows() || pt.col >= screen.numCols() ) return;
	if (screen.getAt(pt.row, pt.col) == Black ) return;
	else {
		screen.setAt(pt.row, pt.col, Black); //fill point
		for (int i = -1; i < 2; i ++) { //spread out around pt and recurse
			for (int j = -1 ; j < 2; j++) {
				pointT newPt = {pt.row + i, pt.col + j};
				FillRegion(newPt, screen);
			}
		}		
	}
}
Fill::~Fill(void)
{
}
