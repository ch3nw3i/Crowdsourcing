package com.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.DeveloperDAO;
import com.entity.Developer;
import com.entity.HibernateUtil;
import com.entity.Project;
import com.entity.User;

public class DeveloperDAOImpl implements DeveloperDAO{

	public void delete(Developer developer) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(developer);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void save(Developer developer) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(developer);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void update(Developer developer) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(developer);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public List<Developer> getByRange(int begin, int end) {
		List<Developer> pjList = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from Developer where id between ? and ?";
			Query q = session.createQuery(hql);
			q.setParameter(0, begin);
			q.setParameter(1, end);
			pjList = (ArrayList<Developer>)q.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return pjList;
	}


	// 根据 项目id 获取单个项目
	public Developer findById(int id) {
		Developer dp = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			dp = (Developer) session.get(Developer.class, id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return dp;
	}

	// 查找开发者
	public List<Developer> findByDeveloperNameKeyword(String nameKeyword) {
		List<Developer> list = new ArrayList<Developer>();
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from Developer as pj where pj.realName like ?";
			Query q = session.createQuery(hql);
			q.setParameter(0, "%" + nameKeyword + "%");
			list = (ArrayList<Developer>)q.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return list;
	}

	public List<Developer> showAllDeveloper() {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<Developer> devList = null;
		try {
			String hql = "from Developer ";
			Query query = session.createQuery(hql);
			devList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return devList;
	}

}
