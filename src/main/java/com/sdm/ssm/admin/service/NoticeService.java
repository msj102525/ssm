package com.sdm.ssm.admin.service;

import java.util.ArrayList;

import com.sdm.ssm.admin.model.vo.Notice;
import com.sdm.ssm.common.Paging;

public interface NoticeService {
	int selectListCount();

	ArrayList<Notice> selectList(Paging paging);
}
