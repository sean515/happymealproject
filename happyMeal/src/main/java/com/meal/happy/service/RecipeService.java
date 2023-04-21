package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.PagingVO;



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
}
