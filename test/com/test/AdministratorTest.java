package com.test;

import org.junit.Test;

import com.action.AdminAction;
import com.dao.AdministratorDAO;
import com.entity.Administrator;
import com.impl.AdministratorDAOImpl;

public class AdministratorTest {
	
//	@Test
	public void testFindAdminByAdministrator() {
		Administrator admin = null;
		AdministratorDAO dao = new AdministratorDAOImpl();
		admin = dao.findAdminByAdministrator("admin");
		System.out.println(admin.getAdministrator());
		System.out.println(admin.getPassword());
	}
	
//	@Test
	public void testCheckAdminPassword() {
//		Administrator admin = null;
		AdministratorDAO dao = new AdministratorDAOImpl();
		boolean flag = dao.checkAdminPassword("admin", "admin");
		System.out.println(flag);
		
	}
	

}
