package com.sdm.ssm.employee.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.employee.model.dao.CalendarDao;

@Service("CalendarService")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private CalendarDao calendDao;
}
