package com.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.SkillDAO;
import com.entity.AppType;
import com.entity.HibernateUtil;
import com.entity.Skill;

public class SkillDAOImpl implements SkillDAO {

	public void delete(Skill skill) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(skill);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public List<Skill> getAllSkill() {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<Skill> skillList = null;
		try {
			String hql = "from Skill ";
			Query query = session.createQuery(hql);
			skillList = (ArrayList<Skill>) query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return skillList;
	}

	public Skill getById(int id) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		Skill skill = null;
		try {
			skill = (Skill) session.get(Skill.class, id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return skill;
	}

	public void save(Skill skill) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(skill);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

	public void update(Skill skill) {

		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(skill);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}

}
