package com.action;

import com.dao.DeveloperDAO;
import com.dao.UserDAO;
import com.entity.Developer;
import com.entity.Project;
import com.impl.DeveloperDAOImpl;
import com.impl.UserDAOImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DeveloperAction extends ActionSupport implements ModelDriven<Developer>  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Developer developer;
	
	public Developer getModel() {
		// TODO Auto-generated method stub
		return developer;
	}
	
	// 开发者认证
	public String auth() {
		System.out.println("调用DeveloperAction的auth方法");
		DeveloperDAO dpdao = new DeveloperDAOImpl();
		UserDAO udao = new UserDAOImpl();
		if (developer != null) {
//			dpdao.save(developer);
//			udao.addDeveloperRole(developer.getUserId());
			System.out.println("开发者认证已申请");
			return "success";
		} else {
			return "failure";
		}
	}
	// 更改用户状态
	public String setStatus() throws Exception {
		System.out.println("调用UserAction的setStatus方法");
		UserDAO dao = new UserDAOImpl();
		if (developer.getStatus().equals("启用")) {
			dao.setStatus(developer.getId(), "启用");
			return "success";
		} else if (developer.getStatus().equals("禁用")){
			dao.setStatus(developer.getId(), "禁用");
			return "success";
		} else {
			System.out.println("setStatus 执行出错");
			return "failure";
		}
	}

}
