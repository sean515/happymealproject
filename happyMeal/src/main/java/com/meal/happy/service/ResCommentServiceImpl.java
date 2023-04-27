package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.ResCommentDAO;
import com.meal.happy.dto.ResCommentDTO;

@Service
public class ResCommentServiceImpl implements ResCommentService {
	@Inject
	ResCommentDAO dao;

	@Override
	public int resCommentInsert(ResCommentDTO dto) {
		return dao.resCommentInsert(dto);
	}

	@Override
	public List<ResCommentDTO> resCommentListSelect(int res_no) {
		return dao.resCommentListSelect(res_no);
	}

	@Override
	public int resCommentUpdate(ResCommentDTO dto) {
		return dao.resCommentUpdate(dto);
	}

	@Override
	public int resCommentDel(int res_comment_no, String userid) {
		return dao.resCommentDel(res_comment_no, userid);
	}

	@Override
	public int resCommentCount(ResCommentDTO dto) {
		return dao.resCommentCount(dto);
	}
	
}
