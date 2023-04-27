package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.ResCommentDTO;

public interface ResCommentDAO {
	
	//댓글등록
	public int resCommentInsert(ResCommentDTO dto);
	//댓글 목록
	public List<ResCommentDTO> resCommentListSelect(int res_no);
	//댓글 수정
	public int resCommentUpdate(ResCommentDTO dto);
	//댓글 삭제
	public int resCommentDel(int res_comment_no, String userid);
	//댓글 수
	public int resCommentCount(ResCommentDTO dto);
}
