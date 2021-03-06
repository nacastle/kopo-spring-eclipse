package di.collection;

import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class ListMain {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("di-collection01.xml");
		
//		ListAddress list =  context.getBean("list", ListAddress.class);
		ListAddress list =  context.getBean("list02", ListAddress.class);
		
		for(String addr : list.getAddress()) {
			System.out.println(addr);
		}
		for(Integer num : list.getNumbers()) {
			System.out.println(num);
		}
		
	}

}
