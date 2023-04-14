package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.RegisterDTO;

public interface RegisterService {
	public RegisterDTO loginOk(String userid, String userpwd);
	public int idCheckCount(String userid);
	public int registerInsert(RegisterDTO dto);
	public RegisterDTO registerEdit(String userid);
	public int registerEditOk(RegisterDTO dto);
	public String idSearch(String username, String email);
	public String registerEditPopup(String userpwd);
}
