package com.dao;

import java.util.List;

import com.entity.Developer;


public interface DeveloperDAO {

	void save(Developer developer);
	void delete(Developer developer);
	void update(Developer developer);

	List<Developer> showAllDeveloper();
	public Developer findById(int id); 
	
	public List<Developer> getByRange(int begin, int end);
	public List<Developer> findByDeveloperNameKeyword(String nameKeyword);
}
