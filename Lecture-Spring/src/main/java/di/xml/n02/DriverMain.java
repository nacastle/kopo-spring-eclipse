package di.xml.n02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;


/*
 * XML을 이용한 SPRING 생성자 주입 방식
*/

public class DriverMain {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("di-xml02.xml");
		
		Car car = (Car)context.getBean("car");
		
		Car car2 = (Car)context.getBean("car2");
		
		Car car3 = (Car)context.getBean("car3");
		
//		Tire tire = new HankookTire();
//		car.prnTireBrand();
		

	
		
	}

}
