package com.hfut.forum.utils;

import com.hfut.forum.domain.Thread;
/**
 * 单例模式   第一次通过调用静态方法    Singleton a=Singleton.getInstance(); 完成仅有的一次实例化
 * 一个类中有个静态成员类
 */
public class Singleton {
	private LimitQueue<Thread> list = new LimitQueue<Thread>(3);
	private static Singleton instance = new Singleton();
	public static Singleton getInstance() {  
		    return instance;  
	}
	public void setList(LimitQueue<Thread> list) {
		this.list = list;
	}
	public LimitQueue<Thread> getList() {
		return list;
	}
}
