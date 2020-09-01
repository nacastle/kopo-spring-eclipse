package hafy.bid.controller;

public class test {
	
	public static void main(String[] args) {
		
		String a = "하나은행 | 123-123-123";
		String[] al = a.split(" | ");
//		System.out.println(al);
		
		System.out.println(al[0]);
		System.out.println(al[2]);
		
//		for(String q : al) {
//			System.out.print(q);
//		}
	}

}
