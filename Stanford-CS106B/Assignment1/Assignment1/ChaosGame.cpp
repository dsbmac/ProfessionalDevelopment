#include "ChaosGame.h"
#include <iostream>
#include "genlib.h"
#include <simpio.h>
#include <vector.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <random.h>
#include <graphics.h>
#include <extgraph.h>

using namespace std;


const double PI = 3.1415926535;



ChaosGame::ChaosGame(void)

{	
	InitGraphics();

class Pt {

private:
	double x;
	double y;
	
public:
	Pt(double xx, double yy) {
		x = xx;
		y = xx;
	} 

	double getX() {
		return x;
	}

	double getY() {
		return y;	
	}	
	double setX(double xx) {
		x = xx;
		return x;
	}

	double setY(double yy) {
		y = yy;
		return y;	
	}	

};

	double xCtr = GetWindowWidth()/2;
	double yCtr = GetWindowHeight()/2;

	Pt A(0.3, 0.2);
	Pt B(1.0, 1.0);
	Pt C(-0.5, 0.5);
	aX = 0.3;
	aY = 0.2;
	bX = 1.0;
	bY = 1.0;

	cX = 0.3;
	cY = 0.2;


	
	double size = 1.0;
	MovePen(1.0, 1.0);
	DrawPolarLine(size, 0);
	DrawPolarLine(size, 120);
	DrawPolarLine(size, 240);   
	DrawCircle();
}


void ChaosGame::DrawPolarLine(double r, double theta) {
	double radians = theta / 180 * PI;
	DrawLine(r * cos(radians), r * sin(radians));
}

void ChaosGame::DrawCircle() {
	double r = -0.1;
	DrawArc(r, 0 , 360);
}