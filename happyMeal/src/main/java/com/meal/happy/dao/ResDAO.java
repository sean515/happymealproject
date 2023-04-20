package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;

public interface ResDAO {
	
	//총 레코드 수
	public int resTotalRecord(PagingVO vo);
	//해당 페이지 선택
	public List<ResDTO> resPageSelect(PagingVO vo);
}
