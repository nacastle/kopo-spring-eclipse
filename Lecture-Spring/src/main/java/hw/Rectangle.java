package hw;

public class Rectangle extends Figure {
	
	private int width; 
	private int height;

	public Rectangle() {
		super();
		// TODO Auto-generated constructor stub
		
		System.out.println("직사각형 읽기");
		
//		System.out.println("부모높이: "+super.getHeight());
//		System.out.println("부모가로: "+super.getWidth());
	}

	public Rectangle(int width, int height) {
		super();
		System.out.println("직사각형 읽기");
		this.width = width;
		this.height = height;
	}

	@Override
	public float getArea() {
		// TODO Auto-generated method stub
		return this.getWidth() * this.getHeight();
	}

	@Override
	public void setArea(float area) {
		// TODO Auto-generated method stub
		super.setArea(area);
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}
	
	
	
	
	
	
	
	
	

}
