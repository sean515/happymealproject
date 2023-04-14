package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.CommentDTO;


public interface CommentService {

	public int commentInsert(CommentDTO dto);

	public List<CommentDTO> commentListSelect(int no);

	public int commentUpdate(CommentDTO dto);

	public int commentDelete(int c_no, String userid);

}
