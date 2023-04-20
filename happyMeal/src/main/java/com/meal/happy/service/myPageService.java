package com.meal.happy.service;

import com.meal.happy.dto.CommCommentDTO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.dto.SupDTO;

public interface myPageService {
	public RegisterDTO registerEdit(String userid);
	public int registerEditOk(RegisterDTO dto);
	public int registerEditPopup(RegisterDTO dto);
	public RegisterDTO myPage(String userid);
	RegisterDTO registerEditPopup(String userpwd);
	public RegisterDTO checkPasswordOk(String userid, String userpwd);
	public RegisterDTO checkPassword(String userid, String userpwd);

	public CommDTO selectComm(String userid);
	public RecipeDTO selectRecipe (String userid);
	public CommCommentDTO selectCommComment (String userid);
	//public RecipeCommentDTO selectRecipeComment  (String userid);
	public SupDTO selectSup (String userid);
}
