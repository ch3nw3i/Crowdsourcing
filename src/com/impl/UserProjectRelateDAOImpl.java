package com.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.UserProjectRelateDAO;
import com.entity.HibernateUtil;
import com.entity.User;
import com.entity.UserProjectRelate;

public class UserProjectRelateDAOImpl implements UserProjectRelateDAO{

	public void delete(UserProjectRelate upr) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(upr);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void save(UserProjectRelate upr) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(upr);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void update(UserProjectRelate upr) {

		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(upr);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public List<UserProjectRelate> findUprByUserId(int userId) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<UserProjectRelate> uprList = null;
		try {
			String hql = "from UserProjectRelate where userId = :userId";
			Query query = session.createQuery(hql);
			query.setInteger("userId", userId);
			uprList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return uprList;
	}

}
