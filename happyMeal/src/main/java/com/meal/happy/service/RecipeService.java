package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.RegisterDTO;



public interface RecipeService {

	public int recipeInsert(RecipeDTO dto);
	public int recipeTotalRecord(PagingVO vo);
	public int recipeTotalRecord_user(PagingVO vo);
	public List<RecipeDTO> pageSelect_user(PagingVO vo);

	public List<RecipeDTO> pageSelect(PagingVO vo);
	public RecipeDTO recipeSelect(int recipe_no);
	public RecipeDTO recipeEditSelect(int recipe_no);
	public int recipeUpdate(RecipeDTO dto);
	public void recipeHitCount(int recipe_no);
	public int recipeDelete(RecipeDTO dto);
	
	public RegisterDTO myInfo(String userid);

	public int findLike(LikeVO like);
	public int delRecipeLike(LikeVO like);
	public int recipeLikeUp(LikeVO like);
	public int count_like_hit(LikeVO dto);

}
