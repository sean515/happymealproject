package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.SupDTO;

public interface SupService {
	public int supTotalRecord();
	public List<SupDTO> supAllSelect();
	public int supInsert(SupDTO dto);
	public int hitCount(int sup_no);
	public SupDTO supSelect(int sup_no);
	public SupDTO replyDataSelect(int sup_no);
	public int stepUp(SupDTO orgDataDTO);
	public int replyWrite(SupDTO dto);
	public SupDTO getsupSelect(int sup_no);
	public int supUpdate(SupDTO dto);
	public int getLevel(int sup_no);
	public int supDelete(int sup_no);
	public int supDeleteUpdate(int sup_no);
}
