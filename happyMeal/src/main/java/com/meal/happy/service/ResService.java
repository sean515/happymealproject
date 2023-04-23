package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;

public interface ResService {
	
	public int resTotalRecord(PagingVO vo);
	public List<ResDTO> resPageSelect(PagingVO vo);
	public void resHitCount(int res_no);
	public ResDTO resSelect (int res_no);
}
