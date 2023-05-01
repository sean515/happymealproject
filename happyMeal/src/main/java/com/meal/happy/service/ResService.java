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
	
	public List<ResDTO> resBestTypeSelect(String res_type);
	public List<ResDTO> resBestCategorySelect(String res_category);
	
	public int findLike(LikeVO like);
	public int delResLike(LikeVO like);
	public int resLikeUp(LikeVO like);
	public int count_like_hit(LikeVO vo);
}
