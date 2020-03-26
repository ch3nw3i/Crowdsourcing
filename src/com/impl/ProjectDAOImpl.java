package com.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.ProjectDAO;
import com.entity.HibernateUtil;
import com.entity.Project;
import com.entity.User;

public class ProjectDAOImpl implements ProjectDAO{

	// 保存项目
	public void save(Project pj) {
		Session session = HibernateUtil.getSession(); // 生成Session实例
		Transaction tx = session.beginTransaction(); // 创建Transaction实例
		try {
			session.save(pj); // 使用Session的save方法将持久化对象保存到数据库
			tx.commit(); // 提交事务
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); // 回滚事务
		} finally {
			HibernateUtil.closeSession(); // 关闭Session实例
		}
	}
	
	public void delete(Project pj) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.delete(pj);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}	
	}

	// 更新项目信息
	public void update(Project pj) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			session.update(pj);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
	}
	

	// 根据 项目id 获取单个项目
	public Project findById(int id) {
		Project pj = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			pj = (Project) session.get(Project.class, id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return pj;
	}
	
	// 根据  项目标题 关键词 搜索项目，得到项目列表
	public List<Project> findByProjectTitleKeyword(String titleKeyword) {
		List<Project> pjList = new ArrayList<Project>();
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from Project as pj where pj.title like ?";
			Query q = session.createQuery(hql);
			q.setParameter(0, "%" + titleKeyword + "%");
			pjList = (ArrayList<Project>)q.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return pjList;
		
	}

	// 项目大厅，id顺序，分页查询项目
	public List<Project> getByRange(int begin, int end) {
		List<Project> pjList = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from Project where id between ? and ?";
			Query q = session.createQuery(hql);
			q.setParameter(0, begin);
			q.setParameter(1, end);
			pjList = (ArrayList<Project>)q.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return pjList;
	}

	public List<Project> findByProjectType(String titleKeyword, String[] city,
			String[] appType, String[] skill) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Project> findByRequestorId(int requestorId) {
		List<Project> pjList = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from Project p where p.requestorId = :requestorId";
			Query query = session.createQuery(hql);
			query.setInteger("requestorId", requestorId);
			pjList = (ArrayList<Project>)query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return pjList;
	}
	
	public List<Project> showAllProject() {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<Project> pjList = null;
		try {
			String hql = "from Project ";
			Query query = session.createQuery(hql);
			pjList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return pjList;
	}

	public List<Project> findByDeveloperId(int developerId) {
		List<Project> pjList = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from Project p where p.developerId = :developerId";
			Query query = session.createQuery(hql);
			query.setInteger("developerId", developerId);
			pjList = (ArrayList<Project>)query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return pjList;
	}

	public void approveProject(int id, String status) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "update Project pj set pj.status = ? where pj.id = ? ";
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
