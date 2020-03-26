package com.dao;

import java.util.List;

import com.entity.Collection;

public interface CollectionDAO {
	void save(Collection collection);
	void delete(Collection collection);
	void update(Collection collection);
	
	Collection findById(int id);
	List<Collection> getCollectionListByUserId(int userId, String collectionType);
}
