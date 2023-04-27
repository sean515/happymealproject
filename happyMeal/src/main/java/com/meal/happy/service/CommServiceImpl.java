package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.CommDAO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;

@Service
public class CommServiceImpl implements CommService {
	@Inject
	CommDAO dao;

	@Override
	public int commInsert(CommDTO dto) {
		return dao.commInsert(dto);
	}

	@Override
	public int totalRecord(PagingVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public List<CommDTO> pageSelect(PagingVO vo) {
		return dao.pageSelect(vo);
	}

	@Override
	public CommDTO commSelect(int comm_no) {
		return dao.commSelect(comm_no);
	}

	@Override
	public CommDTO commEditSelect(int comm_no) {
		return dao.commEditSelect(comm_no);
	}

	@Override
	public int commUpdate(CommDTO dto) {
		return dao.commUpdate(dto);
	}

	@Override
	public void commHitCount(int comm_no) {
		dao.commHitCount(comm_no);
	}

	@Override
	public int commDelete(CommDTO dto) {
		return dao.commDelete(dto);
	}

	@Override
	public int commMultiLineDelete(List<Integer> noList) {
		return dao.commMultiLineDelete(noList);
	}

	@Override
	public int findLike(LikeVO like) {
		return dao.findLike(like);
	}

	@Override
	public int delCommLike(LikeVO like) {
		return dao.delCommLike(like);
	}

	@Override
	public int commLikeUp(LikeVO like) {
		return dao.commLikeUp(like);
	}

}
