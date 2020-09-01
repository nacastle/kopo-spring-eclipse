package hafy.aucGoods.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class test {

	public static void main(String[] args) {

		LocalDateTime now = LocalDateTime.now();
		System.out.println("Before : " + now);
		DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String formatDateTime = now.format(formatter2);
		System.out.println("After : " + formatDateTime);

//		String startDate = "2020-08-31T11:50";
//		String fStartDate = startDate.substring(0, "2020-08-31".length());
//		System.out.println("2020-08-31".length());
//		
//		String bStartDate = startDate.substring("2020-08-31".length()+1);
//		String rStartDate = fStartDate + " "+ bStartDate;
//		
//		System.out.println(fStartDate);
//		System.out.println(bStartDate);
//		System.out.println(rStartDate);

	}

}
