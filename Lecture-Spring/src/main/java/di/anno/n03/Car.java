package di.anno.n03;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class Car {
	
	
	@Resource(name = "hankook")
	private Tire tire; 
	
	
	public Car() {
		System.out.println("Car() 생성자 호출...");
	}
	
	public Car(Tire tire) {  
		this.tire = tire;
		System.out.println("Car(Tire) 생성자 호출...");
	}
	
	
	public void prnTireBrand() {
		System.out.println("장착된 타이어: " + tire.getBrand());
	}
	
	@Resource
	public void setTire(Tire tire) {
		this.tire = tire;
		System.out.println("setTire(Tire) 호출...");
		
	}

}
