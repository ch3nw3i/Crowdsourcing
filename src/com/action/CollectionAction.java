package com.action;

import com.dao.CollectionDAO;
import com.entity.Collection;
import com.impl.CollectionDAOImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.utils.DateFormat;

public class CollectionAction extends ActionSupport implements
		ModelDriven<Collection> {
	
	private Collection collection = new Collection();
	
	public Collection getModel() {
		return collection;
	}

	// 收藏开发者 或 项目
	public String collect() throws Exception {
		System.out.println("调用collect方法");
		CollectionDAO colDao = new CollectionDAOImpl();
		int userId = collection.getUserId();
		String collectionType = collection.getCollectionType();
		int collectionId = collection.getCollectionId();
		colDao.save(collection);
		if (collectionType.equals("user")) {
			return "user";
		}
		if (collectionType.equals("project")) {
			return "project";
		}
		return "success";
	}
	
	public String delete() throws Exception {
		System.out.println("调用delete方法");
		CollectionDAO colDao = new CollectionDAOImpl();
		if (collection != null) {
			System.out.println(collection.getId());
			Collection c = colDao.findById(collection.getId());
			colDao.delete(c);
			return "success";
		} else {
			return "failure";
		}
		
	}
	
	
	
}
