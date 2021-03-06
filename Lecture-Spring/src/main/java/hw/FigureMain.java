package hw;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class FigureMain {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("hw/hw01.xml");
		
		FigureInfo info = context.getBean("info", FigureInfo.class);
		info.printArea();
	}

}
