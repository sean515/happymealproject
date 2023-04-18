package com.meal.happy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.PagingVO;
import com.meal.happy.service.RecipeService;

@Controller
public class RecipeController {
	@Autowired RecipeService service;
	
	@GetMapping("/recipe")
	public ModelAndView commList(PagingVO vo) {
		
		ModelAndView mav = new ModelAndView();
		vo.setTotalRecord(service.recipeTotalRecord(vo));

		System.out.println(vo.toString());
		//DB 조회
		//해당 페이지 조회하기
		mav.addObject("list",service.pageSelect(vo));

		mav.addObject("vo", vo);//뷰페이지로 페이지정보 셋팅.

		mav.setViewName("recipe/recipe");
		
		System.out.println(mav);
		
		return mav;
	}
	
	
	
}
