package hw;

public class FigureInfo {
	
	private Figure figure;
	
	public FigureInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FigureInfo(Figure figure) {
		super();
		this.figure = figure;
	}

	public void printArea() {
		System.out.println("넓이: " + figure.getArea());
	}

	public Figure getFigure() {
		return figure;
	}

	public void setFigure(Figure figure) {
		this.figure = figure;
	}


}
