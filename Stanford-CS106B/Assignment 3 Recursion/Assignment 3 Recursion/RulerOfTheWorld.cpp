#include "RulerOfTheWorld.h"

RulerOfTheWorld::RulerOfTheWorld(void)
{
	InitGraphics();
}
void RulerOfTheWorld::DrawRuler(double x, double y, double w, double h) {
	MovePen(x, y);
	DrawLine(w, 0);
	RecDrawRuler(x, y, w, h) ;
}
void RulerOfTheWorld::RecDrawRuler(double x, double y, double w, double h) {
	if ( h <= 0.2 ) return;	
	else {
		double center = x + w / 2;
		MovePen(center, y);
		DrawLine(0, h);
		double space = w / 2;
		for (int i = 0; i < 2; i ++ ) {
			double newX = x + (space * i);
			RecDrawRuler(newX, y, w/2, h/2);			
		}

	}
}
RulerOfTheWorld::~RulerOfTheWorld(void)
{
}
