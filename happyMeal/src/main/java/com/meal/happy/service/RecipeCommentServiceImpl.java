package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.RecipeCommentDAO;
import com.meal.happy.dto.RecipeCommentDTO;







@Service
public class RecipeCommentServiceImpl implements RecipeCommentService {
	@Inject
	RecipeCommentDAO dao;

	@Override
	public int recipecommentInsert(RecipeCommentDTO dto) {
		return dao.recipecommentInsert(dto);
	}

	@Override
	public List<RecipeCommentDTO> recipecommentListSelect(int recipe_no) {
		return dao.recipecommentListSelect(recipe_no);
	}

	@Override
	public int recipecommentUpdate(RecipeCommentDTO dto) {
		return dao.recipecommentUpdate(dto);
	}

	@Override
	public int recipecommentDelete(int recipe_comment_no, String userid) {
		return dao.recipecommentDelete(recipe_comment_no, userid);
	}

	@Override
	public int count_comment_hit(RecipeCommentDTO dto) {
		return dao.count_comment_hit(dto);
	}

}
