package com.sdm.ssm.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.user.model.dao.UserDao;
import com.sdm.ssm.user.model.vo.User;


public interface UserService {

	Object searchIdByEmailBName = null;

	User selectUserById(String userId);

	int selectUserCountById(String userId);

	int insertUser(User user);

	int updateUser(User user);

	User searchIdByEmailBName(User user);

}
