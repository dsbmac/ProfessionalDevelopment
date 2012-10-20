import java.util.*;
import acm.program.*;

public class UniqueNames extends ConsoleProgram {
	public void run() {
		namesArray = createNamesArray();
		displayUniqueNames();		
		
	}
	
	private void displayUniqueNames() {
		// TODO Auto-generated method stub
		ArrayList<String> arr = new ArrayList<String>();
		for (int i = 0; i < namesArray.size(); i++) {
			if( !arr.contains(namesArray.get(i))) {
				arr.add(namesArray.get(i));
			} 
		}
		println("Unique name list contains: ");
		for (int i = 0 ; i < arr.size(); i++) {
			println(arr.get(i));
		}		
	}

	private ArrayList<String> createNamesArray() {
		String name;
		ArrayList<String> arr = new ArrayList<String>();
		while(true) {
			name = readLine("Enter name: ");
			if (name.equals("")) {
				break;
			} else {
				arr.add(name);	
			}			
		}
		return arr;
	}
private ArrayList<String> namesArray;
}
