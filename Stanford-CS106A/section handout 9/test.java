import acm.program.*;

public class test extends ConsoleProgram {
	public void run() {
		ExpandableArray a = new ExpandableArray();
		a.set(4, 5);
		println(a.get(4));
		a.set(5, 6);
		println(a.get(5));
		println(a.get(100));
	}
	
}
