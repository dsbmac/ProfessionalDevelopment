#pragma once

class Pt
{
public:	
	Pt() {
	}
	Pt(double xx, double yy) ;
	double getX();
	double getY();
	double setX(double xx) ;
	double setY(double yy) ;
	private:
		double x;
		double y;
};