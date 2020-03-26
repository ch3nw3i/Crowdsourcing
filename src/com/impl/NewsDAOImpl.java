package com.impl;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.NewsDAO;
import com.entity.HibernateUtil;
import com.entity.News;
import com.entity.User;

public class NewsDAOImpl implements NewsDAO{

	public void save(News news) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(news);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}
	
	public void delete(News news) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(news);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}


	public void update(News news) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(news);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public News getNews(int id) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		News news = new News();
		try {
			news = (News) session.get(News.class, id);
			tx.commit();
			return news;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return news;
	}

	public List<News> getAllNews() {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<News> newsList = null;
		try {
			String hql = "from News";
			Query query = session.createQuery(hql);
			newsList = (List<News>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return newsList;
	}

	// 获取自己发送的所有消息
	public List<News> getNewsByFromUserId(int fromUserId) {

		List<News> news = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from News n where n.fromUserId = :fromUserId ";
			Query query = session.createQuery(hql);
			query.setInteger("fromUserId", fromUserId);
			news = query.list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return news;
	}

	// 获取自己收到的所有信息
	public List<News> getNewsByToUserId(int toUserId) {
		List<News> news = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from News n where n.toUserId = :toUserId ";
			Query query = session.createQuery(hql);
			query.setInteger("toUserId", toUserId);
			news = query.list();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return news;
	}

	public void setStatus(int id, String status) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "update News n set n.status = ? where n.id = ? ";
			Query query = session.createQuery(hql);
			query.setParameter(0, status);
			query.setParameter(1, id);
			System.out.println("hql : " + hql);
			query.executeUpdate();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}


	
}
