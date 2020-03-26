package com.test;

import java.util.List;

import org.junit.Test;

import com.dao.CollectionDAO;
import com.entity.Collection;
import com.impl.CollectionDAOImpl;

public class CollectionTest {
//	@Test
	public void testGetCollectionListByUserId() {
		int userId = 1;
		String collectionType = "user";
		CollectionDAO dao = new CollectionDAOImpl ();
		List<Collection> colList = dao.getCollectionListByUserId(userId, collectionType);
		for (Collection c : colList) {
			System.out.println("用户id : " + c.getUserId());
			System.out.println("收藏类型 : " + c.getCollectionType());
			System.out.println("收藏的id : " + c.getCollectionId());
		}
	}
	
	@Test
	public void testFindById() {
		int id = 1;
		CollectionDAO dao = new CollectionDAOImpl ();
		Collection c = dao.findById(id);
		dao.delete(c);
	}
}
