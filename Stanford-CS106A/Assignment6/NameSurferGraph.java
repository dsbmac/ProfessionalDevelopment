/*
 * File: NameSurferGraph.java
 * ---------------------------
 * This class represents the canvas on which the graph of
 * names is drawn. This class is responsible for updating
 * (redrawing) the graphs whenever the list of entries changes or the window is resized.
 */

import acm.graphics.*;
import java.awt.Color;
import java.awt.event.*;
import java.util.*;

public class NameSurferGraph extends GCanvas
	implements NameSurferConstants, ComponentListener {

	/**
	* Creates a new NameSurferGraph object that displays the data.
	*/
	public NameSurferGraph() {
		addComponentListener(this);
		seriesMap = new HashMap<String, NameSurferSeries>();
		currentMarkIndex = 0;
	}
	
	/**
	* Clears the list of name surfer entries stored inside this class.
	*/
	public void clear() {
		seriesMap.clear();
		update();
		colorIndex = 0;
	}
	
	/* Method: addEntry(entry) */
	/**
	* Adds a new NameSurferEntry to the list of entries on the display.
	* Note that this method does not actually draw the graph, but
	* simply stores the entry; the graph is drawn by calling update.
	*/
	public void addEntry(NameSurferEntry entry) {
		int[] resolution = { getWidth(), getHeight()};
		NameSurferSeries series = new NameSurferSeries(entry, COLOR_ARRAY[ colorIndex ], currentMarkIndex);
		drawGraph(series);
		String key = entry.getName();
		seriesMap.put(key, series);	
		System.out.println(seriesMap);
		setColorIndex();
		setCurrentMarkIndex();
	}
	
	public void deleteEntry(String name) {
		if (seriesMap.containsKey(name)) {
			seriesMap.remove(name);
		}
		update();
	}
	

	private int calibrate(int value) {
		if ( value == 0) {
			return ( getHeight() - GRAPH_MARGIN_SIZE) ;
		}
		else {			
			double ratio = value / 1000.0;
			int x =  20 + (int) Math.round(ratio * ( getHeight() - 2 * GRAPH_MARGIN_SIZE )); 
			return (int) ( x );
		}
	}	
	
	/**
	* Updates the display image by deleting all the graphical objects
	* from the canvas and then reassembling the display according to
	* the list of entries. Your application must call update after
	* calling either clear or addEntry; update is also called whenever
	* the size of the canvas changes.
	*/
	public void update() {
		drawGrid();		
		displayStoredSeries();
	}
	
	private void drawGrid() {
		removeAll();
		int bottom = getHeight();
		GLine topMargin = new GLine(0, GRAPH_MARGIN_SIZE, getWidth(),GRAPH_MARGIN_SIZE);
		add(topMargin);
		GLine bottomMargin = new GLine(0, bottom - GRAPH_MARGIN_SIZE, getWidth(), bottom - GRAPH_MARGIN_SIZE);
		add(bottomMargin);	
		
		int width =0;
		for (int i = 0 ; i < NDECADES; i++) {
			GLine line = new GLine(width, 0, width, bottom);
			GLabel label = new GLabel(Integer.toString(yearArray[i]));
			add(line);
			add(label, width + labelMargin, bottom-labelMargin);
			width += getWidth() / NDECADES;
		}		
	}
	
	private void displayStoredSeries() {
		if (seriesMap.size() > 0) {
			Iterator <Map.Entry<String, NameSurferSeries>> entries = seriesMap.entrySet().iterator();
			while (entries.hasNext()) {
				Map.Entry<String, NameSurferSeries> series = entries.next();
				drawGraph(series.getValue());
			}
		}
	}

	private void drawGraph(NameSurferSeries series) {
		GCompound graph = new GCompound();
		int[] arr = series.getEntry().getRankArray();
		Color color = series.getColor();
		int decadeWidth = 0;
		int[] pt2 = new int[2];
		
		for (int i = 0; i < arr.length; i++ ) {	
			int value = calibrate(arr[i]);						
			int[] pt1 = {decadeWidth, value};
			if (i>0) {
				GLine line = new GLine(pt1[0], pt1[1], pt2[0], pt2[1] );
				line.setColor(color);
				graph.add(line);
			}
			GLabel nameLabel = createLabel(series.getEntry().getName(), arr[i], color);
			GObject mark = makeMark(series.getMarkIndex(), color);
			graph.add(nameLabel, pt1[0] + labelMargin, pt1[1] - labelMargin );
			graph.add(mark, pt1[0]- mark.getWidth()/2, pt1[1] - mark.getHeight()/2);
			pt2 = pt1;
			decadeWidth += getWidth() / NDECADES;
		}		
		add(graph);
	}
		
	private GLabel createLabel(String name, int value, Color color) {
		String valueString;
		if(value != 0) valueString = Integer.toString(value);
		else valueString = "*";			
		GLabel nameLabel = new GLabel ( name + " " + valueString);
		nameLabel.setColor(color);
		return nameLabel;
	}
	
	private GObject makeMark(int seriesMarkIndex, Color color) {
		GObject mark;
		switch (seriesMarkIndex) {
		case 0: mark = circleMark(color);
					break;
		case 1: mark = squareMark(color);
					break;
		case 2: mark = triangleMark(color);
					break;
		case 3: mark = asteriskMark(color);
					break;					
		default: mark = circleMark(color);
					break;
		}
		
		return mark;
	}
	
	private GObject squareMark(Color color) {
		GRect mark = new GRect(markSize,markSize);
		mark.setFilled(true);
		mark.setColor(color);
		return mark;
	}

	private GObject circleMark(Color color) {
		GOval mark = new GOval(markSize,markSize);
//		mark.setFilled(true);
		mark.setColor(color);
		return mark;
	}
	
	private GObject triangleMark(Color color) {
		int length = markSize +1;
		GPolygon mark = new GPolygon();
		mark.addVertex(length/2, 0);
		mark.addVertex(length, length);
		mark.addVertex(0 , length);
		mark.setFilled(true);
		mark.setColor(color);
		return mark;
	}
	
	private GObject asteriskMark(Color color) {
		GCompound mark = new GCompound();
		add(new GLine(markSize,0, 0, markSize ));
		add(new GLine(markSize/2 ,0, markSize/2 , markSize ));
		add(new GLine( 0,markSize/2, markSize, markSize/2 ));
		add(new GLine( 0,0, markSize, markSize ));
		mark.setColor(color);
		return mark;
	}
	
	private int[] createYearArray( int startDecade) {
		int[] result = new int[ NDECADES ];
		int decade = startDecade;
		for ( int i = 0; i < NDECADES; i++ ) {
			result[i] = decade; 
			decade += 10;
		}		
		return result;
	}
	
	private void animateLine() {
		
	}
	
	private void animateLineCreation() {
		
	}
	
	private int[][] createGraphPoints(int[] rankArr) {
		int decadeSpace = getWidth() / NDECADES;
		int x, y;
		
		int[][] result = new int[rankArr.length][];
		for (int i = 0; i < rankArr.length; i++) {			
			x = calibrate(rankArr[i]);
			y = i*decadeSpace;
			int[] point = {x,y};
			result[i] = point;  
		}
		
		return result;
	}
	
//	private int[] createAnimationPoints(int[] graphPoints) {
//		int[] result = new int[graphPoints.length];
//		for (int i = 0; i < graphPoints.length-1; i++) {
//			
//		}
//		                       
//	}
	
//	public void testEntry() {
//	HashMap<String, GObject> testMap = new HashMap<String, GObject>();
//	System.out.println("testEntry...");
//	GRect box = new GRect(100,100);
//	GRect box2 = new GRect(100,100);
//	add(box);
//	add(box2, getWidth()/2, getHeight()/2);
//	testMap.put("A", box);
//	System.out.println("testMap.put complete");
//	System.out.println(testMap);
//	testMap.put("B", box2);
//	GObject obj = testMap.get("A"); 	
//	remove(obj);
//}
//
	
	public boolean checkSeriesMap(String capitalizedName) {
		return seriesMap.containsKey(capitalizedName);
	}
	
	private void setColorIndex() {
		
//		Iterator <Map.Entry<String, NameSurferSeries>> entries = seriesMap.entrySet().iterator();
//		while (entries.hasNext()) {
//			Map.Entry<String, NameSurferSeries> series = entries.next();
//			Color color = series.getValue().getColor();			
//		}
//		int cnt1, cnt1, cnt1, cnt1 = 0;
		
		colorIndex = ( colorIndex + 1 ) % COLOR_ARRAY.length;
	}
	
	private void setCurrentMarkIndex() {
		currentMarkIndex = ( currentMarkIndex + 1 ) % numberOfMarkers;
	}
	
	private int numberOfMarkers = 3;
	private int markSize = 7;
	private int currentMarkIndex;
	private int labelMargin = 3;
	private int[] yearArray = createYearArray(1900);
	private int colorIndex;
	private HashMap<String, NameSurferSeries> seriesMap;
	/* Implementation of the ComponentListener interface */
	@Override
	public void componentHidden(ComponentEvent e) { }
	@Override
	public void componentMoved(ComponentEvent e) { }
	@Override
	public void componentResized(ComponentEvent e) { update(); }
	@Override
	public void componentShown(ComponentEvent e) { }
}
