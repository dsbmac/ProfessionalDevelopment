#pragma once

class ChaosGame
{
public:
	ChaosGame();
private:
	void DrawPolarLine(double r, double theta);
	void DrawCircle();
	double currentX;
	double currentY;
	double aX;
	double aY;
	double bX;
	double bY;
	double cX;
	double cY;
	
};
