package com.action;

import com.dao.AdministratorDAO;
import com.entity.Administrator;
import com.impl.AdministratorDAOImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends ActionSupport implements ModelDriven<Administrator>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Administrator admin = new Administrator();
	public Administrator getModel() {
		// TODO Auto-generated method stub
		return admin;
	}
	
	// 登录验证
	public String login() throws Exception {
		System.out.println("调用 Admin的login方法");
		AdministratorDAO adao = new AdministratorDAOImpl();
		Administrator administrator = new Administrator();
		String adminName = admin.getAdministrator();
		String password = admin.getPassword();
		boolean flag = adao.checkAdminPassword(adminName, password);
		String role = "failure";
		if (flag == true) {
			administrator = adao.findAdminByAdministrator(adminName);
			ActionContext.getContext().getSession().put("adminId", administrator.getId());
			ActionContext.getContext().getSession().put("administrator", administrator.getAdministrator());
			role = administrator.getRole();
			switch (Integer.parseInt(role)) {
			case 1 :
				role = "SystemManage";
				break;
			case 2 :
				role = "ProjectManage";
				break;
			case 3 :
				role = "UserManage";
				break;
			case 4 :
				role = "CustomerServiceStaff";
				break;
			}
			ActionContext.getContext().getSession().put("adminRole", role);
			return role;
		} else {
			return "failure";
		}
	}
	
	public String add() throws Exception {
		AdministratorDAO adao = new AdministratorDAOImpl();
		adao.save(admin);
		return "success";
	}
	
	public String logout() throws Exception{
		System.out.println("调用logout方法");
		ActionContext.getContext().getSession().clear();
		return "logout";
	}
	
	public String delete() throws Exception {
		System.out.println("调用delete方法");
		System.out.println(admin.getId());
		AdministratorDAO dao = new AdministratorDAOImpl();
		dao.delete(admin);
		return "success";
	}

}
