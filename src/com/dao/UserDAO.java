package com.dao;

import java.util.List;

import com.entity.User;

public interface UserDAO {
	void save(User user);
	User findById(int id);
	User findByUsername(String username);
	List<User> showAllUser();
	
	void delete(User user);
	void update(User user);

	// 用户登录
//	boolean userLogin (String username, String password);
	boolean checkUserPassword(String username, String password);
	
	/*
	 *  密码找回功能
	 *  实现：
	 *  	1、使用 findById 获取用户， 得到用户的密码找回问题
	 *  	2、验证用户输入的答案是否和设定的相同
	 */
	boolean checkQuestionCorrect(String username, String answer);

	void addDeveloperRole(int id);
	
	void setStatus(int id, String status);
}
