package com.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;

import com.dao.NewsDAO;
import com.entity.News;
import com.impl.NewsDAOImpl;

public class NewsTest {

//	@Test
	public void testSave() {
		NewsDAO dao = new NewsDAOImpl();
		News news = new News();
		news.setStatus("未读");
		news.setType("站内信");
		news.setContent("测试内容");
		news.setFromUserId(1);
		news.setToUserId(2);
		news.setGmtCreate(new Date());
		news.setGmtModified(null);
		dao.save(news);
	}
	
//	@Test
	public void testDelete() {
		NewsDAO dao = new NewsDAOImpl();
		News news = new News();
		news.setId(1);
		dao.delete(news);
	}
	
//	@Test
	public void testUpdate() {
		NewsDAO dao = new NewsDAOImpl();
		News news = new News();
		news.setId(2);
		news.setStatus("已读");
		news.setType("任务信");
		news.setContent("测试内容111");
		news.setFromUserId(1);
		news.setToUserId(2);
		news.setGmtModified(new Date());
		dao.update(news);
	}
	
//	@Test
	public void testGetNews() {
		NewsDAO dao = new NewsDAOImpl();
		News news = dao.getNews(2);
		System.out.println(news.getContent());
		System.out.println(news.getStatus());
	}
	
//	@Test
	public void testGetAllNews() {
		NewsDAO dao = new NewsDAOImpl();
		List<News> newsList = null;
		newsList = dao.getAllNews();
		for (News news : newsList) {
			System.out.println(news.getId());
			System.out.println(news.getContent());
			System.out.println(news.getStatus());
		}
	}
	
//	@Test
	public void testGetNewsByFromUserId() {
		NewsDAO dao = new NewsDAOImpl();
		List<News> newsList = null;
		newsList = dao.getNewsByFromUserId(8);
		for (News n : newsList) {
			System.out.println(n.getId());
			System.out.println(n.getContent());
			System.out.println(n.getStatus());
			System.out.println(n.getFromUserId());
			System.out.println(n.getToUserId());
			System.out.println(n.getGmtCreate());
			System.out.println(n.getGmtModified());
			System.out.println("-----------");
		}
	}
	
	@Test
	public void testSetStatus() {
		NewsDAO dao = new NewsDAOImpl();
		dao.setStatus(2, "未读");
		
	}
	
}
