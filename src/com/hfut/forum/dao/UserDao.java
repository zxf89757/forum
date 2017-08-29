package com.hfut.forum.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hfut.forum.domain.User;

@SuppressWarnings("unchecked")
public class UserDao extends HibernateDaoSupport{
	
	// 按用户名查询是否有该用户:
	public User findByUsername(String username) {
		String hql = "from User where username = ?";
		List<User> list = this.getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	
	// 用户登录的方法
	public User login(User user) {
		String hql = "from User where username = ? and password = ?";
		List<User> list = this.getHibernateTemplate().find(hql,user.getUsername(),user.getPassword());
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	// 注册用户存入数据库代码实现
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}

	//用户更新
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}

	public User findByUid(Integer uid) {
		String hql = "from User where uid = ?";
		List<User> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
