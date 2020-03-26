package com.dao;

import java.util.List;

import com.entity.Project;

public interface ProjectDAO {

	void save(Project pj);
	void delete(Project pj);
	void update(Project pj);
	
	public Project findById(int id);
//	public List<Project> findByTitle(String title);
	public List<Project> getByRange(int begin, int end);
	public List<Project> findByProjectTitleKeyword(String titleKeyword);
	public List<Project> findByProjectType(String titleKeyword, String[] city, String[] appType, String[] skill);
	public List<Project> findByRequestorId(int requestorId);
	public List<Project> findByDeveloperId(int developerId);
	public List<Project> showAllProject();
	
	public void approveProject(int id, String status);
}
