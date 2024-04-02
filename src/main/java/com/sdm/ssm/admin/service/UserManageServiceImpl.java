package com.sdm.ssm.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.admin.dao.UserManageDao;
import com.sdm.ssm.common.Paging;
import com.sdm.ssm.user.model.vo.User;

@Service("userManageService")
public class UserManageServiceImpl implements UserManageService{

	@Autowired
	private UserManageDao umDao;

	@Override
	public int selectListCount() {
		
		return umDao.selectListCount();
	}

	@Override
	public ArrayList<User> selectList(Paging paging) {
		
		return umDao.selectList(paging);
	}

	@Override
	public int updateUserAccountSuspendMethod(int id) {
		return umDao.updateUserAccountSuspendMethod(id);
		
	}

	@Override
	public int updateUserAccountActivateMethod(int id) {
		return umDao.updateUserAccountActivateMethod(id);
		
	}


}
