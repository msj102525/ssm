package com.sdm.ssm.employee.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.employee.model.dao.RecordTimeDao;

@Service
public class RecordTimeServiceImpl implements RecordTimeService{
	
	@Autowired
	private RecordTimeDao recordTimeDao;
}
