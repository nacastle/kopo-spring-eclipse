package di.basic;

public class DriverMain {
	
	public static void main(String[] args) {
		
//		Tire tire = new HankookTire();
		Tire tire = new KumhoTire();
		
		
		// 생성자 주입
//		Car car = new Car(tire);
		
		// 속성 주입 (Setter 주입)
		Car car = new Car();
		car.setTire(tire);
		car.prnTireBrand();
		
		
	}

}
