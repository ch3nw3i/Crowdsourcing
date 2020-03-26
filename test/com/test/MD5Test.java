package com.test;

import org.junit.Test;

import com.utils.MD5;

public class MD5Test {
	@Test
	public void testGetPwd() {
		String pwd = MD5.getPwd("123");
		System.out.println(pwd);
	}
}
