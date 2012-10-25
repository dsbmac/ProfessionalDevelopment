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
		/* sets up the initial requirements for the game
		 * number of players, player names, instantiates a new YahtzeeDisplay
		 * initializes the MasterScoreCard and UsedCategories
		 */
		
		IODialog dialog = getDialog();
		while (numPlayerCheck(nPlayers) == false) {//input is checked for proper type by the YahtzeeDisplay class
			nPlayers = dialog.readInt("Enter number of players");	
		}		
		playerNames = new String[nPlayers];
		for (int i = 1; i <= nPlayers; i++) {
			playerNames[i - 1] = dialog.readLine("Enter name for player " + i);
		}
		display = new YahtzeeDisplay(getGCanvas(), playerNames);
		
		/* IMPORTANT TO NOTE THAT BOTH THESE arrays have an empty element at [0].
		 * so that the category constants can be used directly to index these array
		 */
		MasterScoreCard = new int[nPlayers][N_CATEGORIES+1];
		UsedCategories = new boolean[nPlayers][N_CATEGORIES+1];
	}

	private void playGame() {
		/* loops all players turn until the last player has all categories filled:
		 *     rolls dice and then waits for player to select re-rolls
		 * after loop calls the scoring sub
		 * selectedDice[] is to store which dice are selected
		 */
		boolean[] selectedDice = new boolean[N_DICE]; 
		
		while (scoreCardIsComplete() == false) {
			for (int player = 1; player <= nPlayers; player++) {			
				display.printMessage(playerNames[player-1] + ", please roll dice to begin your turn.");
				display.waitForPlayerToClickRoll(player);	
				Arrays.fill(selectedDice, true);
				rollDice(selectedDice);
				
				int j = 1;
				while (j < 3) {		
					display.printMessage("Select which dice to re-roll. " + Integer.toString(3-j) + " rolls remaining.");
					display.waitForPlayerToSelectDice();				
					rollDice(selectDice());
					j++;
				}				
				playerScoreEntry(player);
			}
		}
	}

	private void declareWinner() {
		/* creates an ArrayList to add names that equal
		 * the maximum score on the MasterScoreCard 
		 */
		int max = 0;
		ArrayList<String> winnersList = new ArrayList<String>();
		//get the max score on each players card
		for (int i = 0; i < nPlayers; i++) {
			if (getScore(i, TOTAL) > max) max = getScore(i,TOTAL);
		}
		//add name to the list if TOTAL equals the max
		for (int i = 0; i < playerNames.length;  i++) {
			if (getScore(i,TOTAL) == max) winnersList.add(playerNames[i]);
		}
		//bunch of string conditionals for nice gramar
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
		/* waits for player to select category and calculates the appropriate score
		 * includes a check to make sure the category isn't previously selected
		 */
		int category;		 
		display.printMessage(playerNames[player-1] + " has no rolls left. Select a category to score.");
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
			sum += MasterScoreCard[player-1][scoringCategories[i]];
		}
		setMasterScore(player, TOTAL, sum);
	}

	private void setMasterScore(int player, int category, int score) {
		MasterScoreCard[player-1][category] = score;
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
				sum += MasterScoreCard[player-1][i];							
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
				if(UsedCategories[player-1][i] == true) sum += MasterScoreCard[player-1][i];
				else {
					test = false;
					break;				
				}
			}
			if (test) setMasterScore(player, LOWER_SCORE, sum);			
		}
	}
	
	private int calculateScore(int category) {
		//this will test the category requirements and return a score as well
		int[] diceValueCounts = countDiceValues(diceArray);		
		//Handles categories ONES-SIXES
		if (ONES <= category && category <= SIXES) return category * diceValueCounts[category-1];
		int[] sortedDiceArray = (int[])diceArray.clone();
		Arrays.sort(sortedDiceArray);			
		int[] sortedCounts = (int[])diceValueCounts.clone();
		Arrays.sort(sortedCounts);			
		
		//Handles STRAIGHTS
		if (SMALL_STRAIGHT == category || category == LARGE_STRAIGHT) {
			return calculateStraightScore(sortedDiceArray, category);
		}
		//Handles MULTIPLES, CHANCE
		return calculateMultiplesScore(sortedCounts, category); 
	}

	private int calculateStraightScore(int[] sortedDiceArray, int category) {
		/*helper to calculate straights. will count the a sorted array for numbers increasing in size.
		 *  by def there has to 5 for a large straight and at most 1 that doesn't meet that requirement
		 *  for a small.
		 */
		int cnt = 0;
		
		if(sortedDiceArray[4]- sortedDiceArray[0] == 4) { //4 is an automatic pass for both categories
			if (category == SMALL_STRAIGHT) return 30;
			else return 40; //large score
		} else if (category == SMALL_STRAIGHT) {//tests the small straight
			for (int i = 1; i < sortedDiceArray.length; i++) {
				if(cnt > 1) return 0;
				else if (sortedDiceArray[i]-sortedDiceArray[i-1] != 1) cnt++;
			}
			return 30; //if the for loop passed without return 0 it will return 30
		} else return 0; //fails both tests returns 0
	}

	private int calculateMultiplesScore(int[] sortedCounts, int category) {
		//maxCount[] has the highest dice multiple at index 0 and the second highest at index 1
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
		case CHANCE:
			return sumArray(diceArray);		
		default:
			return 0;
		}
	}

	private boolean checkIfCategoryUsed(int player, int category) {
		return UsedCategories[player-1][category];
	}

	private boolean scoreCardIsComplete() {		
		return checkIfCategoryUsed(nPlayers-1, UPPER_SCORE) && checkIfCategoryUsed(nPlayers-1, LOWER_SCORE);
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
		return MasterScoreCard[playerIndex][category];
	}

	private void fillScoreCard(int player) {
		/* debugging helper to fill up the score card
		 * leaves the last category to blank to self fill
		 */
		for (int i = 0; i < scoringCategories.length-1; i++) {
			setMasterScore(player, scoringCategories[i], 1);	
		}
	}

	// Private instance variables 
	private int nPlayers;
	private String[] playerNames; //nPlayer-1 size
	private YahtzeeDisplay display;
	private RandomGenerator rgen = new RandomGenerator();
	private int[][] MasterScoreCard;
	private boolean[][] UsedCategories;
	private int[] diceArray = new int[N_DICE];
	int[] allCategories = {ONES, TWOS, THREES, FOURS, FIVES , SIXES, UPPER_SCORE,UPPER_BONUS, THREE_OF_A_KIND, FOUR_OF_A_KIND, FULL_HOUSE, YAHTZEE, SMALL_STRAIGHT, LARGE_STRAIGHT, CHANCE, LOWER_SCORE, TOTAL};
	int[] scoringCategories = {ONES, TWOS, THREES, FOURS, FIVES , SIXES, THREE_OF_A_KIND, FOUR_OF_A_KIND, FULL_HOUSE, YAHTZEE, SMALL_STRAIGHT, LARGE_STRAIGHT, CHANCE};
}