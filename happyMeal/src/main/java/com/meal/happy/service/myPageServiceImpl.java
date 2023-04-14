package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.RegisterDAO;
import com.meal.happy.dto.RegisterDTO;

@Service
public class myPageServiceImpl implements myPageService {
	//객체생성
	//    @AutoWired, @Inject : interface를 객체로 생성
	@Inject
	RegisterDAO dao;

	@Override
	public RegisterDTO registerEdit(String userid) {
		return dao.registerEdit(userid);
	}

	@Override
	public int registerEditOk(RegisterDTO dto) {
		return dao.registerEditOk(dto);
	}

	@Override
	public String registerEditPopup(String userpwd) {
		return null;
	}

	@Override
	public RegisterDTO myPage(String attribute) {
		return null;
	}
	
	

}
