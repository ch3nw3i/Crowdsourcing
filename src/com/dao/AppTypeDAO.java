package com.dao;

import java.util.List;

import com.entity.AppType;

public interface AppTypeDAO {
	public void save(AppType appType);
	public void delete(AppType appType);
	public void update(AppType appType);
	public AppType getById(int id);
	public List<AppType> getAllAppType();

}
