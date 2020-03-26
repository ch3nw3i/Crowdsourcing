package com.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.AdministratorDAO;
import com.entity.Administrator;
import com.entity.HibernateUtil;
import com.entity.User;

public class AdministratorDAOImpl implements AdministratorDAO{

	public void save(Administrator admin) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(admin);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}
	
	public void delete(Administrator admin) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(admin);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void update(Administrator admin) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(admin);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public boolean checkAdminPassword(String adminName, String password) {
		boolean flag = false;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			Administrator admin = findAdminByAdministrator(adminName);
			if (password.equals(admin.getPassword())) {
				flag = true;
				return flag;
			}
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return flag;
	}

	public Administrator findAdminByAdministrator(String admin) {
		Administrator administrator = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from Administrator a where a.administrator = :admin ";
			Query query = session.createQuery(hql);
			query.setString("admin", admin);
			administrator = (Administrator) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return administrator;
		
	}

	public List<Administrator> showAllAdministrator() {

		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<Administrator> adminList = null;
		try {
			String hql = "from Administrator ";
			Query query = session.createQuery(hql);
			adminList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return adminList;
	}
}
