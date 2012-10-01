//#include <iostream>
#include "genlib.h"
#include <vector.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <random.h>
#include "ChaosGame.h"
#include "graphics.h"
#include <ctime>
#include "extgraph.h"
#include "Pt.h"

ChaosGame::ChaosGame()
:relativePt(), vertices(), vertex(), lastX(), lastY()
{
/*1. Randomly choose one vertex (A, B, or C) as the current point
2. Draw a small filled circle around the current point
3. Randomly choose one vertex (A, B, or C) and move the current point half of the distance
toward that vertex
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
void ChaosGame::calcDiff(Pt & b, double factor = 1.0) {
	Pt a(GetCurrentX(), GetCurrentY());
	relativePt.setX((b.getX()-a.getX()) * factor);
	relativePt.setY((b.getY()-a.getY()) * factor);
}
void ChaosGame::DrawLineToPt (Pt & b) {
	calcDiff(b);
	DrawLine(relativePt.getX(), relativePt.getY());
}
void ChaosGame::mark(){
	double size = 0.05;
	Pt bookmark(GetCurrentX(), GetCurrentY());
	MovePen(GetCurrentX()+ size, GetCurrentY());
	StartFilledRegion(1);
	DrawArc(size, 0, 360);
	EndFilledRegion();
	MovePen(bookmark.getX(), bookmark.getY());
}
void ChaosGame::moveHalfway() {
	calcDiff(vertex, 0.5);
	MovePen(GetCurrentX() + relativePt.getX(), GetCurrentY() + relativePt.getY());
}
void ChaosGame::randomVertex() {
	int index = RandomInteger(0, 2);
	vertex = vertices[index];
}
void ChaosGame::drawChaos() {
	randomVertex();
	moveHalfway();
	mark();
	Pause(0.005);
}
void ChaosGame::getVertices(){
	while(vertices.size() < 3) {
		WaitForMouseDown();
			lastX = GetMouseX();
			lastY = GetMouseY();
		WaitForMouseUp();
			Pt entry(lastX, lastY);
			vertices.add(entry);
			cout << entry.getX() << ", " << entry.getY() << endl;
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
	Pt A = vertices[0];
	Pt B = vertices[1];
	Pt C = vertices[2];
	MovePen(A.getX(), A.getY());
	DrawLineToPt(B);
	DrawLineToPt(C);
	DrawLineToPt(A);
}
void ChaosGame::drawFirstMark() {
	randomVertex();
	MovePen(vertex.getX(), vertex.getY());
	mark();
}