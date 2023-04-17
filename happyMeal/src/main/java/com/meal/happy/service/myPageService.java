package com.meal.happy.service;

import com.meal.happy.dto.RegisterDTO;

public interface myPageService {
	public RegisterDTO registerEdit(String userid);
	public int registerEditOk(RegisterDTO dto);
	public int registerEditPopup(RegisterDTO dto);
	public RegisterDTO myPage(String userid);
	RegisterDTO registerEditPopup(String userpwd);
	public RegisterDTO checkPasswordOk(String userid, String userpwd);
	public RegisterDTO checkPassword(String userid, String userpwd);
}
