package com.sdm.ssm.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.user.model.vo.User;

@Repository("userDao")
public class UserDao {
	private static final Logger logger = LoggerFactory.getLogger(UserDao.class);
	
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public User selectUserById(String userId) {
		logger.info(userId);
		
		return sqlSessionTemplate.selectOne("userMapper.selectUserById", userId);
	}

	public int selectUserCountById(String userId) {
		return sqlSessionTemplate.selectOne("userMapper.selectUserCountById", userId);
	}

	public int insertUser(User user) {
		logger.info(user.toString());
		return sqlSessionTemplate.insert("userMapper.insertUser", user);
	}

}
