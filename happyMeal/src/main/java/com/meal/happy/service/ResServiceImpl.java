package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.ResDAO;
import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;
import com.meal.happy.dto.ResEditDTO;

@Service
public class ResServiceImpl implements ResService {
	@Inject
	ResDAO dao;

	@Override
	public int resTotalRecord(PagingVO vo) {
		return dao.resTotalRecord(vo);
	}

	@Override
	public List<ResDTO> resPageSelect(PagingVO vo) {
		return dao.resPageSelect(vo);
	}

	@Override
	public void resHitCount(int res_no) {
		dao.resHitCount(res_no);
	}

	@Override
	public ResDTO resSelect(int res_no) {
		return dao.resSelect(res_no);
	}

	@Override
	public int resEditInsert(ResEditDTO dto) {
		return dao.resEditInsert(dto);
	}

	@Override
	public int resReqInsert(ResDTO dto) {
		return dao.resReqInsert(dto);
	}

	@Override
	public int findLike(LikeVO like) {
		return dao.findLike(like);
	}

	@Override
	public int delResLike(LikeVO like) {
		return dao.delResLike(like);
	}

	@Override
	public int resLikeUp(LikeVO like) {
		return dao.resLikeUp(like);
	}

	@Override
	public int count_like_hit(LikeVO vo) {
		return dao.count_like_hit(vo);
	}



	
}
