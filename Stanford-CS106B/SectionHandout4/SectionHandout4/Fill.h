#pragma once
#include "grid.h"

struct pointT {
     int row, col;
	};
enum pixelStateT { White, Black };
class Fill
{
public:
	Fill(void);	
	void FillRegion(pointT pt, Grid<pixelStateT> &screen);
public:
	~Fill(void);
private:
	
	
};
