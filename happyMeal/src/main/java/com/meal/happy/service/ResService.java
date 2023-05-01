package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;
import com.meal.happy.dto.ResEditDTO;

public interface ResService {
	
	public int resTotalRecord(PagingVO vo);
	public List<ResDTO> resPageSelect(PagingVO vo);
	public void resHitCount(int res_no);
	public ResDTO resSelect (int res_no);
	public int resEditInsert(ResEditDTO dto);
	public int resReqInsert(ResDTO dto);
	
	public int findLike(LikeVO like);
	public int delResLike(LikeVO like);
	public int resLikeUp(LikeVO like);
}
