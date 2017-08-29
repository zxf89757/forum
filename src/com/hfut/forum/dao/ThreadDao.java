package com.hfut.forum.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hfut.forum.domain.Thread;
import com.hfut.forum.utils.PageHibernateCallback;

@SuppressWarnings("unchecked")
public class ThreadDao extends HibernateDaoSupport{

	
	public List<Thread> findTop() {
		// 使用离线条件查询.
		DetachedCriteria criteria = DetachedCriteria.forClass(Thread.class);
		// 查询置顶的帖子,条件就是topped = 1
		criteria.add(Restrictions.eq("topped", 1));
		// 倒序排序输出:
		criteria.addOrder(Order.desc("dateCreated"));
		// 执行查询:
		List<Thread> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}
	
	public List<Thread> findNew() {
		// 使用离线条件查询:
		DetachedCriteria criteria = DetachedCriteria.forClass(Thread.class);
		// 按日期进行倒序排序:
		criteria.addOrder(Order.desc("dateCreated"));
		// 执行查询:
		List<Thread> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}

	public int findCountUid(Integer uid) {
		String hql = "select count(*) from Thread t where t.user.uid = ?";
		List<Long> list=this.getHibernateTemplate().find(hql,uid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Thread> findByPageUid(Integer uid, int begin, int limit) {
		String hql = "select t from Thread t join t.user u where u.uid = ? order by t.dateCreated desc";
		List<Thread> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Thread>(hql, new Object[]{uid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	public Thread findByTid(Integer tid) {
		return this.getHibernateTemplate().get(Thread.class,tid);
	}

	public void delete(Thread thread) {
		this.getHibernateTemplate().delete(thread);
	}

	public void update(Thread thread) {
		this.getHibernateTemplate().update(thread);
	}

	public List<Thread> findByPageCid(Integer cid, int begin, int limit) {
		String hql = "select t from Thread t join t.course c where c.cid = ? order by t.dateCreated desc";
		List<Thread> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Thread>(hql, new Object[]{cid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	public List<Thread> findByCidTop(Integer cid) {
		/*String hql = "select t from Thread t join t.course c where c.cid = ? and t.topped=?";
		List<Thread> list = this.getHibernateTemplate().find(hql, cid,1);
		if(list != null && list.size() > 0){
			return list;
		}
		return null;*/
		// 使用离线条件查询.
		DetachedCriteria criteria = DetachedCriteria.forClass(Thread.class);
		// 查询置顶的帖子,条件就是topped = 1
		criteria.add(Restrictions.eq("topped", 1));
		criteria.add(Restrictions.eq("course.cid", cid));
		// 倒序排序输出:
		criteria.addOrder(Order.desc("dateCreated"));
		// 执行查询:
		List<Thread> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 3);
		return list;
	}

	public void save(Thread thread) {
		this.getHibernateTemplate().save(thread);
	}

	public int searchCount(String searchValue) {
		String hql = "select count(*) from Thread t where t.title like ?";
		List<Long> list=this.getHibernateTemplate().find(hql,"%"+searchValue+"%");
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Thread> search(String searchValue, int begin, int limit) {
		String hql = "select t from Thread t where t.title like ? order by t.dateCreated desc";
		List<Thread> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Thread>(hql, new Object[]{"%"+searchValue+"%"}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

}
