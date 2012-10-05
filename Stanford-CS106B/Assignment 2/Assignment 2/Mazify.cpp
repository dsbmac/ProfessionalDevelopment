#include "Mazify.h"
#include "random.h"
#include <iostream>
#include "stack.h"
#include "queue.h"

Mazify::Mazify(void)
{
	Randomize();
	maxRow = 10;
	maxCol = 20;
	Maze maze(maxRow, maxCol, true);
	setup(maze);
	createMaze(maze);
	Stack<pointT> solution = SolveMaze(maze);
	displaySolution(solution, maze );
}
void Mazify::createMaze(Maze & maze) {
/* 1. Randomly choose one of the neighbors of the current point
2. If  neighbor is  "excludedCnt", remove wall between current point and neighbor and mark
neighbor as "included"
3. Neighbor becomes current point (whether or not wall was removed)
4. Repeat steps 1-3 until all cells in the maze have been included
*/
	pointT randomPt = {RandomInteger(0,maxRow-1), RandomInteger(0,maxCol-1)};//initial point
	currentPt = randomPt;
	Include(currentPt);
	int i = 0;
	//step 4 loop
	while (excludedCnt>0) {
		//step 1
		pointT neighbour;
		while (true) {
		//pointT neighbour = RandomPt(maze);
			neighbour = newPt(dirT(RandomInteger(0,3)));
			if (maze.pointInBounds(neighbour)) break;
		}
		//step 2: break wall down
		if ( !included.getAt(neighbour.row, neighbour.col) ) {
			maze.setWall(currentPt, neighbour, false);
			Include(neighbour);
		}
		//step 3
		currentPt = neighbour;
	}	
	maze.draw();	
}
void Mazify::Include(pointT &pt) {
	included.setAt(pt.row, pt.col, true);
	excludedCnt--;
}
void Mazify::setup(Maze & maze) {
	maze.draw();
	included.resize(maxRow, maxCol);
	excludedCnt = 0;

	//populate included and excludedCnt collectors
	for (int i = 0; i < included.numRows(); i++) {
	  for (int j = 0; j < included.numCols(); j++) {
		  included.setAt(i,j,false);
		  excludedCnt++;
	  }
	}
}
Stack<pointT> Mazify::SolveMaze(Maze & maze) {
	/*1. Create path with just start location and enqueue it
2. Dequeue shortest path
3. If path ends at goal you're done, otherwise
a .  For each neighbor accessible from path end, make copy of  path, extend by  adding
neighbor and enqueue it
4. Repeat steps 2-3 until at goal (also stop if queue is empty, won't happen for perfect maze) */
	cout << "solving maze..." << endl;
	//step 1
	pointT start = {0,0};
	pointT end = {maxRow-1, maxCol-1};
	Stack<pointT> path, solution;
	Queue<Stack<pointT> > paths;//collects all path variations
	path.push(start);
	paths.enqueue(path); 
	//step 2
	while (true) {
		path = paths.dequeue(); //get smallest path
		currentPt = path.peek();
		//step 3
		if ( samePt(currentPt, end)) {
			solution = path;
			break;
		} else {
			int index = 0;
			while (index < 4) {				
				pointT neighbour = newPt(dirT(index));
				//if inbounds and not a through a wall create new path and add into paths
				if (maze.pointInBounds(neighbour) && !maze.isWall(path.peek(), neighbour) && !isBacktrack(neighbour, path)) {
					Stack<pointT> newPath = path;
					newPath.push(neighbour);
					paths.enqueue(newPath);
				}
				index++;
			}		
		}	
	}
	return solution;
}
bool Mazify::isBacktrack(pointT & neighbour, Stack<pointT> & path) {
	if (path.size() <= 1) return false;
	path.pop();
	pointT backtrackPt = path.peek();
	path.push(currentPt);
	return samePt(backtrackPt, neighbour);
}
bool Mazify::samePt(pointT a, pointT b) {
	return a.row == b.row && a.col == b.col;
}
void Mazify::displaySolution(Stack<pointT> solution, Maze & maze ) {
	cout << "Maze solved in " << solution.size() << " steps." << endl;	
	maze.drawMark(solution.pop(),"Green");
	while (solution.size() > 1 ) {
		maze.drawMark(solution.pop(),"Blue");
	}
	maze.drawMark(solution.pop(),"Red");
}
pointT Mazify::newPt(dirT direction) {
	pointT newPt = currentPt;
	switch (direction) {
		case North: newPt.row++; break;
		case East: newPt.col++; break;
		case South: newPt.row--; break;
		case West: newPt.col--; break;;
	}
	return newPt;
}