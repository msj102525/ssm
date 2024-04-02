package com.sdm.ssm.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.user.model.dao.UserDao;
import com.sdm.ssm.user.model.vo.User;


public interface UserService {

	User selectUserById(String userId);

	int selectUserCountById(String userId);

<<<<<<< HEAD
	int insertUser(User user);
=======
>>>>>>> branch 'main' of https://github.com/msj102525/ssm.git
	
	
}
