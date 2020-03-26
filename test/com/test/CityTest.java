package com.test;

import java.util.List;

import org.junit.Test;

import com.dao.CityDAO;
import com.entity.City;
import com.impl.CityDAOImpl;

public class CityTest {

//	@Test
	public void testSave() {
//		CityDAO dao = new CityDAOImpl();
//		City city_1 = new City();
//		city_1.setCity("厦门");
//		dao.save(city_1);
		
//		City city_2 = new City();
//		city_2.setCity("北京");
//		dao.save(city_2);
		
//		City city_3 = new City();
//		city_3.setCity("上海");
//		dao.save(city_3);
	}
	
	@Test
	public void testGetCity(){
		CityDAO dao = new CityDAOImpl();
		City city = dao.getById(3);
		System.out.println(city.getId() + " - " + city.getCity());
		
	}
	
	@Test
	public void testGetAllCity() {
		CityDAO dao = new CityDAOImpl();
		List<City> cityList = dao.getAllCity();
		for (City city : cityList) {
			System.out.println(city.getId() + " - " + city.getCity());
		}
	}
}
