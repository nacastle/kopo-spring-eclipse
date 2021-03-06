package di.java;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;


@Component
public class Car {
	
	@Autowired
	@Qualifier("kumhoTire")
	private Tire tire; // = new HankookTire()와 같은 효과 발생
	
	
	public Car() {
		System.out.println("Car() 생성자 호출...");
	}
	
	public Car(Tire tire) {  // 생성자는 매개변수에 표시... 파라미터는 여러개가 있을 수 있기에
		this.tire = tire;
		System.out.println("Car(Tire) 생성자 호출...");
	}
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어: " + tire.getBrand());
	}
	
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire(Tire) 호출...");
		
	}

}
