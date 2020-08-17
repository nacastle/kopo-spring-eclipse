package di.anno.n03;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class DriverMain {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("di-anno03.xml");
		
		Car car = context.getBean("car",Car.class);
		car.prnTireBrand();
		
	}

}

