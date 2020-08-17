package hw;

public class Circle extends Figure {
	
	private int radius; 

	public Circle() {
		super();
		// TODO Auto-generated constructor stub
		
		System.out.println("원 읽기");
		
	}
	
	

	public Circle(int radius) {
		super();
		this.radius = radius;
	}


	@Override
	public float getArea() {
		// TODO Auto-generated method stub
		return getRadius()*getRadius()*(float)Math.PI;
	}

	@Override
	public void setArea(float area) {
		// TODO Auto-generated method stub
		super.setArea(area);
	}
	
	

	public int getRadius() {
		return radius;
	}



	public void setRadius(int radius) {
		this.radius = radius;
	}



	
	
	
	
	
	
	
	
	

}
