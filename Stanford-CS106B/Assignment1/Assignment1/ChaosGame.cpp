#include <iostream>
#include "genlib.h"
#include <vector.h>
#include <math.h>
#include <random.h>
#include "ChaosGame.h"
#include "graphics.h"
#include "extgraph.h"

ChaosGame::ChaosGame()
{
/*1. Randomly choose one vertex (A, B, or C) as the current point
2. Draw a small filled circle around the current point
3. Randomly choose one vertex (A, B, or C) and move the current point half of the distance
toward that target
4. Repeat steps 2 & 3 (stop when the user clicks the mouse)*/	
	setup();
	drawTriangle();
	drawFirstMark();
	while (true) {
		drawChaos();
		UpdateDisplay();
		if(MouseButtonIsDown())	break;
	}
}
//calculates the relative coordinates for line drawing
void ChaosGame::calcDiff(pointT & b, double factor) {
	pointT a = {GetCurrentX(), GetCurrentY()};
	relativePt.x = (b.x-a.x) * factor;
	relativePt.y = (b.y-a.y) * factor;
}
//draws a line from current location to specified point
void ChaosGame::DrawLineToPt (pointT & b) {
	calcDiff(b);
	DrawLine(relativePt.x, relativePt.y);
}
//draws filled circle
void ChaosGame::mark(){
	double size = 0.05;
	pointT bookmark = {GetCurrentX(), GetCurrentY()};
	MovePen(GetCurrentX()+ size, GetCurrentY());
	StartFilledRegion(1);
	DrawArc(size, 0, 360);
	EndFilledRegion();
	MovePen(bookmark.x, bookmark.y);
}
//reuses the calcdiff to determine where to move
void ChaosGame::moveHalfway() {
	calcDiff(target, 0.5);
	MovePen(GetCurrentX() + relativePt.x, GetCurrentY() + relativePt.y);
}
void ChaosGame::randomVertex() {
	int index = RandomInteger(0, 2);
	target = vertices[index];
}
//draws the fractal process
void ChaosGame::drawChaos() {
	randomVertex();
	moveHalfway();
	mark();
	Pause(0.005);
}
//struct pointT is used to track coordinates
void ChaosGame::getVertices(){
	while(vertices.size() < 3) {
		WaitForMouseDown();
			last.x = GetMouseX();
			last.y = GetMouseY();
		WaitForMouseUp();
			vertices.add(last);
			cout << "Vertex at: " << last.x << ", " << last.y << " confirmed." << endl;
	}
}
void ChaosGame::setup(){
	InitGraphics();
	Randomize();
	//fill vertices container with ABC
	cout << "Please click 3 spots to make a triangle." << endl;
	getVertices();
}
void ChaosGame::drawTriangle() {
	pointT A = vertices[0];
	pointT B = vertices[1];
	pointT C = vertices[2];
	MovePen(A.x, A.y);
	DrawLineToPt(B);
	DrawLineToPt(C);
	DrawLineToPt(A);
}
void ChaosGame::drawFirstMark() {
	randomVertex();
	MovePen(target.x, target.y);
	mark();
}