package com.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.CollectionDAO;
import com.entity.Collection;
import com.entity.HibernateUtil;
import com.entity.User;

public class CollectionDAOImpl implements CollectionDAO{

	public void delete(Collection collection) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(collection);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void save(Collection collection) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(collection);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void update(Collection collection) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(collection);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	// 获取某一用户的用户/项目收藏列表
	public List<Collection> getCollectionListByUserId(int userId, String collectionType) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<Collection> colList = null;
		try {
			String hql = "from Collection where userId = ? and collectionType = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, userId);
			query.setParameter(1, collectionType);
			colList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return colList;
	}

	public Collection findById(int id) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		Collection col = null;
		try {
			String hql = "from Collection where id = ?";
			Query query = session.createQuery(hql);
			query.setParameter(0, id);
			col = (Collection) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return col;
	}

}
