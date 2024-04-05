package com.sdm.ssm.reserve.model.service;

import java.util.ArrayList;

import com.sdm.ssm.admin.model.vo.Notice;
import com.sdm.ssm.common.SerachDateStr;
import com.sdm.ssm.reserve.model.vo.DateData;
import com.sdm.ssm.reserve.model.vo.Reserve;
import com.sdm.ssm.reserve.model.vo.ScheduleDto;

public interface ReserveService {

	int insertReserve(Reserve reserve);

	int updateReserve(Reserve reserve);

	int deleteReserve(Reserve reserve);

	//// 예약 내용 조회-상세
	Reserve selectRsrvDetail(Reserve reserve);
	
	/// 예약목록 조회
	ArrayList<Reserve> selectRsrvList(SerachDateStr serachDateStr);
	
	ArrayList<Reserve> selectRsrvList2(SerachDateStr serachDateStr);
	
	//달력 추가
	ArrayList<ScheduleDto> selectScheduleList(DateData dateData);

	//스케쥴 count
	int before_schedule_add_search(ScheduleDto scheduleDto);

	//스케쥴 update
	int update(ScheduleDto scheduleDto);

	//스케쥴 삭제
	int delete(ScheduleDto scheduleDto);

	//스케쥴 조회
	ScheduleDto selectReserveget(int idx);



}
