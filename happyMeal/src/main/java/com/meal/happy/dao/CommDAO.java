package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;

public interface CommDAO {
	//글등록
	public int commInsert(CommDTO dto);
	//총레코드 수
	public int totalRecord(PagingVO vo);
	//해당 페이지 선택
	public List<CommDTO> pageSelect(PagingVO vo);
	//글 선택(no)
	public CommDTO commSelect(int comm_no);
	//글 선택 수정
	public CommDTO commEditSelect(int comm_no);
	//글 수정(DB update)
	public int commUpdate(CommDTO dto);
	//조회수 증가
	public void commHitCount(int comm_no);
	//글 삭제
	public int commDelete(CommDTO dto);
	//여러 글 한번에 삭제
	public int commMultiLineDelete(List<Integer> noList);
	//좋아요 상태
	public int findLike(LikeVO like);
	public int delCommLike(LikeVO like);
	public int commLikeUp(LikeVO like);
}
