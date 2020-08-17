package di.java;

import org.springframework.stereotype.Component;

@Component
public class HankookTire implements Tire{
	
	
	

	public HankookTire() {
		super();
		// TODO Auto-generated constructor stub
//		System.out.println("한국타이어 생성");

	}

	public String getBrand() {
		// TODO Auto-generated method stub
		return "한국타이어";
	}
	
	

}
