package com.utils;

public class StringDeal {

	
	/*
	 * 合并字符串数组为一个字符串，使用&作为分隔符
	 */
	public static String combineStringArray(String[] strArr) {
		String result = "";
//		System.out.println(strArr.length);
		for (int i = 0; i < strArr.length; i++) {
			result += strArr[i] + "&";
		}
		result = result.substring(0, result.length() - 1); // 去掉最后一个 &
		return result;
	}
	
	/*
	 * 分隔字符串，根据&符
	 */
	public static String[] splitString(String str) {
		if (str != null) {
			String[] strArr = null;
			strArr = str.split("&");
			return strArr;
		} else {
			return null;
		}
	}
}
