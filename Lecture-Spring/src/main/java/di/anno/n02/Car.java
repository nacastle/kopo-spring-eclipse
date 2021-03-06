package di.anno.n02;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class Car {
	
//	@Autowired(required = false) // 매칭해줄게 없으면 넘어가라는 뜻...이렇게하면 null포인트익셉션 뜸
//	@Autowired
//	@Resource
//	@Qualifier("kumho")
	private Tire tire; // = new HankookTire()와 같은 효과 발생
	
	
	public Car() {
		System.out.println("Car() 생성자 호출...");
	}
	
	// 생성자 주입 (Constructor injection)
	@Autowired
//	@Qualifier("hankook") // 생성자에는 다르게함
	public Car(@Qualifier("kumho") Tire tire) {  // 생성자는 매개변수에 표시... 파라미터는 여러개가 있을 수 있기에
		this.tire = tire;
		System.out.println("Car(Tire) 생성자 호출...");
	}
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어: " + tire.getBrand());
	}
	
	// 속성 주입 (Setter 주입)
//	@Autowired
//	@Qualifier("hankook")
//	@Resource
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire(Tire) 호출...");
		
	}

}
