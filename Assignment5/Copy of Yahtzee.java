/*
 * File: Yahtzee.java
 * ------------------
 * This program will eventually play the Yahtzee game.
 */

import java.util.Arrays;

import acm.io.*;
import acm.program.*;
import acm.util.*;

/*pseudocode
enter names
enter num players
	check num is less than max
create categories
start game
	create dice
play game loop until all categories are filled:
	roll dice (loop 3 times or until category selection):
		hold selected dice
			add selected dice to diceArray
	after dice roll loop
	update score table		
		calculate score
			score array:
				upperscore array
				yahtzee score array
				bonuses
			check upper score bonus 
		put score into corresponding position of player score array

*/


/*public class Yahtzee extends GraphicsProgram implements YahtzeeConstants {
	
	public static void main(String[] args) {
		new Yahtzee().start(args);
	}
	
	public void run() {
		IODialog dialog = getDialog();
		nPlayers = dialog.readInt("Enter number of players");
		playerNames = new String[nPlayers];
		for (int i = 1; i <= nPlayers; i++) {
			playerNames[i - 1] = dialog.readLine("Enter name for player " + i);
		}
		display = new YahtzeeDisplay(getGCanvas(), playerNames);
		playGame();
		int[] diceTest = {1,3,2,4,5};
		display.displayDice(diceTest);
		
		testCalculateScore();
		
	}*/

public class Yahtzee extends ConsoleProgram implements YahtzeeConstants {
	public void run() {
		testCalculateScore();
	}

	private void testCalculateScore() {
		// test harness for calculateScore
		int[] categories = {ONES, TWOS, THREES, FOURS, FIVES , SIXES, THREE_OF_A_KIND, FOUR_OF_A_KIND, FULL_HOUSE, YAHTZEE, SMALL_STRAIGHT, LARGE_STRAIGHT, CHANCE};
		
		/*UPPER_SCORE = 7;public static final int UPPER_BONUS = 8;
		public static final int SMALL_STRAIGHT = 12;
		public static final int LARGE_STRAIGHT = 13;
		public static final int YAHTZEE = 14;
		public static final int CHANCE = 15;
		public static final int LOWER_SCORE = 16;
		public static final int TOTAL = 17;
		*/
		
		int[][][] diceTestArray = {
				{//1
					{5,3,2,6,5}, {1,3,2,1,5}, {1,1,1,1,1} 
				},
				{//2
					{1,3,1,6,5}, {2,3,2,2,5}, {2,2,2,2,2}
				},
				{//3
					{1,4,1,6,5}, {2,5,2,2,5}, {3,3,3,3,3}
				},
				{//4
					{1,3,1,6,5}, {4,5,2,4,5}, {4,4,4,4,4}
				},
				{//5
					{1,4,1,6,6}, {2,5,2,2,3}, {5,5,5,5,5}
				},
				{//6
					{1,4,1,3,5}, {2,6,2,6,5}, {6,6,6,6,6}
				},
				{//trip
					{1,4,1,3,5}, {6,6,6,6,5}, {6,6,6,6,6}
				},
				{//quad
					{1,4,1,3,5}, {2,2,2,2,5}, {6,6,6,6,6}
				},
				{//full
					{1,4,1,3,5}, {2,6,2,6,6}, {6,6,6,6,6}
				},
				{//yahtzee
					{1,4,1,3,5}, {6,6,6,6,6}, {1,1,1,1,1}
				},
				{//sm straight
					{1,4,1,3,5}, {2,3,4,3,5}, {1,2,3,4,5}
				},
				{//lg straight
					{1,4,1,3,5}, {1,2,3,4,5}, {1,2,3,4,5}
				},
				{//chance
					{1,1,1,1,1}, {2,2,2,2,2}, {6,6,6,6,6}
				}
		};
		
		for (int i =1; i < diceTestArray.length; i++) {
			println();
			println("Test i: " + i);
			println("Category: " + categories[i]);
			for (int j=0; j < diceTestArray[i].length; j++ ) {
				println("Test j: " + j);
				println(Arrays.toString(diceTestArray[i][j]));
				println("Magic Stub: " + YahtzeeMagicStub.checkCategory(diceTestArray[i][j], categories[i]));
				println("calculate Score: " + calculateScore(diceTestArray[i][j], categories[i]));
			}
		}
	}

