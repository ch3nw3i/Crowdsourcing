package com.dao;

import java.util.List;

import com.entity.Administrator;

public interface AdministratorDAO {
	void save(Administrator admin);
	void delete(Administrator admin);
	void update(Administrator admin);
//	Administrator findAdministratorById(int id);
	Administrator findAdminByAdministrator(String admin);
//	String getAdminRole(int id);
//	
	// 管理员登录验证
	boolean checkAdminPassword(String admin, String password);
	
	List<Administrator> showAllAdministrator();
}
