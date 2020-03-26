package com.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormat {

	// 获取当前日期
	public static String getDate() {
		String date = "";
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		date = df.format(d);
		return date;
	}

	// 获取当前时间
	public static String getTime() {
		String time = "";
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("hh:mm:ss");
		time = df.format(d);
		return time;
	}
	
	// 获取当前日期 时间
	public static String getDateTime() {
		String dateTime = "";
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		dateTime = df.format(d);
		return dateTime;
	}
	
}
