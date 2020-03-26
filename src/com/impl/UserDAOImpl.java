package com.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.dao.UserDAO;
import com.entity.HibernateUtil;
import com.entity.User;

public class UserDAOImpl implements UserDAO {
	// 添加用户
	public void save(User user) {
		Session session = HibernateUtil.getSession(); // 生成Session实例
		Transaction tx = session.beginTransaction(); // 创建Transaction实例
		try {
			session.save(user); // 使用Session的save方法将持久化对象保存到数据库
			tx.commit(); // 提交事务
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); // 回滚事务
		} finally {
			HibernateUtil.closeSession(); // 关闭Session实例
		}
	}
	
	// 根据用户id查找指定用户
	public User findById(int id) {
		User user = null;
		Session session = HibernateUtil.getSession(); // 生成Session实例
		Transaction tx = session.beginTransaction(); // 创建Transaction实例
		try {
			user = (User) session.get(User.class, id); // 使用Session的get方法获取指定id的用户到内存中
			tx.commit(); // 提交事务
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); // 回滚事务
		} finally {
			HibernateUtil.closeSession(); // 关闭Session实例
		}
		return user;
	}
	
	// 根据用户名查询用户
	public User findByUsername(String username) {
		User user = null;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			String hql = "from User u where u.username = :username ";
			Query query = session.createQuery(hql);
			query.setString("username", username);
			user = (User) query.uniqueResult();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return user;
	}
	
	// 删除用户
	public void delete(User user) {
		Session session = HibernateUtil.getSession(); // 生成Session实例
		Transaction tx = session.beginTransaction(); // 创建Transaction实例
		try {
			session.delete(user); // 使用Session的delete方法将持久化对象删除
			tx.commit(); // 提交事务
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); // 回滚事务
		} finally {
			HibernateUtil.closeSession(); // 关闭Session实例
		}
	}

	// 修改用户信息 
	public void update(User user) {
		Session session = HibernateUtil.getSession(); // 生成Session实例
		Transaction tx = session.beginTransaction(); // 创建Transaction实例
		try {
			session.update(user); // 使用Session的update方法更新持久化对象
			tx.commit(); // 提交事务
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback(); // 回滚事务
		} finally {
			HibernateUtil.closeSession(); // 关闭Session实例
		}
	}

	// 登录验证
	public boolean checkUserPassword(String username, String password) {
		boolean flag = false;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			User u = findByUsername(username);
			if (password.equals(u.getPassword()) && "启用".equals(u.getStatus())) {
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

	// 获取所有用户
	public List<User> showAllUser() {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		List<User> userList = null;
		try {
			String hql = "from User ";
			Query query = session.createQuery(hql);
			userList = query.list();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		} finally {
			HibernateUtil.closeSession();
		}
		return userList;
	}

	// 验证找回密码 答案
	public boolean checkQuestionCorrect(String username, String answer) {
		boolean flag = false;
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			User u = findByUsername(username);
			if (answer.equals(u.getAnswer())) {
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

	public void addDeveloperRole(int id) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			User user = findById(id);
			String role = user.getRole() + "&开发者";
			String hql = "update User u set u.role = ? where u.id = ? ";
			Query query = session.createQuery(hql);
			query.setParameter(0, role);
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
	
	public void setStatus(int id, String status) {
		Session session = HibernateUtil.getSession();
		Transaction tx = session.beginTransaction();
		try {
			System.out.println("将要修改用户状态为 : " + status);
			String hql = "update User u set u.status = ? where u.id = ? ";
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
