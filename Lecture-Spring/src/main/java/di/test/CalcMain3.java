package di.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CalcMain3 {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("ditest01/calcXML3.xml");
		
//		Calculator c = new Calculator();
//		MyCalculator my = new MyCalculator(15, 4, c);
		
		MyCalculator my = (MyCalculator)context.getBean("myCal");
		
//		my.setFirstNum(15);
//		my.setSecondNum(4);
		
		my.add();
		my.sub();
		my.mul();
		my.div();

		
	}

}
