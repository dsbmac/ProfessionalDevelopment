#pragma once

class ChaosGame
{
public:
	ChaosGame();
private:
	struct pointT {
	double x;
	double y;
	};
	Vector<pointT> vertices;
	pointT last;
	pointT relativePt;
	pointT target;

	void calcDiff(pointT & b, double factor = 1.0);
	void DrawLineToPt (pointT & b);
	void mark();
	void moveHalfway() ;
	void randomVertex() ;
	void drawChaos() ;
	void getVertices();
	void setup();
	void drawTriangle() ;
	void drawFirstMark() ;
};
