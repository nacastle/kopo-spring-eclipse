package di.xml.n02;

public class Car {
	
	private Tire tire; //의존관계 발생
	
	
	
	
	public Car() {
		super();
		System.out.println("Car생성자 호출...");
	}
	
	

	public Car(Tire tire) {
		super();
		this.tire = tire;
		System.out.println("Car(Tire)생성자 호출...");
	}
	
	public Car(Tire tire01, Tire tire02) {
		super();
		System.out.println("Car(Tire01, Tire02)생성자 호출...");
		System.out.println(tire01.getBrand() + ", " + tire02.getBrand());
	}
	
	public Car(Tire tire01, String msg) {
		super();
		System.out.println("Car(Tire01, msg)생성자 호출...");
		System.out.println("msg: " + msg);
	}
		
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어: " + tire.getBrand());
	}
	

}
