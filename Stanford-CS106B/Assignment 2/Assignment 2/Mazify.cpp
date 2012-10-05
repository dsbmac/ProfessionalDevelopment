#include "Mazify.h"
#include "random.h"
#include <iostream>
#include "stack.h"
#include "queue.h"

Mazify::Mazify(void)
{
	Randomize();
	maxRow = 20;
	maxCol = 40;
	Maze maze(maxRow, maxCol, true);
	setup(maze);
	createMaze(maze);
	Stack<pointT> solution = SolveMaze(maze);
	displaySolution(solution, maze );
}
void Mazify::createMaze(Maze & maze) {
/* 1. Randomly choose one of the neighbors of the current point
2. If  neighbor is  "excluded", remove wall between current point and neighbor and mark
neighbor as "included"
3. Neighbor becomes current point (whether or not wall was removed)
4. Repeat steps 1-3 until all cells in the maze have been included
*/
	currentPt = RandomPt(maze, false);
	Include(currentPt);
	int i = 0;
	//step 4 loop
	while (!excluded.isEmpty()) {
		//step 1
		pointT neighbour = RandomPt(maze);
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
	excluded.pop();
}
void Mazify::setup(Maze & maze) {
	maze.draw();
	included.resize(maxRow, maxCol);

	//fill dirPts with reference pts
	pointT dirN = {-1,0};
	pointT dirE = {0,1};
	pointT dirS = {1,0};
	pointT dirW = {0,-1};
	dirPts.add(dirN);
	dirPts.add(dirE);
	dirPts.add(dirS);
	dirPts.add(dirW);
	
	//populate included and excluded collectors
	for (int i = 0; i < included.numRows(); i++) {
	  for (int j = 0; j < included.numCols(); j++) {
		  included.setAt(i,j,false);
		  excluded.push(true);
	  }
	}
}
//multipurpose pt chooser. true (default) will give a random neighbour. false will give any maze pt
pointT Mazify::RandomPt(Maze & maze, bool neighbour) {	
	//cout << "RandomPt..." << endl;	
	pointT result = {maze.numRows(), maze.numCols()};
	int r, c;
	while(!maze.pointInBounds(result) ) {
		if(neighbour) {
			int index = RandomInteger(0, dirPts.size()-1);
			r = currentPt.row + dirPts[index].row;
			c = currentPt.col + dirPts[index].col;
		
		} else {
			r = RandomInteger(0, maze.numRows()-1);
			c = RandomInteger(0, maze.numCols()-1);			
		}
		result.row = r;
		result.col = c;
	}	
	return result;
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
	Stack<pointT> path;
	Queue<Stack<pointT> > paths;
	Stack<pointT> solution;
	path.push(start);
	paths.enqueue(path);
	//step 2
	while (true) {
		path = paths.dequeue();
		//step 3
		if ( samePt(path.peek(), end)) {
			solution = path;
			break;
		} else {
			int index = 0;
			while (index < dirPts.size()) {
				pointT neighbour = {path.peek().row + dirPts[index].row, path.peek().col + dirPts[index].col};
				bool backtrack = false;
				//avoid backtracking
				if (path.size() > 1 ) {
					pointT tmp = path.pop();
					pointT backtrackPt = path.peek();
					path.push(tmp);
					backtrack = samePt(backtrackPt, neighbour);
				}
				//if inbounds and not a through a wall create new path and add into paths
				if (maze.pointInBounds(neighbour) && !maze.isWall(path.peek(), neighbour) && !backtrack) {
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