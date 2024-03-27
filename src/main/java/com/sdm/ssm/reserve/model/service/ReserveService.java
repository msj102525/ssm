package com.sdm.ssm.reserve.model.service;

import com.sdm.ssm.reserve.model.vo.Reserve;

public interface ReserveService {

	int insertReserve(Reserve reserve);

	int updateReserve(Reserve reserve);

	int deleteReserve(Reserve reserve);

	Reserve selectRsrvDetail(Reserve reserve);

}
