package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.CommCommentDAO;
import com.meal.happy.dto.CommCommentDTO;






@Service
public class CommCommentServiceImpl implements CommCommentService {
	@Inject
	CommCommentDAO dao;

	@Override
	public int commcommentInsert(CommCommentDTO dto) {
		return dao.commcommentInsert(dto);
	}

	@Override
	public List<CommCommentDTO> commcommentListSelect(int comm_no) {
		return dao.commcommentListSelect(comm_no);
	}

	@Override
	public int commcommentUpdate(CommCommentDTO dto) {
		return dao.commcommentUpdate(dto);
	}

	@Override
	public int commcommentDelete(int comm_comment_no, String userid) {
		return dao.commcommentDelete(comm_comment_no, userid);
	}

	@Override
	public int count_comment_hit(CommCommentDTO dto) {
		// TODO Auto-generated method stub
		return dao.count_comment_hit(dto);
	}




}
