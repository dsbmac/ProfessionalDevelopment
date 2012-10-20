import java.util.*;

import acm.program.*;

public class test {
	public static void main(String[] args) {
		String name = "Johnny";
		FacePamphletProfile p = new FacePamphletProfile (name); 
		db.addProfile(p);
		System.out.println("p.getName(): " + p.getName());
		String name2 = "Jill";
		FacePamphletProfile p2 = new FacePamphletProfile (name2);
		String name3 = "Kimmy";
		FacePamphletProfile p3 = new FacePamphletProfile (name3);
		db.addProfile(p2);
		db.addProfile(p3);
		db.addFriend(name, name2);
		db.addFriend(name, name3);
		printFriends(name);		
		printFriends(name2);
		
		db.deleteProfile(name2);
		System.out.println(db.containsProfile(name2));
		printFriends(name);
	}
	private static void printFriends(String name) {
		System.out.println(name + " friends:");
		FacePamphletProfile p = db.getProfile(name);
		Iterator<String> iter = p.getFriends();
		while (iter.hasNext()) {
			System.out.println(iter.next());
		}
	}
	private static FacePamphletDatabase db = new FacePamphletDatabase(); 

}
