/*
 * File: Yahtzee.java
 * ------------------
 * This program will eventually play the Yahtzee game.
 
pseudocode

create categories
setup game
	enter num players
		check num is less than max
			enter names
play game loop until all categories are filled:
	roll dice (loop 3 times or until category selection):
		hold selected dice
			add selected dice to diceArray
	after dice roll loop
	update score table { {player1 {scorecard[17]} }, {player2} }		
		calculate score
			score array:
				upperscore array
				special scores
				bonuses
			check upper score bonus
			update the total 
		put score into corresponding position of player score array
*/
import java.util.*;
import acm.io.*;
import acm.program.*;
import acm.util.*;

public class Yahtzee extends GraphicsProgram implements YahtzeeConstants {
	
	public static void main(String[] args) {
		new Yahtzee().start(args);
	}
	
	public void run() {		
		setupGame();
		playGame();		
		declareWinner();
	}
	
	private void setupGame() {	
		IODialog dialog = getDialog();
		while (numPlayerCheck(nPlayers) == false) {//input is checked for proper type by the YahtzeeDisplay class
			nPlayers = dialog.readInt("Enter number of players");	
		}		
		playerNames = new String[nPlayers];
		for (int i = 1; i <= nPlayers; i++) {
			playerNames[i - 1] = dialog.readLine("Enter name for player " + i);
		}
		display = new YahtzeeDisplay(getGCanvas(), playerNames);
		
		//IMPORTANT TO NOTE THAT BOTH THESE arrays have an empty element at [0].
		//this is to be able to use the constants to directly access index the array
		MasterScore = new int[nPlayers][N_CATEGORIES+1];
		UsedCategories = new boolean[nPlayers][N_CATEGORIES+1];
	}

	private void playGame() {
		boolean[] selectedDice = new boolean[N_DICE];
		
		while (scoreCardIsComplete() == false) {
			for (int player = 1; player <= nPlayers; player++) {			
				display.printMessage("Roll dice to begin your turn.");
				display.waitForPlayerToClickRoll(player);	
				Arrays.fill(selectedDice, true);
				rollDice(selectedDice);
				
				int j = 1;
				while (j < 3) {		
					display.printMessage("Select which dice to re-roll.");
					display.waitForPlayerToSelectDice();				
					rollDice(selectDice());
					j++;
				}				
				playerScoreEntry(player);
			}
		}
	}

	private boolean scoreCardIsComplete() {		
		return checkIfCategoryUsed(nPlayers-1, UPPER_SCORE) && checkIfCategoryUsed(nPlayers-1, LOWER_SCORE);
	}

	private void declareWinner() {
		int max = 0;
		ArrayList<String> winnersList = new ArrayList<String>();
		
		for (int i = 0; i < nPlayers; i++) {
			if (getScore(i, TOTAL) > max) max = getScore(i,TOTAL);
		}
		for (int i = 0; i < playerNames.length;  i++) {
			if (getScore(i,TOTAL) == max) winnersList.add(playerNames[i]);
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
			if ((0 == i && winnersList.size() > 1) && i < winnersList.size()-1 ) names += " and ";
		}
		String message = names + isAre + " the winner" + sGrammar + "."; 
		display.printMessage(message);
	}
	
	private void playerScoreEntry(int player) {
		int category;		 
		display.printMessage("Select a category to score.");
		while(true) {
			category = display.waitForPlayerToSelectCategory();
			if (!checkIfCategoryUsed(player, category)) {
				updateScore(player, category);
				break;
			}
		}	
	}

	private void updateScore(int player, int category) {
		//expects a valid category to fill
		int score = calculateScore(category);
		setMasterScore(player, category, score);
		checkUpperScoreAndBonus(player);
		checkLowerScore(player);
		updateTotal(player);
	}
	
	private void updateTotal(int player) {
		int sum = 0;
		for (int i =0; i< scoringCategories.length; i++) {
			sum += MasterScore[player-1][scoringCategories[i]];
		}
		setMasterScore(player, TOTAL, sum);
	}

	private void setMasterScore(int player, int category, int score) {
		MasterScore[player-1][category] = score;
		UsedCategories[player-1][category] = true;
		display.updateScorecard(category, player, score);
	}

