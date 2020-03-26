package com.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.dao.ProjectDAO;
import com.entity.Collection;
import com.entity.Project;
import com.impl.ProjectDAOImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ProjectAction extends ActionSupport implements
		ModelDriven<Project> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Project pj = new Project();
	
	public Project getModel() {
		// TODO Auto-generated method stub
		return pj;
	}
	
	// 项目搜索
	public List<Project> searchProject() {
		// TODO 待完善的方法
		List<Project> list = new ArrayList<Project>();
		return list;
	}
	
	// 项目发布
	public String publish() {
		// TODO 待完善的方法
		return null;		
	}
	
	// 项目收藏
	public String collect() {
		ActionContext ctx = ActionContext.getContext();
		Map request = (Map) ActionContext.getContext().get("request");
		String project_id = (String) request.get("project_id");
		
		Collection col = new Collection();
		System.out.println(project_id);
		return "success";
		
	}
	
	// 项目发布 审批通过
	public String approve() {
		ProjectDAO dao = new ProjectDAOImpl();
		dao.approveProject(pj.getId(), pj.getStatus());
		return "success";
	}
		
}












