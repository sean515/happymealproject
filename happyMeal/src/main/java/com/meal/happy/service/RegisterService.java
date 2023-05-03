package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.dto.ResCommentDTO;

public interface RegisterService {
	public RegisterDTO loginOk(String userid, String userpwd);
	public int idCheck(String userid);
	public int registerInsert(RegisterDTO dto);
	public String idSearch(String username, String email);
	public String pwSearch(String userid, String email);
	public int updateTempPw(RegisterDTO dto);

}
