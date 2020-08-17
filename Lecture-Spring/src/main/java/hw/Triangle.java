package hw;

public class Triangle extends Figure {
	
	private int width; 
	private int height;

	public Triangle() {
		super();
		// TODO Auto-generated constructor stub
		
		System.out.println("삼각형 읽기");
		
	}

	public Triangle(int width, int height) {
		super();
		System.out.println("삼각형 읽기");
		this.width = width;
		this.height = height;
	}

	@Override
	public float getArea() {
		// TODO Auto-generated method stub
		return (float)this.getWidth() * this.getHeight() / 2;
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
