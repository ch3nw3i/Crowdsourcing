package com.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.CityDAO;
import com.entity.City;
import com.entity.HibernateUtil;

public class CityDAOImpl implements CityDAO {

	public void delete(City city) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(city);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public City getById(int id) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		City city = null;
		try {
			city = (City) session.get(City.class, id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return city;
	}

	public List<City> getAllCity() {
		List<City> cityList = new ArrayList<City>();
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from City ";
			Query query = session.createQuery(hql);
			cityList = (ArrayList<City>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		
		return cityList;

	}

	public void save(City city) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(city);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void update(City city) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(city);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

}
