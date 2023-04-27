package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;



public interface CommService {
	public int commInsert(CommDTO dto);

	public int totalRecord(PagingVO vo);

	public List<CommDTO> pageSelect(PagingVO vo);

	public CommDTO commSelect(int comm_no);

	public CommDTO commEditSelect(int comm_no);

	public int commUpdate(CommDTO dto);

	public void commHitCount(int comm_no);

	public int commDelete(CommDTO dto);

	public int commMultiLineDelete(List<Integer> noList);
	
	public int findLike(LikeVO like);
	
	public int delCommLike(LikeVO like);

	public int commLikeUp(LikeVO like);

}
