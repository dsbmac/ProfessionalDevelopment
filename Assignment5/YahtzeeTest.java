/*
 * File: Yahtzee.java
 * ------------------
 * This program will eventually play the Yahtzee game.
 
pseudocode
enter names
enter num players
	check num is less than max
create categories
setup game
start game
	create dice
play game loop until all categories are filled:
	roll dice (loop 3 times or until category selection):
		hold selected dice
			add selected dice to diceArray
	after dice roll loop
	update score table { {player1 {scorecard[17]} }, {player2} }		
		calculate score
			score array:
				upperscore array
				yahtzee score array
				bonuses
			check upper score bonus 
		put score into corresponding position of player score array
*/
import java.util.*;
import acm.io.*;
import acm.program.*;
import acm.util.*;


public class YahtzeeTest extends GraphicsProgram implements YahtzeeConstants {
	
	public static void main(String[] args) {
		new YahtzeeTest().start(args);
	}
	
	public void run() {
		IODialog dialog = getDialog();
		while (numPlayerCheck(nPlayers) == false) {//input is checked for proper type by the YahtzeeDisplay class
			nPlayers = dialog.readInt("Enter number of players");	
		}		
		//nPlayers = 1;		
		playerNames = new String[nPlayers];
		for (int i = 1; i <= nPlayers; i++) {
			playerNames[i - 1] = dialog.readLine("Enter name for player " + i);
		}
//		playerNames = new String[1];
//		playerNames[0] = "Denis";
		display = new YahtzeeDisplay(getGCanvas(), playerNames);
		setupGame();
		playGame();

//		test();
		
	}
	
//	private void test() {
//		boolean[] selectedDice = new boolean[N_DICE];		
//		int category;		
//		
//		int round = 0;
//		
//		while (round < N_SCORING_CATEGORIES) {
//			for (int player = 1; player <= nPlayers; player++) {			
//				display.printMessage("Roll dice to begin your turn.");
//				display.waitForPlayerToClickRoll(player);			
//				rollDice();
//				int j = 1;
//				
//				while(j < 3) {
//					category = display.waitForPlayerToSelectCategory();
//					if (!checkIfCategoryUsed(player, category)) {
//						updateScore(player, category);
//						break;
//					}						
//					display.printMessage("Select which dice to hold.");
//					display.waitForPlayerToSelectDice();
//					rollDice();
//					println(Arrays.toString(diceArray));
//					j++;					
//				}
//			display.printMessage("Select a category to score.");		
//			}
//		
//		}
//			round++;
//	}		
//	
	
	private void playGame() {
		int category;
		boolean[] selectedDice = new boolean[N_DICE]; 
		
		while (checkIfCategoryUsed(nPlayers-1, TOTAL) == false) {
			for (int player = 1; player <= nPlayers; player++) {			
				display.printMessage("Roll dice to begin your turn.");
				display.waitForPlayerToClickRoll(player);	
				Arrays.fill(selectedDice, true);
				rollDice(selectedDice);
				
				int j = 1;
				while (j < 3) {		
					display.printMessage("Select which dice to re-roll.");
					display.waitForPlayerToSelectDice();				
					//display.waitForPlayerToClickRoll(player);
					selectedDice = checkDiceSelection();
					rollDice(selectedDice);
					println(Arrays.toString(diceArray));
					j++;
				}
				fillScoreCard(player);
				display.printMessage("Select a category to score.");
				while(true) {
					category = display.waitForPlayerToSelectCategory();
					if (!checkIfCategoryUsed(player, category)) {
						updateScore(player, category);
						break;
					}
				}
			}
		}
		declareWinner();
	}
	
	private void testUpper(int player) {
		int category;
		for (int i = 1; i < UPPER_SCORE; i++ ) {
			category = i;
			if (UsedCategories[player-1][i] == false) {
				setMasterScore(player, category, 100);				
				break;
			}
		}
	}

	private void updateScore(int player, int category) {
		println();
		println("updateScore...");
		//expects a valid category to fill
		int score = calculateScore(category);
		println("calculateScore finished");
		setMasterScore(player, category, score);
		println("setMasterScore finished");
		checkUpperScoreAndBonus(player);
		println("checkUpperBonus done");
		checkLowerScore(player);
		checkFinalScore(player);
	}
	
