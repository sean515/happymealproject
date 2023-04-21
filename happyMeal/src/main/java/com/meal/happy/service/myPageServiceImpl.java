package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.RegisterDAO;
import com.meal.happy.dto.CommCommentDTO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.dto.SupDTO;

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
	public RegisterDTO registerEditPopup(String userid) {
		return dao.registerEditPopup(userid, userid);
	}

	@Override
	public RegisterDTO myPage(String userid) {
		return dao.myPage(userid);
	}

	@Override
	public int registerEditPopup(RegisterDTO dto) {
		return 0;
	}

	@Override
	public RegisterDTO checkPasswordOk(String userid, String userpwd) {
		return dao.checkPasswordOk(userid, userpwd);
	}

	@Override
	public RegisterDTO checkPassword(String userid, String userpwd) {
		return dao.checkPassword(userid, userpwd);
	}

	@Override
	public CommDTO selectComm(String userid) {
		return dao.selectComm(userid);
	}

	@Override
	public RecipeDTO selectRecipe(String userid) {
		return dao.selectRecipe(userid);
	}

	
	 @Override public CommCommentDTO selectCommComment(String userid) { 
		 return dao.selectCommComment(userid);
	 }
	  
	 /* @Override public RecipeCommentDTO selectRecipeComment(String userid) { return
	 * dao.selectRecipeComment(userid); }
	 */

	@Override
	public SupDTO selectSup(String userid) {
		return dao.selectSup(userid);
	}

	@Override
	public void updateBMI(String userid, double bmi) {
		dao.updateBMI(userid, bmi);
	}

	

	

	

	
	
	

}
