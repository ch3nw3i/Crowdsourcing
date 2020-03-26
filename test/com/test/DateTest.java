package com.test;

import org.junit.Test;

import com.utils.DateFormat;

public class DateTest {

//	@Test
	public void testGetDate() {
		String d = DateFormat.getDate();
		System.out.println(d);
	}
	
//	@Test
	public void testGetTime() {
		String d = DateFormat.getTime();
		System.out.println(d);
	}
	
	@Test
	public void testGetDateTime() {
		String d = DateFormat.getDateTime();
		System.out.println(d);
	}
}