	private void declareWinner() {
		int max = 0;
		ArrayList<String> winnersList = new ArrayList<String>();
		
		for (int i = 0; i < nPlayers; i++) {
			if (getTotal(i) > max) {
				max = getTotal(i);
			}
		}
		for (int i = 0; i < playerNames.length;  i++) {
			if (getTotal(i) == max) {
				winnersList.add(playerNames[i]);
			}
		}
		String isAre = " is";
		String sGrammar = "";
		if (winnersList.size() > 1) {
			isAre = " are";
			sGrammar = "s";
		}
		
		String names = "";
		for (int i = 0; i < winnersList.size(); i++) {
			String name = (String) winnersList.get(i);
			names += name;
			if ((0 == i && winnersList.size() > 1) && i < winnersList.size()-1 ) {
				names += " and ";
			}
		}
		String message = names + isAre + " the winner" + sGrammar + "."; 
		display.printMessage(message);
		println(message);		
	}
	
	private int getTotal(int playerIndex) {
		return MasterScore[playerIndex][TOTAL];
	}
		
	private void setMasterScore(int player, int category, int score) {
		//int category = display.waitForPlayerToSelectCategory();
		println("setMasterScore...");
		MasterScore[player-1][category] = score;
		println("MasterScore update");
		UsedCategories[player-1][category] = true;
		display.updateScorecard(category, player, score);
	}
	
	private boolean numPlayerCheck(int nPlayers) {
		return 0 < nPlayers && nPlayers <= MAX_PLAYERS;
	}
	
	private boolean[] checkDiceSelection() {
		boolean[] result = new boolean[N_DICE];
		Arrays.fill(result, true);
		for (int i = 0; i < N_DICE; i++) {
			result[i] = display.isDieSelected(i);
		}
		//println(Arrays.toString(result));
		return result;
	}
		
	private void rollDice(boolean[] selectedDice) {
		println("rollDice started...");
		//iterate and enter dice values for private diceArray
		for (int i = 0; i < diceArray.length; i++) {
			if (selectedDice[i]) {
				diceArray[i] = rgen.nextInt(5) + 1;
			}			
		}
		println("diceArray: " + Arrays.toString(diceArray));
		//update the display
		display.displayDice(diceArray);
		println("rollDice finished");
	}
	
	private void checkUpperScoreAndBonus(int player) {
		println("checkUpperBonus...");
		int cnt = 0;
		
		if (UsedCategories[player-1][UPPER_SCORE]) {
			return;
		} else {
			boolean allFilled = true;
			int sum = 0; 
			for (int i = ONES; i < UPPER_SCORE; i++) { //iterate and sum. if the sum is >= 63 then give the bonus and mark it in UsedCategories
				sum += MasterScore[player-1][i];
				cnt++;
				if (UsedCategories[player-1][i] == false) {
					allFilled = false;
				println(sum);
				}			
			}
			
			if (cnt == 6 && allFilled) {
				setMasterScore(player, UPPER_SCORE, sum);
				if( sum < 62) {
					setMasterScore(player, UPPER_BONUS, 0);
				}
			} else if (sum >= 63) {//min for the bonus to qualify
				setMasterScore(player, UPPER_BONUS, 35);							
			} 
		}
	}
	
	private void checkLowerScore(int player) {
		println("checkLowerScore...");		
		if (UsedCategories[player-1][LOWER_SCORE]) {
			return;
		} else {
			int sum = 0;
			boolean test = true;
			for (int i = THREE_OF_A_KIND; i < LOWER_SCORE; i++) { //iterate and sum and count. 
				if(UsedCategories[player-1][i] == true) {
					sum += MasterScore[player-1][i];	
				} else {
					test = false;
					break;				
				}
			}
			if (test) {
				setMasterScore(player, LOWER_SCORE, sum);	
			}			
		}
	}
	
