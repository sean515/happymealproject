package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.CommCommentDTO;
import com.meal.happy.dto.PagingVO;



public interface CommCommentDAO {

	//댓글등록
	public int commcommentInsert(CommCommentDTO dto);
	//댓글목록
	public List<CommCommentDTO> commcommentListSelect(int comm_no);
	//댓글 수정
	public int commcommentUpdate(CommCommentDTO dto);
	//댓글 삭제
	public int commcommentDelete(int comm_comment_no, String userid);
	
	//댓글 수
	public int count_comment_hit(CommCommentDTO dto);
	
}
