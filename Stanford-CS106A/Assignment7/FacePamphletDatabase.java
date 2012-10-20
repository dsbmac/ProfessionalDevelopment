/*
 * File: FacePamphletDatabase.java
 * -------------------------------
 * This class keeps track of the profiles of all users in the
 * FacePamphlet application.  Note that profile names are case
 * sensitive, so that "ALICE" and "alice" are NOT the same name.
 */

import java.util.*;

public class FacePamphletDatabase implements FacePamphletConstants{

	/** 
	 * Constructor
	 * This method takes care of any initialization needed for 
	 * the database.
	 */
	public FacePamphletDatabase() {
	}
	
	/** 
	 * This method adds the given profile to the database.  If the 
	 * name associated with the profile is the same as an existing 
	 * name in the database, the existing profile is replaced by 
	 * the new profile passed in.
	 */
	public void addProfile(FacePamphletProfile profile) {
		profileDB.put(profile.getName(), profile);		
	}
	
	/** 
	 * This method returns the profile associated with the given name 
	 * in the database.  If there is no profile in the database with 
	 * the given name, the method returns null.
	 */
	public FacePamphletProfile getProfile(String name) {
		if (profileDB.containsKey(name)) {
			return profileDB.get(name);
		} else return null;
	}
	
	/** 
	 * This method removes the profile associated with the given name
	 * from the database.  It also updates the list of friends of all
	 * other profiles in the database to make sure that this name is
	 * removed from the list of friends of any other profile.
	 * 
	 * If there is no profile in the database with the given name, then
	 * the database is unchanged after calling this method.
	 */
	public void deleteProfile(String name) {
		System.out.println("deleteProfile..." + name);
		if (profileDB.containsKey(name)) {
			FacePamphletProfile profile = profileDB.get(name);
			Iterator<String> iter = profile.getFriends();
			System.out.println("iter.hasNext(): " + iter.hasNext());
			while (iter.hasNext()) {
				System.out.println("while...");
				String friendName = iter.next();
				System.out.println("friendName: " + friendName);
				FacePamphletProfile friendProfile = profileDB.get(friendName);
				friendProfile.removeFriend(name);		
			}
			System.out.println("past while...");
			profileDB.remove(name);			
		}
	}
	
	/** 
	 * This method returns true if there is a profile in the database 
	 * that has the given name.  It returns false otherwise.
	 */
	public boolean containsProfile(String name) {
		return profileDB.containsKey(name);
	}
	
	public void removeFriend(String name, String removeName) {
		FacePamphletProfile p1 = profileDB.get(name);
		FacePamphletProfile p2 = profileDB.get(removeName);
		p1.removeFriend(removeName);
		p2.removeFriend(name);				
	}
	
	public void addFriend(String name, String friend) {
		FacePamphletProfile p1 = profileDB.get(name);
		FacePamphletProfile p2 = profileDB.get(friend);
		p1.addFriend(friend);
		p2.addFriend(name);				
	}
	
private HashMap <String, FacePamphletProfile> profileDB = new HashMap <String, FacePamphletProfile>();
}