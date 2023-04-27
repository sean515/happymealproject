package com.meal.happy.dao;

import java.util.List;

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
}
