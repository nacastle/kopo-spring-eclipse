package di.anno.n02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class DriverMain {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("di-anno02.xml");
		
		Car car = context.getBean("car",Car.class);
		car.prnTireBrand();
		
	}

}

