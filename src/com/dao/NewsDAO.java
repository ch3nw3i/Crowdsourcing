package com.dao;

import java.util.List;

import com.entity.News;

public interface NewsDAO {

	void save(News news);
	void delete(News news);
	void update(News news);
	
	News getNews(int id);
	List<News> getAllNews();
	
	// 获取自己发送的所有消息
	List<News> getNewsByFromUserId(int fromUserId);
	
	// 获取自己收到的所有信息
	List<News> getNewsByToUserId(int toUserId);
	
	void setStatus(int id, String status);
//	List<News> get
//	News get
}