	private void checkFinalScore(int player) {		
		if (UsedCategories[player-1][LOWER_SCORE] && UsedCategories[player-1][UPPER_SCORE] && UsedCategories[player-1][UPPER_BONUS]) {
			int sum = MasterScore[player-1][UPPER_SCORE] + MasterScore[player-1][UPPER_BONUS] + MasterScore[player-1][LOWER_SCORE]; 
			setMasterScore(player, TOTAL, sum);
		} else return;
	}
	
	private void setupGame() {
		//IMPORTANT TO NOTE THAT BOTH THESE arrays have an empty element at [0]. this is to be able to use the constants to directly access index the array
		MasterScore = new int[nPlayers][N_CATEGORIES+1];
		UsedCategories = new boolean[nPlayers][N_CATEGORIES+1];
	}

	private boolean checkIfCategoryUsed(int player, int category) {
		return UsedCategories[player-1][category];
	}
	

	private int calculateScore(int category) {
		println("calculateScore...");
		println(Arrays.toString(diceArray));
		int[] dArr = {};
		int[] diceValueCounts = countDiceValues(diceArray);
		int[] sortedCounts = (int[])diceValueCounts.clone();
		
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
		
		//straight conditionals
		println("reached straight conditionals...");
		if (category == SMALL_STRAIGHT || category == LARGE_STRAIGHT) { //categories 10-11
			return calculateStraightScore(dArr, category);
		}
		
		return calculateMultiplesScore(sortedCounts, category); 
	}

	private int calculateMultiplesScore(int[] sortedCounts, int category) {
		//score for multiples
		int[] maxCount = {sortedCounts[sortedCounts.length-1], sortedCounts[sortedCounts.length-2]};
		
		switch (category) {
		case THREE_OF_A_KIND: //trips
			if (maxCount[0] >= 3) {
				return sumArray(diceArray); 
			} else return 0;
		case FOUR_OF_A_KIND: //four of a kind
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

	private int calculateStraightScore(int[] dArr, int category) {
		// check and calculate straight score
		int[] uniqueArr = createUniqueArr(dArr);	
		Arrays.sort(uniqueArr);
		
		if (uniqueArr[4]- uniqueArr[0] == 4 || uniqueArr[4] - uniqueArr[1] == 3) {
			if (category == SMALL_STRAIGHT) {
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
		boolean unique;
		for (int i = 0; i < dArr.length;i++) {
			unique = true;
			for (int j = 0 ; j < i; j++) {
				if (uniqueArr[j] == dArr[i]) {
					unique = false;
					break;
				}				
			}
			if(unique) {
				uniqueArr[i] = dArr[i];
			}					
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
		for (int i = 0; i < diceArray.length; i++) {
			value = diceArray[i] - 1;
			countArray[(value)]++;
		}
		return countArray;
	}

	private void fillScoreCard(int player) {
		for (int i = 0; i < scoringCategories.length-1; i++) {
			setMasterScore(player, scoringCategories[i], 1);	
		}
	}
// Private instance variables 
	private int nPlayers;
	private String[] playerNames;
	private YahtzeeDisplay display;
	private RandomGenerator rgen = new RandomGenerator();
	private int[][] MasterScore;
	private boolean[][] UsedCategories;
	private int[] diceArray = new int[N_DICE];
	int[] allCategories = {ONES, TWOS, THREES, FOURS, FIVES , SIXES, UPPER_SCORE,UPPER_BONUS, THREE_OF_A_KIND, FOUR_OF_A_KIND, FULL_HOUSE, YAHTZEE, SMALL_STRAIGHT, LARGE_STRAIGHT, CHANCE, LOWER_SCORE, TOTAL};
	int[] scoringCategories = {ONES, TWOS, THREES, FOURS, FIVES , SIXES, THREE_OF_A_KIND, FOUR_OF_A_KIND, FULL_HOUSE, YAHTZEE, SMALL_STRAIGHT, LARGE_STRAIGHT, CHANCE};
}

/*
private void testCalculateScore() {
// test harness for calculateScore
int[] categories = {ONES, TWOS, THREES, FOURS, FIVES , SIXES, THREE_OF_A_KIND, FOUR_OF_A_KIND, FULL_HOUSE, YAHTZEE, SMALL_STRAIGHT, LARGE_STRAIGHT, CHANCE};


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
*/