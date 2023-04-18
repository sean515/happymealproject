package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.RecipeCommentDTO;



public interface RecipeCommentService {

	public int recipecommentInsert(RecipeCommentDTO dto);
	public List<RecipeCommentDTO> recipecommentListSelect(int recipe_no);
	public int recipecommentUpdate(RecipeCommentDTO dto);
	public int recipecommentDelete(int recipe_comment_no, String userid);
	public int count_comment_hit(RecipeCommentDTO dto);

}
