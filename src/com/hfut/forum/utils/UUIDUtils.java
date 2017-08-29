package com.hfut.forum.utils;

import java.util.UUID;

public class UUIDUtils {
	/**
	 * 获得随机的字符串
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}