package di.collection;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MapMain {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new GenericXmlApplicationContext("di-collection02.xml");
		
		MapAddress map = context.getBean("map", MapAddress.class);
		
		Map<String, String> address = map.getAddress();
		
		Set<Entry<String,String>> addrSet = address.entrySet();
		
		for(Entry<String, String> a : addrSet) {
			System.out.println(a.getKey() + " : " + a.getValue());
		}
	}

}
