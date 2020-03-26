package com.test;

import java.util.List;

import org.junit.Test;

import com.dao.UserDAO;
import com.entity.User;
import com.impl.UserDAOImpl;
import com.utils.StringDeal;

public class UserTest {

	@Test
	public void testSave() {
		UserDAO dao = new UserDAOImpl();
		try {
			User u = new User();
			u.setUsername("test1");
			u.setPassword("test2");
			u.setQuestion("question");
			u.setAnswer("answer");
			dao.save(u);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// @Test
	public void testCheckUserPassword() {
		UserDAO dao = new UserDAOImpl();
		try {
			boolean flag = dao.checkUserPassword("123", "456");
			System.out.println(flag);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// @Test
	public void testShowAllUser() {
		UserDAO dao = new UserDAOImpl();
		try {
			List<User> uList = dao.showAllUser();
			if (!uList.isEmpty()) {
				for (User u : uList) {
					System.out.println(u.getId());
					System.out.println(u.getUsername());
					System.out.println(u.getPassword());
					System.out.println("\n");
				}
			} else {
				System.out.println("Empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// @Test
	// public void testFindByUsername() {
	// UserDAO dao = new UserDAOImpl();
	// try {
	// User user = dao.findByUsername("123");
	// System.out.println(user.getUsername());
	// System.out.println(user.getPassword());
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	// }

	// @Test
	public void testFindByUsername() {
		UserDAO dao = new UserDAOImpl();
		try {
			User user = dao.findByUsername("123");
			if (user != null) {
				System.out.println("存在");
			} else {
				System.out.println("不存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testCompareUserRole() {
		UserDAO udao = new UserDAOImpl();
		User u = udao.findByUsername("123");
		String[] roleArr = StringDeal.splitString(u.getRole());
		boolean loginFlag = false;
		boolean devFlag = false;
		boolean reqFlag = false;
		for (int i = 0; i < roleArr.length; i++) {
			if (roleArr[i].equals("普通用户")) {
				loginFlag = true;
			}
			if (roleArr[i].equals("开发者")) {
				devFlag = true;
			}
			if (roleArr[i].equals("需求方")) {
				reqFlag = true;
			}
		}
		System.out.println(loginFlag);
		System.out.println(devFlag);
		System.out.println(reqFlag);
		if (loginFlag) {
			System.out.println("普通用户");
		}
		if (devFlag) {
			System.out.println("开发者");
		}
		if (reqFlag) {
			System.out.println("需求方");
		}
	}

}
