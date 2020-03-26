package com.action;

import com.dao.UserDAO;
import com.entity.User;
import com.impl.UserDAOImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private User user = new User();
	public User getModel() {
		return user;
	}
	
	// 登录验证
	public String login() throws Exception {
		System.out.println("调用login方法");
		UserDAO udao = new UserDAOImpl();
		String username = user.getUsername();
		String password = user.getPassword();
		boolean flag = udao.checkUserPassword(username, password);
		User u = udao.findByUsername(username);
		System.out.println(flag);
		System.out.println(u.getId());
		if (flag == true) {
			ActionContext.getContext().getSession().put("userId", u.getId());
			ActionContext.getContext().getSession().put("username", u.getUsername());
			ActionContext.getContext().getSession().put("userRole", String.valueOf(u.getRole()));
			return "success";
		} else {
			return "failure";
		}
	}
	
	// 用户注册
	public String register() throws Exception {
		UserDAO udao = new UserDAOImpl();
		if (user != null) {
			if (udao.findByUsername(user.getUsername()) == null) {
				udao.save(user);
				return "success";
			}
		} else {
			return "failure";
		}
		return "failure";
	}
	
	// 用户注销
	public String logout() throws Exception {
		System.out.println("调用logout方法");
		ActionContext.getContext().getSession().clear();
		return "success";
	}
	
	// 获取密码找回问题
	public String getQuestion() throws Exception {
		System.out.println("调用getQuestion方法，验证用户名是否存在，若存在，则获取密码找回问题");
		UserDAO dao = new UserDAOImpl();
		User u = dao.findByUsername(user.getUsername());
		if (u != null) {
			ActionContext.getContext().getSession().put("fp_username", u.getUsername());
			return "success";
		} else {
			return "failure";
		}
			
	}
	
	// 验证密码找回问题的答案
	public String checkAnswer() throws Exception {
		System.out.println("调用checkAnswer方法，验证密码找回问题的回答是否正确");
		UserDAO dao = new UserDAOImpl();
		boolean flag = dao.checkQuestionCorrect(user.getUsername(), user.getAnswer());
		ActionContext.getContext().getSession().put("fp_username", user.getUsername());
		if (flag) {
			return "success";
		} else {
			return "failure";
		}
		
	}
	
	// 重置用户密码
	public String passwordReset() throws Exception {
		System.out.println("调用passwordReset方法");
		UserDAO dao = new UserDAOImpl();
		User u = new User();
		u = dao.findByUsername(user.getUsername());
		u.setPassword(user.getPassword());
		dao.update(u);
		if (user != null) {
			return "success";
		} else {
			return "failure";
		}
	}
	
	// 更改用户信息
	public String update() throws Exception {
		System.out.println("调用update方法");
		UserDAO dao = new UserDAOImpl();
		System.out.println("id : " + user.getId());
		System.out.println("用户名 : " + user.getUsername());
		System.out.println("昵称 : " + user.getNickname());
		dao.update(user);
		if (user != null) {
			return "success";
		} else {
			return "failure";
		}
	}
	
	// 更改用户状态
	public String setStatus() throws Exception {
		System.out.println("调用UserAction的setStatus方法");
		System.out.println("即将设置id : " + user.getId());
		System.out.println("即将设置id的状态 : " + user.getStatus());
		UserDAO dao = new UserDAOImpl();
		if (user.getStatus().equals("启用")) {
			dao.setStatus(user.getId(), "启用");
			System.out.println("成功设置状态为 : 启用");
			return "success";
		} else if (user.getStatus().equals("禁用")){
			dao.setStatus(user.getId(), "禁用");
			System.out.println("成功设置状态为 : 禁用");
			return "success";
		} else {
			System.out.println("setStatus 执行出错");
			return "failure";
		}
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("调用默认execute方法");
		return null;
	}


}
