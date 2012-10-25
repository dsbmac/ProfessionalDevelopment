import java.awt.Color;

public class NameSurferSeries {
	
	public NameSurferSeries(NameSurferEntry entry, Color color, int markIndex) {
		this.entry = entry;
		this.color = color;
		this.markIndex = markIndex;
	}

	private NameSurferEntry entry;
	private Color color;
	private int markIndex;
	
	
	public int getMarkIndex() {
		return this.markIndex;
	}
	
	public NameSurferEntry getEntry() {
		return this.entry;
	}
	
	public Color getColor() {
		return this.color;
	}
}
