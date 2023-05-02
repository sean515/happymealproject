package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;
import com.meal.happy.dto.ResEditDTO;

public interface ResDAO {
	
	//총 레코드 수
	public int resTotalRecord(PagingVO vo);
	//해당 페이지 선택
	public List<ResDTO> resPageSelect(PagingVO vo);
	//식당 선택
	public ResDTO resSelect (int res_no);
	//조회수 증가
	public void resHitCount(int res_no);
	//정보수정 요청
	public int resEditInsert(ResEditDTO dto);
	//식당추가 요청
	public int resReqInsert(ResDTO dto);
	
	//베스트식당
	public List<ResDTO> resBestTypeSelect(String res_type);
	public List<ResDTO> resBestCategorySelect(String res_category);
	
	//좋아요
	public int findLike(LikeVO like);
	public int delResLike(LikeVO like);
	public int resLikeUp(LikeVO like);
	public int count_like_hit(LikeVO vo);
}
