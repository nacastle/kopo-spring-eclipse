package hw;

public class Square extends Rectangle {
	
	private int side; 

	public Square() {
		super();
		// TODO Auto-generated constructor stub
		
		System.out.println("정사각형 읽기");
	}

	public Square(int side) {
		super();
		this.side = side;
		System.out.println("정사각형 읽기");
	}

	@Override
	public float getArea() {
		// TODO Auto-generated method stub
		return getSide() * getSide();
	}

	@Override
	public void setArea(float area) {
		// TODO Auto-generated method stub
		super.setArea(area);
	}

	public int getSide() {
		return side;
	}

	public void setSide(int side) {
		this.side = side;
	}

	
	
	
	
	
	
	
	
	

}
