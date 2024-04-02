package com.sdm.ssm.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.user.model.vo.User;

@Repository("userManagerDao")
public class UserManageDao {
	private static final Logger logger = LoggerFactory.getLogger(UserManageDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public int selectListCount() {
		
		return sqlSessionTemplate.selectOne("userMapper.selectListCount");
	}
	public ArrayList<User> selectList(Paging paging) {
		List<User> list = sqlSessionTemplate.selectList("userMapper.selectList", paging);
		return (ArrayList<User>)list;
	}
	public int updateUserAccountSuspendMethod(int id) {
		return sqlSessionTemplate.update("userManageMapper.updateUserAccountSuspendMethod", id);
	}
	public int updateUserAccountActivateMethod(int id) {
		return sqlSessionTemplate.update("userManageMapper.updateUserAccountActivateMethod", id);
	}

	
}
