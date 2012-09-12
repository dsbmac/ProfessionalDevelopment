import java.io.*;
import acm.program.*;

public class WordCount extends ConsoleProgram {
    
	private int lineCount = 0;
	private int wordCount = 0;
	private int charCount = 0;
	private String fileName = "";
	
    public void run() {     
    	String s = "From seasons such as these?  O, I have ta'en ";
    	println(countWords(s));
    }
    
    private BufferedReader openFileReader(String prompt) {
    	BufferedReader rd = null;
    	while (rd == null) {
    		try {
    			String name = readLine(prompt);
    			name = "lear.txt";
    			fileName = name;
    			rd = new BufferedReader(new FileReader(name));
    		} catch (IOException ex) {
    			println("Bad file");
    		}
    	}
    	return rd;
    }
    
    private int countWords(String line) {
    	int cnt = 0;
    	boolean wordStart = false;
    	int i = 0;
    	while (i < line.length()){
    		if(i - 1 < 0){
    			if(Character.isLetterOrDigit(line.charAt(i))) {
    				wordStart = true;
    			}	 
    		} else if (Character.isLetterOrDigit(line.charAt(i)) && line.charAt(i-1) == ' ') {
    			wordStart = true;    			
    		}
    		
    		if (wordStart == true) {
    			for (int j = i; j < line.length(); j++) {
    				i = j;
    				if(Character.isLetterOrDigit(line.charAt(j)) == false || j+1 == line.length()) {
    					cnt++;    			    					
    					wordStart = false;
    					break;
    				}    				
    			}
    		}
    		i++;
    	}    	
    	return cnt;
    }
    
    private int countChars(String line) {
    	//String s = line.replaceAll("\\s","");
    	return line.length();
    }
    
   /* private BufferedReader openFileReaderUsingChooser() {
    	BufferedReader rd = null;
    	JFileChooser chooser = new JFileChooser();
    	int result = chooser.showOpenDialog(this);
    	if(result == JFileChooser.APPROVE_OPTION) {
    		try {
    			File file = chooser.getSelectedFile();
    			rd = new BufferedReader(new FileReader(file));
    		}	catch(IOException ex) {
    				println("Can't open that file.");
    		}
    	}
    	return rd;
    }*/
    
    
}
