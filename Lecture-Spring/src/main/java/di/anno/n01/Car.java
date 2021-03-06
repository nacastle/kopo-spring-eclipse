package di.anno.n01;

import javax.annotation.Resource;

public class Car {
	
//	@Autowired
	@Resource
	private Tire tire; // = new HankookTire()와 같은 효과 발생
	
	
	public Car() {
		System.out.println("Car() 생성자 호출...");
	}
	
	// 생성자 주입 (Constructor injection)
//	@Autowired
	public Car(Tire tire) {
		this.tire = tire;
		System.out.println("Car(Tire) 생성자 호출...");
	}
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어: " + tire.getBrand());
	}
	
	// 속성 주입 (Setter 주입)
//	@Autowired
//	@Resource
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire(Tire) 호출...");
		
	}

}
