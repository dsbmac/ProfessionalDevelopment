#pragma once

class Rectangle
{
public:
	Rectangle(int x, int y, double width, double height);
	double get_perimeter();
	double get_area();
	void scale(double factor);
	void translate(int dx, int dy);
public:
	~Rectangle(void);
private:
	double width;
	double height;
	int x;
	int y;
};
