#pragma once

#include "Pt.h"

class ChaosGame
{
public:
	ChaosGame();
private:	
	Vector<Pt> vertices;
	double lastX;
	double lastY;
	Pt relativePt;
	Pt vertex;

	void calcDiff(Pt & b, double factor = 1.0);
	void DrawLineToPt (Pt & b);
	void mark();
	void moveHalfway() ;
	void randomVertex() ;
	void drawChaos() ;
	void getVertices();
	void setup();
	void drawTriangle() ;
	void drawFirstMark() ;
};