	private void checkUpperScoreAndBonus(int player) {
		
		if (UsedCategories[player-1][UPPER_SCORE]) {
			return;
		} else {
			int sum = 0; 
			boolean allFilled = true;
			for (int i = ONES; i <= SIXES; i++) { //iterate and sum. if the sum is >= 63 then give the bonus and mark it in UsedCategories
				if (UsedCategories[player-1][i] == false) allFilled = false;
				sum += MasterScore[player-1][i];							
			}			
			if (allFilled) {
				setMasterScore(player, UPPER_SCORE, sum);
				if( sum < 62) setMasterScore(player, UPPER_BONUS, 0);
			} else if (sum >= 63) setMasterScore(player, UPPER_BONUS, 35); 
		}
	}
	
	private void checkLowerScore(int player) {		
		if (UsedCategories[player-1][LOWER_SCORE]) {
			return;
		} else {
			int sum = 0;
			boolean test = true;
			for (int i = THREE_OF_A_KIND; i < LOWER_SCORE; i++) { //iterate and sum and count. 
				if(UsedCategories[player-1][i] == true) sum += MasterScore[player-1][i];
				else {
					test = false;
					break;				
				}
			}
			if (test) setMasterScore(player, LOWER_SCORE, sum);			
		}
	}
	
	private int calculateScore(int category) {
		int[] diceValueCounts = countDiceValues(diceArray);		
		//calculate simple and chance categories
		if ((ONES <= category && category <= FULL_HOUSE) || category == YAHTZEE) {
			if (ONES <= category && category <= SIXES) return category * diceValueCounts[category-1];
		} else if (category == CHANCE) return sumArray(diceArray);
		int[] sortedDiceArray = (int[])diceArray.clone();
		Arrays.sort(sortedDiceArray);			
		int[] sortedCounts = (int[])diceValueCounts.clone();
		Arrays.sort(sortedCounts);			
		
		//straight conditionals
		if (category == SMALL_STRAIGHT || category == LARGE_STRAIGHT) { //categories 10-11
			return calculateStraightScore(sortedDiceArray, category);
		}
		
		return calculateMultiplesScore(sortedCounts, category); 
	}

	private int calculateMultiplesScore(int[] sortedCounts, int category) {
		//score for multiples. maxCount is an array with the highest multiple in 0 pos
		//and the second height in 1 position
		int[] maxCount = {sortedCounts[sortedCounts.length-1], sortedCounts[sortedCounts.length-2]};
		
		switch (category) {
		case THREE_OF_A_KIND: //trips
			if (maxCount[0] >= 3) return sumArray(diceArray);
			else return 0;
		case FOUR_OF_A_KIND: //four of a kind
			if (maxCount[0] >= 4) return sumArray(diceArray);
			else return 0;
		case YAHTZEE: //yahtzee!!
			if (maxCount[0] == 5) return 50;
			else return 0;
		case FULL_HOUSE: //full house
			if (maxCount[0] == 3 && maxCount[1] == 2) return 25;
			else return 0;
		default:
			return 0;
		}
	}

	private int calculateStraightScore(int[] sortedDiceArray, int category) {
		// check and calculate straight score
		int cnt = 0;
		
		if(sortedDiceArray[4]- sortedDiceArray[0] == 4) {
			if (category == SMALL_STRAIGHT) return 30;
			else return 40;
		} else if (category == SMALL_STRAIGHT) {
			for (int i = 1; i < sortedDiceArray.length; i++) {
				if(cnt > 1) return 0;
				else if (sortedDiceArray[i]-sortedDiceArray[i-1] != 1) cnt++;
			}
			return 30; //if the for loop passed without return 0 it will return 30
		} else return 0;
	}
	
	private boolean checkIfCategoryUsed(int player, int category) {
		return UsedCategories[player-1][category];
	}

	private boolean numPlayerCheck(int nPlayers) {
		return 0 < nPlayers && nPlayers <= MAX_PLAYERS;
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

	private void rollDice(boolean[] selectedDice) {
		//iterate and enter dice values for private diceArray
		for (int i = 0; i < diceArray.length; i++) {
			if (selectedDice[i]) diceArray[i] = rgen.nextInt(5) + 1;			
		}
		//update the display
		display.displayDice(diceArray);
	}
	
	private boolean[] selectDice() {
		boolean[] selectedDice = new boolean[N_DICE];
		for (int i = 0; i < N_DICE; i++) {
			selectedDice[i] = display.isDieSelected(i);
		}
		return selectedDice;
	}

	private int getScore(int playerIndex, int category) {
		return MasterScore[playerIndex][category];
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