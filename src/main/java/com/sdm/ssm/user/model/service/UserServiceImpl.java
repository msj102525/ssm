package com.sdm.ssm.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.user.model.dao.UserDao;
import com.sdm.ssm.user.model.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public User selectUserById(String userId) {
		return userDao.selectUserById(userId);
		
	}

	@Override
	public int selectUserCountById(String userId) {
		return userDao.selectUserCountById(userId);
	}

<<<<<<< HEAD
	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}



	
}	
