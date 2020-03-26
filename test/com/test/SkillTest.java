package com.test;

import java.util.List;

import org.junit.Test;

import com.dao.SkillDAO;
import com.entity.Skill;
import com.impl.SkillDAOImpl;

public class SkillTest {

//	@Test
	public void testSave() {
		SkillDAO dao = new SkillDAOImpl();
		Skill skill_1 = new Skill();
		skill_1.setSkill("Java");
		dao.save(skill_1);
		
		Skill skill_2 = new Skill();
		skill_2.setSkill("C#");
		dao.save(skill_2);
		
		Skill skill_3 = new Skill();
		skill_3.setSkill("Python");
		dao.save(skill_3);
	}
	
//	@Test
	public void testGetSkill(){
		SkillDAO dao = new SkillDAOImpl();
		Skill skill = dao.getById(3);
		System.out.println(skill.getId() + " - " + skill.getSkill());
		
	}
	
	@Test
	public void testGetAllSkill() {
		SkillDAO dao = new SkillDAOImpl();
		List<Skill> skillList = dao.getAllSkill();
		for (Skill skill : skillList) {
			System.out.println(skill.getId() + " - " + skill.getSkill());
		}
	}
}
