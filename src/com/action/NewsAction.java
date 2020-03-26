package com.action;

import com.dao.NewsDAO;
import com.entity.News;
import com.impl.NewsDAOImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class NewsAction  extends ActionSupport implements ModelDriven<News>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	News news = new News();
	public News getModel() {
		System.out.println("NewsAction 获得news对象");
		return news;
	}

	public String send() {
		// send 方法会向数据库中增加一条数据
		NewsDAO dao = new NewsDAOImpl();
		dao.save(news);
		return "success";
	}
	
	public String setStatus() {
		System.out.println("调用NewsAction的setStatus方法");
		NewsDAO dao = new NewsDAOImpl();
		if (news.getStatus().equals("未读")) {
			dao.setStatus(news.getId(), "未读");
			return "success";
		} else if (news.getStatus().equals("已读")){
			dao.setStatus(news.getId(), "已读");
			return "success";
		} else {
			System.out.println("setStatus 执行出错");
			return "failure";
		}
	}
}
