package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.RecipeDAO;
import com.meal.happy.dto.RecipeDTO;

@Service
public class HomeServiceImple implements HomeService {
	@Inject
	RecipeDAO dao;

	@Override
	public List<RecipeDTO> hotRecipe(RecipeDTO rdto) {
		return dao.hotRecipe(rdto);
	}
	
	

}
