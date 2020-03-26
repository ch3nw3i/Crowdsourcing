package com.dao;

import java.util.List;

import com.entity.City;

public interface CityDAO {
	public void save(City city);
	public void delete(City city);
	public void update(City city);
	public City getById(int id);
	public List<City> getAllCity();
}
