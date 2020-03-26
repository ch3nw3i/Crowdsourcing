package com.test;

import java.util.List;

import org.junit.Test;

import com.dao.AppTypeDAO;
import com.entity.AppType;
import com.impl.AppTypeDAOImpl;

public class AppTypeTest {
//	@Test
	public void testSave() {
		AppTypeDAO dao = new AppTypeDAOImpl();
		AppType appType_1 = new AppType();
		appType_1.setAppType("Web");
		dao.save(appType_1);
		
		AppType appType_2 = new AppType();
		appType_2.setAppType("小程序");
		dao.save(appType_2);
		
		AppType appType_3 = new AppType();
		appType_3.setAppType("Python");
		dao.save(appType_3);
	}
	
//	@Test
	public void testGetAppType_3(){
		AppTypeDAO dao = new AppTypeDAOImpl();
		AppType appType = dao.getById(3);
		System.out.println(appType.getId() + " - " + appType.getAppType());
		
	}
	
	@Test
	public void testGetAllSkill() {
		AppTypeDAO dao = new AppTypeDAOImpl();
		List<AppType> appTypeList = dao.getAllAppType();
		for (AppType appType : appTypeList) {
			System.out.println(appType.getId() + " - " + appType.getAppType());
		}
	}
}
