package com.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.dao.ProjectDAO;
import com.entity.Project;
import com.impl.ProjectDAOImpl;


public class ProjectTest {

//	@Test
	public void testSave() {
		Project pj = new Project();
		pj.setTitle("Web商城");
		pj.setMoney(2000);
		pj.setSkill("Java");
		ProjectDAOImpl impl = new ProjectDAOImpl();
		impl.save(pj);
	}
	
//	@Test
	public void testFindById() {
		ProjectDAO dao = new ProjectDAOImpl();
		try {
			Project pj = dao.findById(2);
			System.out.println(pj.getId());
			System.out.println(pj.getTitle());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	public void testUpdate() {
		ProjectDAO dao = new ProjectDAOImpl();
		try {
			Project pj = new Project();
			pj.setId(2);
			pj.setTitle("Update test");
			pj.setCity("Amoy");
			dao.update(pj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Test 
	public void testDelete() {
		ProjectDAO dao = new ProjectDAOImpl();
		try {
			Project pj = new Project();
			pj.setId(1);
			dao.delete(pj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	public void testGetByRanger() {
		ProjectDAO dao = new ProjectDAOImpl();
		try {
			dao.getByRange(1, 10);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	public void testFindByProjectTitleKeyword() {
		ProjectDAO dao = new ProjectDAOImpl();
		try {
			List<Project> pjList = (ArrayList<Project>) dao.findByProjectTitleKeyword("test");
			for (Project pj : pjList) {
				System.out.println(pj.getId() + " - " + pj.getTitle());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testFindByRequestorId() {
		ProjectDAO dao = new ProjectDAOImpl();
		try {
			List<Project> pjList = (ArrayList<Project>) dao.findByRequestorId(8);
			for (Project pj : pjList) {
				System.out.println(pj.getId() + " - " + pj.getTitle());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
