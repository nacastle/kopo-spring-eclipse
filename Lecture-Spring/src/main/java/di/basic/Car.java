package di.basic;

public class Car {
	
	private Tire tire; //의존관계 발생
	
	
	public Car() {
		// 의존관계 설정
//		tire = new HankookTire();
//		tire = new KumhoTire();
		
	}
	
	// 생성자 주입 (Constructor injection)
	public Car(Tire tire) {
		this.tire = tire;
	}
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어: " + tire.getBrand());
	}
	
	// 속성 주입 (Setter 주입)
	public void setTire(Tire tire) {
		this.tire = tire;
		
	}

}
