package hw;

public class Figure {
	
//	private int width;
//	private int height;
//	private float radius;
	private float area;
	
	public Figure() {
		super();
		// TODO Auto-generated constructor stub
		System.out.println("도형 읽기");
	}
	
//	public Figure(int width, int height, float radius) {
//		super();
//		this.width = width;
//		this.height = height;
//		this.radius = radius;
//		
////		System.out.println("생성자 찍히나");
////		
//		System.out.println(this.width);
//		System.out.println(this.height);
//		System.out.println(this.radius);
//	}
	
	public float getArea() {
		return area;
	}
	public void setArea(float area) {
		this.area = area;
	}
//	public int getWidth() {
//		return width;
//	}
//	public void setWidth(int width) {
//		this.width = width;
//	}
//	public int getHeight() {
//		return height;
//	}
//	public void setHeight(int height) {
//		this.height = height;
//	}
//	public float getRadius() {
//		return radius;
//	}
//	public void setRadius(float radius) {
//		this.radius = radius;
//	}
	
	

}
