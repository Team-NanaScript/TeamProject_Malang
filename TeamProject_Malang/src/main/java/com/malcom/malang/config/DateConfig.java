package com.malcom.malang.config;

import java.text.SimpleDateFormat;
import java.util.Date;


public class DateConfig {
	
	
	public static String sDate(String sd) {
		
		Date date = new Date();
		
		SimpleDateFormat simpleDate = new SimpleDateFormat(sd);
		String sDate = simpleDate.format(date);
		
		
		return sDate;
	}
	
	public static String sTime(String st) {
		
		Date date = new Date();
		
		SimpleDateFormat simpleTime = new SimpleDateFormat(st);
		String sTime = simpleTime.format(date);
		
		
		return sTime;
	}
	
}

