package com.meal.happy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;
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
	
	
	//레시피 내용 보기
	
	@GetMapping("/recipeView")
	public ModelAndView recipeView(int recipe_no, PagingVO vo) {
		
		//조회수 증가
		service.recipeHitCount(recipe_no);
		System.out.println("1"+recipe_no);
		//글 선택
		RecipeDTO dto = service.recipeSelect(recipe_no);
		ModelAndView mav = new ModelAndView();
		System.out.println("3"+dto);
		mav.addObject("dto", dto);	//선택한 레코드
		mav.addObject("vo", vo);	//페이지번호, 검색어, 검색키
		System.out.println("4"+dto);
		mav.setViewName("recipe/recipeView");
		
		System.out.println(dto.toString());

		return mav;
	}
	
	
}
