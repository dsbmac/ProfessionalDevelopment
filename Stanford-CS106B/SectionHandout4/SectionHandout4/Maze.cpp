#include "Maze.h"

Maze::Maze(void)
{
}

int Maze::RecShortestPathLength(pointT pt, int steps, int & minSteps) {
	if ( OutsideMaze(pt) ) {
		if (steps-1 < minSteps) minSteps = steps-1;
		return;
	}
	if ( IsMarked(pt) ) return;
	MarkSquare(pt);
	for (directionT dir = North; dir <= West; dir=directionT(dir + 1)) {
		if (!WallExists(pt, dir) )
			SolveMaze(AdjacentPoint(pt, dir, steps+1, minSteps)))    {	
		}
	}
  UnmarkSquare(pt);
  return minSteps;
}

bool SolveMaze(pointT pt)
{
  if (OutsideMaze(pt))
    return true;
  if (IsMarked(pt))
    return false;
  MarkSquare(pt);
  for (directionT dir = North; dir <= West; dir=directionT(dir + 1))
  {
    if (!WallExists(pt, dir) && SolveMaze(AdjacentPoint(pt, dir)))
    {
      return true;
    }
  }
  UnmarkSquare(pt);
  return false;
}
Maze::~Maze(void)
{
}