	private void playGame() {
		/* You fill this in */
	}
	
	private int calculateScore(int[] diceArray, int category) {
		int[] dArr = {};
		int[] diceValueCounts = countDiceValues(diceArray);
		int[] sortedCounts = (int[])diceValueCounts.clone();
		println("sortedCounts before sort: " + Arrays.toString(sortedCounts));
		
		//calculate simple and chance categories
		if ((1 <= category && category <= 11) || category == 14) {
			if (1 <= category && category <= 6) { //categories 1-6 done
				return category * diceValueCounts[category-1];
			}
		} else if (category == CHANCE) { //this will be chance(index 13)
			return sumArray(diceArray);
		}
		
		dArr = (int[])diceArray.clone();
		Arrays.sort(dArr);			
		Arrays.sort(sortedCounts);			
		
		if (category == SMALL_STRAIGHT || category == LARGE_STRAIGHT) { //categories 10-11
			return calculateStraightScore(category, dArr);
		}
		
		return calculateMultiplesScore(category, sortedCounts, diceArray); 
	}

	private int calculateMultiplesScore(int category, int[] sortedCounts, int[] diceArray) {
		//score for multiples
		int[] maxCount = {sortedCounts[sortedCounts.length-1], sortedCounts[sortedCounts.length-2]};
		
		switch (category) {
		case THREE_OF_A_KIND: //trips
			if (maxCount[0] >= 3) {
				return sumArray(diceArray); 
			} else return 0;
		case FOUR_OF_A_KIND: //four of a kind
			println(Arrays.toString(maxCount));
			if (maxCount[0] >= 4) {
				return sumArray(diceArray); 
			} else return 0;
		case YAHTZEE: //yahtzee!!
			if (maxCount[0] == 5) {
				return 50; 
			} else return 0;
		case FULL_HOUSE: //full house
			if (maxCount[0] == 3 && maxCount[1] == 2) {
				return 25; 
			} else return 0;
		default:
			return 0;
		}
	}

	private int calculateStraightScore(int category, int[] dArr) {
		// check and calculate straight score
		println("dArr: " + Arrays.toString(dArr));
		int[] uniqueArr = createUniqueArr(dArr);		
	
		Arrays.sort(uniqueArr);
		if (uniqueArr[4]- uniqueArr[0] == 4 || uniqueArr[3] - uniqueArr[0] == 3) {
			if (category == 10) {
				return 30;
			} else {
				if (uniqueArr[4]- uniqueArr[0] == 4) {
					return 40;
				} else return 0;
			}
		} else return 0;
	}

	private int[] createUniqueArr(int[] dArr) {
		int[] uniqueArr = new int[5];
		println("uniqueArr: " + Arrays.toString(uniqueArr));
		outerloop:
		for (int i = 0; i < dArr.length;i++) {
			for (int j = 0 ; j < i; j++) {
				if (uniqueArr[j] == dArr[i]) {
					break;
				}				
			}
			uniqueArr[i] = dArr[i];			
		}
		
		return uniqueArr;
	}
	
	private int sumArray(int[] arr) {
		int sum = 0;
		for (int i = 0; i < arr.length; i++)  {
			sum +=arr[i];
		}
		return sum;
	}
	
	private int[] countDiceValues(int[] diceArray) {		
		// counts the point occurrences in an array list
		int[] countArray = new int[6];
		int value = 0;
//		println(Arrays.toString(countArray));
//		println(Arrays.toString(diceArray));
		for (int i = 0; i < diceArray.length; i++) {
//			println("i: " + i);
			value = diceArray[i] - 1;
//			println("value: " + value);
//			println(countArray[value]);
			countArray[(value)]++;
//			println(Arrays.toString(countArray));
		}
		return countArray;
	}
	
	/*private int[] countDiceValues(int[] diceArray) {
			// counts the point occurrences in an array list
		int[] countArray = new int[6];
		int value;
		for (int i = 0; i <= diceArray.length; i++) {
			value = diceArray[i]-1;
			countArray[value]++;
		}
		return countArray;
		}
*/
/* Private instance variables */
	private int nPlayers;
	private String[] playerNames;
	private YahtzeeDisplay display;
	private RandomGenerator rgen = new RandomGenerator();

}
