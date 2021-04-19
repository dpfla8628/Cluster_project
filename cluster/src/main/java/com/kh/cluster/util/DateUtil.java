package com.kh.cluster.util;

import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	public static Date addMonth(Date date, int months) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, months);
		
		return cal.getTime();
	}
	
	public static Date addDays(Date date, int days) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, days);
		
		return cal.getTime();
	}
}
