package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.RecipeDAO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.PagingVO;

@Service
public class RecipeServiceImpl implements RecipeService {
	@Inject
	RecipeDAO dao;

	@Override
	public int recipeInsert(RecipeDTO dto) {
		return dao.recipeInsert(dto);
	}

	@Override
	public int recipeTotalRecord(PagingVO vo) {
		return dao.recipeTotalRecord(vo);
	}

	@Override
	public List<RecipeDTO> pageSelect(PagingVO vo) {
		return dao.pageSelect(vo);
	}

	@Override
	public RecipeDTO recipeSelect(int recipe_no) {
		return dao.recipeSelect(recipe_no);
	}

	@Override
	public RecipeDTO recipeEditSelect(int recipe_no) {
		return dao.recipeEditSelect(recipe_no);
	}

	@Override
	public int recipeUpdate(RecipeDTO dto) {
		return dao.recipeUpdate(dto);
	}

	@Override
	public void recipeHitCount(int recipe_no) {
		dao.recipeHitCount(recipe_no);
	}

	@Override
	public int recipeDelete(RecipeDTO dto) {
		return dao.recipeDelete(dto);
	}


	
	

}
