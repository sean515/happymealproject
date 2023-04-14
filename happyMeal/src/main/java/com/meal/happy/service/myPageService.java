package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.RegisterDTO;

public interface myPageService {
	public RegisterDTO registerEdit(String userid);
	public int registerEditOk(RegisterDTO dto);
	public String registerEditPopup(String userpwd);
	public RegisterDTO myPage(String attribute);
}
