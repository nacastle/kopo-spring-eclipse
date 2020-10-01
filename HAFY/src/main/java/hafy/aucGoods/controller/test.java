package hafy.aucGoods.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

public class test {

	public static void main(String[] args) throws ParseException {
		
		//데이트포맷
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
        //한국기준 날짜
        Calendar calendar = Calendar.getInstance();
        Date date = new Date(calendar.getTimeInMillis());
        sdf.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
        String nowTime = sdf.format(date);
        //오늘 타임스탬프(데이트포맷으로 저장했다고 치고 그걸 타임스탬프로 바꿔보는 작업)
        long nowTimestamp = sdf.parse(nowTime).getTime();

        //2019년 9월 6일의 타임스탬프
        String endTime = "2020-10-01 04:47:00";
        long endTimestamp = sdf.parse(endTime).getTime();

        long difference = (endTimestamp - nowTimestamp );
        System.out.println("오늘날짜 => "+nowTime);
        System.out.println("다른날짜 => "+endTime);
//        System.out.println("differentTimestamp 타임스탬프=> "+todayTimestamp);
//        System.out.println("todayTimestamp 타임스탬프=> "+difference);
        System.out.println("일수차=> "  +  difference/ (24*60*60*1000));
        System.out.println("시간차=> "  +  difference/ (60*60*1000));
        System.out.println("분차=> "  +  difference/ (60*1000));
        
	}
		

}
