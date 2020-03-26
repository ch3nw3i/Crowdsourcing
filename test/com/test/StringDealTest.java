package com.test;

import org.junit.Test;

import com.utils.StringDeal;

public class StringDealTest {

	@Test
	public void testCombineStringArray() {
//		StringDeal sd = new StringDeal();
		String[] str = {"北京", "福州", "厦门"};
		String result = StringDeal.combineStringArray(str);
		System.out.println(result);
	}
	
	@Test
	public void testSplitString() {
		String str = "北京&福州&厦门";
		String[] strArr = StringDeal.splitString(str);
		for (int i = 0; i < strArr.length; i++) {
			System.out.println(strArr[i]);
		}
	}
}
