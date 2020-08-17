package di.test3;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CalcMain {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("ditest03/calcXML.xml");
		
//		Calculator c = new Calculator();
//		MyCalculator my = new MyCalculator(c);
		
		MyCalculator my = (MyCalculator)context.getBean("myCal");
		
//		my.setFirstNum(15);
//		my.setSecondNum(4);
		
		my.add();
		my.sub();
		my.mul();
		my.div();

		
	}

}
