import acm.graphics.*;
import acm.program.*;


public class sectionHandout6 extends GraphicsProgram {
	
	public void run() {
		showMona();
	}
	
	private void showMona() {
		GImage monalisa = new GImage("monalisa.jpg");
		double x = (getWidth()- monalisa.getWidth()*2)/3;
		double x2 = 2*(getWidth()- monalisa.getWidth()*2)/3 + monalisa.getWidth();
		double y = (getHeight() - monalisa.getHeight())/2;
		add((monalisa), x, y);
		add(flipHorizontal(monalisa), x2, y);
	}
	
	private GImage flipVertical(GImage image) {
		int[][] array = image.getPixelArray();
		int height = array.length;
		for (int p1 = 0; p1 < height/2; p1++ ) {
			int p2 = height - p1 -1;
			int[] temp = array[p1];
			array[p1] = array[p2];
			array[p2] = temp;
		}
		return new GImage(array);
	}
	
	private GImage flipHorizontal(GImage image) {
		int[][] array = image.getPixelArray();
		int width = array[1].length;
		for(int i = 0; i<array.length; i++ ) {
			for (int p1 = 0; p1 < width/2; p1++) {
				int p2 = width - p1 - 1;
				int temp = array[i][p2];
				array[i][p2] = array[i][p1];
				array[i][p1] = temp;
			}
		}
		
		return new GImage(array);
	}
}
