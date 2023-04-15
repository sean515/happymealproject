package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.SupDAO;
import com.meal.happy.dto.SupDTO;

@Service
public class SupServiceImpl implements SupService {
	@Inject
	SupDAO dao;
	
	@Override
	public int supTotalRecord() {
		return dao.supTotalRecord();
	}

	
	@Override
	public List<SupDTO> supAllSelect() {
		return dao.supAllSelect();
	}

	@Override
	public int supInsert(SupDTO dto) {
		return dao.supInsert(dto);
	}

	@Override
	public int hitCount(int sup_no) {
		return dao.hitCount(sup_no);
	}

	@Override
	public SupDTO supSelect(int sup_no) {
		return dao.supSelect(sup_no);
	}

	@Override
	public SupDTO replyDataSelect(int sup_no) {
		return dao.replyDataSelect(sup_no);
	}

	@Override
	public int stepUp(SupDTO orgDataDTO) {
		return dao.stepUp(orgDataDTO);
	}

	@Override
	public int replyWrite(SupDTO dto) {
		return dao.replyWrite(dto);
	}

	@Override
	public SupDTO getsupSelect(int sup_no) {
		return dao.getsupSelect(sup_no);
	}

	@Override
	public int supUpdate(SupDTO dto) {
		return dao.supUpdate(dto);
	}

	@Override
	public int getLevel(int sup_no) {
		return dao.getLevel(sup_no);
	}

	@Override
	public int supDelete(int sup_no) {
		return dao.supDelete(sup_no);
	}

	@Override
	public int supDeleteUpdate(int sup_no) {
		return dao.supDeleteUpdate(sup_no);
	}
	

}
