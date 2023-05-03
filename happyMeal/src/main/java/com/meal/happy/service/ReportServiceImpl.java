package com.meal.happy.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.ReportDAO;
import com.meal.happy.dto.ReportDTO;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Inject
	ReportDAO dao;

	@Override
	public int reportInsert(ReportDTO dto) {
		return dao.reportInsert(dto);
	}
}
