import acm.program.*;
import acm.util.*;
import java.io.*;
import java.util.*;

public class flights extends ConsoleProgram{
	public void run() {
		setupProgram();
		planFlight();		
	}
	
	private void planFlight() {
		ArrayList<String> flightPath = new ArrayList<String>();
		String prompt = "Please enter your starting city: ";
		String lastCity = getEntry(prompt);
		String start = lastCity;
		flightPath.add(lastCity);
		do {
			println();
			println("From " + lastCity + " you can fly directly to:");
			printMap(lastCity);
			prompt = "Where do you want to go from " + lastCity +"? ";
			lastCity = getEntry(prompt);
			flightPath.add(lastCity);
		} while (start.equals(lastCity) == false);
		println("\nHere's your final itinerary:");
		printFlightPath(flightPath);
		println("\nBon Voyage!");
	}
	
	private String getEntry(String prompt) {
		String entry;
		do  {
			entry = readLine(prompt);	
		} while (validEntry(entry) == false);
		return entry;
	}
	
	private void printFlightPath(ArrayList<String> flightPath) {
		for (int i = 0; i < flightPath.size(); i++) {
			print(flightPath.get(i));
			if (i != flightPath.size()-1) {
				print(" -> ");
			}
		}
	}
	
	private boolean validEntry(String city) {
		return flightMap.containsKey(city);
	}
		
	private void setupProgram() {
		BufferedReader rd = openFileReader(FILE_NAME);
		initFlightMap(rd);
		String greeting = "Welcome to Flight Planner.";
		println(greeting);
		println("Here's a list of cities in our database:");
		printMap("keys");
		println("\nLet's plan your route.");
	}
	
	private void printMap(String param) {
		if (param.equals("keys")) {
			Iterator iter = flightMap.keySet().iterator();
			while (iter.hasNext()) {
				String departure = iter.next().toString();
				println(departure);
			}	
		} else {
			List<String> destinations = flightMap.get(param);
			for (int i = 0; i < destinations.size(); i++) {
				println(destinations.get(i));
			}
		}
	}
	
	private BufferedReader openFileReader(String filename) {
		BufferedReader rd = null;
		while ( rd == null) {
			try {
				rd = new BufferedReader( new FileReader( filename ));
			} catch ( IOException ex) {
				println("Bad file.");
			}
		}
		return rd;
	}
	
	private String[][] readLineList(BufferedReader rd){
		//creates an arraylist of destinations pairs arrays
		ArrayList<String[]> flights = new ArrayList<String[]>();
		try{
			while (true) {
				String line = rd.readLine();
				if (line == null) break;
				if ( line.contains(" -> ")) {
					String[] flight = line.split(" -> ");
					flight[0] = flight[0].trim();
					flight[1] = flight[1].trim();
					flights.add(flight);
				}				
			}
			rd.close();
		} catch (IOException ex) {
			throw new ErrorException(ex);
		}
		String[][] result = new String[flights.size()][];
		for (int i =0; i < flights.size(); i++) {
			result[i] = flights.get(i);
		}
		return result;
	}
	
	private void initFlightMap(BufferedReader rd) {
		String[][] flightList = readLineList(rd);
		flightMap = new HashMap <String, ArrayList<String>>();
		for (int i = 0; i < flightList.length; i++) {
			String[] flight = flightList[i];
			if (flight.length > 1) {
				if (flightMap.containsKey(flight[0])) {
					if (!flightMap.get(flight[0]).contains(flight[1])) {
						flightMap.get(flight[0]).add(flight[1]);
					}
				} else {
					flightMap.put(flight[0], new ArrayList<String>());
					flightMap.get(flight[0]).add(flight[1]);
					}
				}	
			}		
	}	
	
private static HashMap <String, ArrayList<String>> flightMap;
private final String FILE_NAME = "flights.txt"; 
}