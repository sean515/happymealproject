package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.ResDAO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;

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

	
}
