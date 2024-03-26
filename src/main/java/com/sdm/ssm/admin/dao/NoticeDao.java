package com.sdm.ssm.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.admin.model.vo.Notice;
import com.sdm.ssm.common.Paging;

@Repository("noticeDao")
public class NoticeDao {
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	public int selectListCount() {
		return sqlSessionTemplate.selectOne("noticeMapper.selectListCount");
	}
	public ArrayList<Notice> selectList(Paging paging) {
		List<Notice> list = sqlSessionTemplate.selectList("noticeMapper.selectList",paging);
		return (ArrayList<Notice>)list;
	}

}
