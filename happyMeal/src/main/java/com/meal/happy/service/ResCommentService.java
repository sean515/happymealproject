package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.ResCommentDTO;

public interface ResCommentService {
	public int resCommentInsert(ResCommentDTO dto);
	public List<ResCommentDTO> resCommentListSelect(int res_no);
	public int resCommentUpdate(ResCommentDTO dto);
	public int resCommentDel(int res_comment_no, String userid);
	public int resCommentCount(ResCommentDTO dto);
}
