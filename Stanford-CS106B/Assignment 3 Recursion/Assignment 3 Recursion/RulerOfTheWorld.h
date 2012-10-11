#pragma once
#include "graphics.h"
#include "set.h"
#include "genlib.h"
#include "strutils.h"
#include "map.h"
#include "vector.h"
#include "strutils.h"
#include "queue.h"
#include "stack.h"
#include <iostream>
#include <string>

class RulerOfTheWorld
{
public:
	RulerOfTheWorld(void);
	void DrawRuler(double x, double y, double w, double h);
public:
	~RulerOfTheWorld(void);
private:
	void RecDrawRuler(double x, double y, double w, double h);
};
