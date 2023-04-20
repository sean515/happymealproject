package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.RegisterDAO;
import com.meal.happy.dto.RegisterDTO;

@Service
public class RegisterServiceImpl implements RegisterService {
	//객체생성
	//    @AutoWired, @Inject : interface를 객체로 생성
	@Inject
	RegisterDAO dao;
	
	@Override
	public RegisterDTO loginOk(String userid, String userpwd) {
		return dao.loginOk(userid, userpwd);
	}

	@Override
	public int idCheck(String userid) {
		return dao.idCheck(userid);
	}

	@Override
	public int registerInsert(RegisterDTO dto) {
		return dao.registerInsert(dto);
	}

	@Override
	public String idSearch(String username, String email) {
		return dao.idSearch(username, email);
	}

	@Override
	public String pwSearch(String userid, String email) {
		return dao.pwSearch(userid, email);
	}

	@Override
	public int updateTempPw(RegisterDTO dto) {
		return dao.updateTempPw(dto);
	}

}
