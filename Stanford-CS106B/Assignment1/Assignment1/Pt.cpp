#include "Pt.h"

Pt::Pt(double xx, double yy)
: x(), y()
{
	x = xx;
	y = yy;
}

double Pt::getX() {
		return x;
	}
double Pt::getY() {
		return y;	
	}	
double Pt::setX(double xx) {
		x = xx;
		return x;
	}
double Pt::setY(double yy) {
		y = yy;
		return y;	
	}	