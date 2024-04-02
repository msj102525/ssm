package com.sdm.ssm.admin.service;

import java.util.ArrayList;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.user.model.vo.User;

public interface UserManageService {

	int selectListCount();

	ArrayList<User> selectList(Paging paging);

	int updateUserAccountSuspendMethod(int id);

	int updateUserAccountActivateMethod(int id);



}
