package com.test;

import java.util.List;

import org.junit.Test;

import com.dao.DeveloperDAO;
import com.entity.Developer;
import com.impl.DeveloperDAOImpl;

public class DeveloperTest {
//	@Test
	public void testSave() {
		DeveloperDAO dao = new DeveloperDAOImpl();
		Developer dp = new Developer();
		dp.setUserId(3);
		dp.setRealName("测试开发者");
		dp.setCity("福州");
		dp.setSkill("Java/PHP/Delphi");
		dao.save(dp);
	}
	
//	@Test
	public void testGetByRange() {
		DeveloperDAO dao = new DeveloperDAOImpl();
		List<Developer> dpList = null;
		dpList = dao.getByRange(1, 10);
		for (Developer dp : dpList) {
			System.out.println(dp.getId());
			System.out.println(dp.getUserId());
			System.out.println(dp.getRealName());
			System.out.println(dp.getCity());
		}
	}
	
	@Test
	public void testFindById() {
		DeveloperDAO dao = new DeveloperDAOImpl();
		Developer dp = dao.findById(1);
		System.out.println(dp.getId());
		System.out.println(dp.getUserId());
		System.out.println(dp.getRealName());
		System.out.println(dp.getSkill());
	}
}
