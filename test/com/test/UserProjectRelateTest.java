package com.test;

import java.util.List;

import org.junit.Test;

import com.dao.UserProjectRelateDAO;
import com.entity.UserProjectRelate;
import com.impl.UserProjectRelateDAOImpl;

public class UserProjectRelateTest {

	@Test
	public void testFindUprByUserId() {
		int userId = 3;
		UserProjectRelateDAO dao = new UserProjectRelateDAOImpl();
		List<UserProjectRelate> uprList = dao.findUprByUserId(userId);
		for (UserProjectRelate upr : uprList) {
			System.out.println(upr.getId());
			System.out.println(upr.getUserId());
			System.out.println(upr.getProjectId());
		}
	}
}
