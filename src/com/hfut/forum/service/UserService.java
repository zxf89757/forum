package com.hfut.forum.service;



import com.hfut.forum.dao.UserDao;
import com.hfut.forum.domain.User;


public class UserService{
	// 注入UserDao
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	// 按用户名查询用户的方法
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}
	
	// 用户登录的方法
	public User login(User user) {
		return userDao.login(user);
	}
	
	// 业务层完成用户注册代码
	public void save(User user) {
		userDao.save(user);
	}

	//用户更新
	public void update(User user) {
		userDao.update(user);
	}

	public User findByUid(Integer uid) {
		return userDao.findByUid(uid);
	}

	
}
