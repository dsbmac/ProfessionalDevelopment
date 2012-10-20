import java.io.*;
import acm.program.*;
import java.util.*;
import acm.util.*;

public class histogram extends ConsoleProgram {
	public void run() {
		int[] scoresList;
		BufferedReader rd = openFile("Enter midterm filename: "); 
		scoresList = readLineArray(rd);
		int[] scoresCountArray = makeScoresCountArray(scoresList);
		println(Arrays.toString(scoresCountArray));
		printHistogram(scoresCountArray);
		}				 

	private void printHistogram(int[] scoresCountArray) {
		String label= "";
		for (int i = 0; i < scoresCountArray.length; i++) {
			switch (i) {
				case 0: label = "00-09: ";
						break;
				case 10: label = "  100: ";
						break;
				default: label = 10*i + "-" + (10*i + 9) + ": ";  
						break;
			}
			print(label);
			for (int j = 0; j < scoresCountArray[i]; j++) {
				print('*');				
			}
			println();		
		}
	}
	
	private BufferedReader openFile(String prompt) {
		BufferedReader rd = null;
		while (rd == null) {
			String name = readLine(prompt);
			try {				
				rd = new BufferedReader(new FileReader("MidTermScores.txt"));				
			} catch (IOException ex) {
				println("Can't open that file.");
			}				
		}
	return rd;		
	}
	
	private int[] makeScoresCountArray(int[] scores) {
		int[] scoreList = new int[11];
		for (int i = 0; i < scores.length; i++) {
			println(scores[i]);
			if (0 <= scores[i] && scores[i] <= 100) {
				int index = scores[i] / 10;
				println(index);
				scoreList[index]++;
			} else {
				println("Score is out of range!");
			}	 			
		}		
		println(Arrays.toString(scoreList));
		return scoreList;
	}
	
	private int[] readLineArray(BufferedReader rd) {
		ArrayList<Integer> lineList = new ArrayList<Integer>();
		try {			
			while (true) {
				String line = rd.readLine();
				if (line == null) break;
				lineList.add(Integer.parseInt(line.trim()));
			}
			rd.close();
		} catch (IOException ex) {
			println("No can do.");
		}
		int[] result = new int[lineList.size()];
		for (int i = 0; i < result.length; i++) {
			result[i] = lineList.get(i);
		}
		return result;
	}
}
