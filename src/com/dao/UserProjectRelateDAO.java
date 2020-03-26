package com.dao;

import java.util.List;

import com.entity.UserProjectRelate;

public interface UserProjectRelateDAO {
	public void save(UserProjectRelate upr);
	public void delete(UserProjectRelate upr);
	public void update(UserProjectRelate upr);
	
	public List<UserProjectRelate> findUprByUserId(int userId);
}
