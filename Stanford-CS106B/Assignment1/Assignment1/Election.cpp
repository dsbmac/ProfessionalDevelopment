#include "Election.h"
#include "genlib.h"
#include <simpio.h>
#include <random.h>
#include <vector.h>
#include <iostream>
#include <random.h>

Election::Election() {
	voters = 10000;
	spread = 0.005;
	errorRate = 0.15;
	Randomize();
 	//you can uncomment this to get the user input functionality
	//getData();
	double chance = simulateElection();	
	cout << "Chance of an invalid election result (500 trials) = " << chance << endl;
}
Vector<int> Election::processVotes() {
	//cout << "processVotes..." << endl;
	Vector<int> voteCount;
	voteCount.add(0);
	voteCount.add(0);
	int total = 0;
	while (total < voters) {
		int i = total > (voters * (spread/2+0.5));
		if( RandomChance(errorRate) ) voteCount[(i+1) % 2]++;
		else voteCount[i]++;
		total++;
	}
	return voteCount;
}
double Election::simulateElection() {
	int invalid = 0;
	//run n trials pf processVotes and count invalid results
	for ( int i = 0; i < NUM_TRIALS; i++) {
		Vector<int> voteCount = processVotes();
		cout << voteCount[0] << ":" << voteCount[1] << " total: " << voteCount[0] + voteCount[1] << endl;
		if(voteCount[1] > voteCount[0] ) {
			invalid++;
			cout << "Invalid result! " << invalid << endl;
		}
	}
	cout << endl << "Total invalid results: " << invalid << " " << NUM_TRIALS << endl;
	return double(invalid)/NUM_TRIALS;
}
void Election::getData() {
	while (true) {
		cout << "Enter number of voters: ";	
		cin >> voters;
		if (voters >= 0) break;
	}
	while (true) {
		cout << "Enter percentage spread between candidates: ";
		cin >> spread;
		if (0 <= spread && spread <= 1.0) break;
	}
	while (true) {
		cout << "Enter voting error percentage: ";
		cin >> errorRate;
		if (0 <= errorRate && errorRate <= 1.0) break;
	}
}