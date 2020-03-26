package com.dao;

import java.util.List;

import com.entity.Skill;

public interface SkillDAO {

	public void save(Skill skill);
	public void delete(Skill skill);
	public void update(Skill skill);
	public Skill getById(int id);
	public List<Skill> getAllSkill();
}
