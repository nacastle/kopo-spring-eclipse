package basic;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class HelloMain {
	
	public static void main(String[] args) {
		
//		ApplicationContext context = new ClassPathXmlApplicationContext("beanContainer.xml"); // context가 앞으로 컨테이너 역할을 함
//		ApplicationContext context = new FileSystemXmlApplicationContext("src/main/resources/beanContainer.xml"); 
		ApplicationContext context = new GenericXmlApplicationContext("classpath:beanContainer.xml"); // classPAth와 filesystem을 동시에 사용가능하게 해주는
		
//		HelloSingle obj3 = (HelloSingle)context.getBean("hs"); // hs2와 같은 주소값을 찍음 (한번 만든 객체를 계속 활용한다는 말)
		HelloSingle obj3 = context.getBean("hs", HelloSingle.class); // hs2와 같은 주소값을 찍음 (한번 만든 객체를 계속 활용한다는 말)
		HelloSingle obj4 = (HelloSingle)context.getBean("hs2");
		obj3.prnMasg();
		
		System.out.println(obj3);
		System.out.println(obj4);
		
		Hello obj = (Hello)context.getBean("hello");
		obj.prnMasg();
		
		Hello obj2 = (Hello)context.getBean("hello2");
		obj2.prnMasg();
	}

}
