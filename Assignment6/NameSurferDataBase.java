import java.io.*;
import java.util.HashMap;
import acm.util.*;


/*
 * File: NameSurferDataBase.java
 * -----------------------------
 * This class keeps track of the complete database of names.
 * The constructor reads in the database from a file, and
 * the only public method makes it possible to look up a
 * name and get back the corresponding NameSurferEntry.
 * Names are matched independent of case, so that "Eric"
 * and "ERIC" are the same names.
 */

public class NameSurferDataBase implements NameSurferConstants {
	
/* Constructor: NameSurferDataBase(filename) */
/**
 * Creates a new NameSurferDataBase and initializes it using the
 * data in the specified file.  The constructor throws an error
 * exception if the requested file does not exist or if an error
 * occurs as the file is being read.
 */
	public NameSurferDataBase(String filename) {
		createMapEntries(filename);
	}
	
	private void createMapEntries(String filename) {
		BufferedReader rd = openFileReader(filename);
		NameSurferMap = new HashMap<String, String>() ;
		try {
			while ( true ) {
				String line = rd.readLine();
				if (line == null) break;
				NameSurferEntry entry = new NameSurferEntry(line);
				NameSurferMap.put(entry.getName(), line);
			}		
			rd.close();
		} catch (IOException ex) {
			throw new ErrorException (ex);
		}
	}
	
//	private HashMap<String, String> readLineMap(BufferedReader rd) {
//		HashMap<String, String> result = new HashMap<String, String>();
//		try {
//			while ( true ) {
//				String line = rd.readLine();
//				if (line == null) break;
//				NameSurferEntry entry = new NameSurferEntry(line);
//				result.put(entry.getName(), line);
//			}		
//			rd.close();
//		} catch (IOException ex) {
//			throw new ErrorException (ex);
//		}					
//	return result;
//	}
	
	private BufferedReader openFileReader(String filename) {
		BufferedReader rd = null;
		while (rd == null) {
			try {				
				rd = new BufferedReader(new FileReader(filename));				
			} catch (IOException ex) {
				throw new ErrorException(ex);
			}				
		}
	return rd;		
	}
	
/* Method: findEntry(name) */
/**
 * Returns the NameSurferEntry associated with this name, if one
 * exists.  If the name does not appear in the database, this
 * method returns null.
 */
	public NameSurferEntry findEntry(String name) {
		System.out.println("findEntry()...");
		String nameFormatted = capitalizeFirstLetter(name);
		String entryLine;
		System.out.println(" NameSurferMap.get(nameFormatted): " +  NameSurferMap.get(nameFormatted));
		if ( NameSurferMap.get(nameFormatted) == null ) {
			entryLine = createNotInDBEntry(capitalizeFirstLetter(name));
		} else entryLine = NameSurferMap.get(nameFormatted) ;
		NameSurferEntry result = new NameSurferEntry( entryLine );
		return result;
	}
	
	private String createNotInDBEntry(String name) {
		String result = name + " ";
		for (int i = 0; i < NDECADES; i++) {			
			result += " 0"; 
		}
		return result;
	}
	
	public String capitalizeFirstLetter(String name) {
		String result = "";
		if (name.length() >= 1) {
			for (int i = 0; i < name.length(); i++) {
				if ( i == 0 ) {
					result += Character.toString(name.charAt(i) ).toUpperCase();
				} else result += Character.toString(name.charAt(i)).toLowerCase();
			}
		}
		return result;
	}
	
	private HashMap <String, String> NameSurferMap;
}

