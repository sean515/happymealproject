package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.CommCommentDTO;



public interface CommCommentService {

	public int commcommentInsert(CommCommentDTO dto);

	public List<CommCommentDTO> commcommentListSelect(int comm_no);

	public int commcommentUpdate(CommCommentDTO dto);

	public int commcommentDelete(int comm_comment_no, String userid);
	
	public int count_comment_hit(CommCommentDTO dto);



}
