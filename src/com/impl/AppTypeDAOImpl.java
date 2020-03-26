package com.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.AppTypeDAO;
import com.entity.AppType;
import com.entity.City;
import com.entity.HibernateUtil;

public class AppTypeDAOImpl implements AppTypeDAO {

	public void delete(AppType appType) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(appType);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public List<AppType> getAllAppType() {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<AppType> appTypeList = null;
		try {
			String hql = "from AppType ";
			Query query = session.createQuery(hql);
			appTypeList = (ArrayList<AppType>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return appTypeList;
	}

	public AppType getById(int id) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		AppType appType = null;
		try {
			appType = (AppType) session.get(AppType.class, id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return appType;
	}

	public void save(AppType appType) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(appType);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void update(AppType appType) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(appType);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}


}
