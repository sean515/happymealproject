package com.meal.happy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.service.HomeService;
import com.meal.happy.service.MenuService;
import com.meal.happy.service.RecipeService;
import com.meal.happy.service.ResService;


@Controller
public class HomeController {
	@Autowired HomeService service;
	@Autowired RecipeService rservice;
	@Autowired MenuService mservice;
	@Autowired ResService resservice;
	
	
	@RequestMapping(value="/", produces="application/text;charset=UTF-8")
	public ModelAndView home(RecipeDTO rdto) {
		PagingVO rvo= new PagingVO();
		PagingVO mvo= new PagingVO();
		PagingVO resvo= new PagingVO();
		
		rvo.setTotalRecord(rservice.recipeTotalRecord(rvo));
		mvo.setTotalRecord(mservice.menuTotalRecord(mvo));
		resvo.setTotalRecord(resservice.resTotalRecord(resvo));
		ModelAndView mav= new ModelAndView();
		mav.addObject("list",service.hotRecipe(rdto));
		mav.addObject("rdto",rdto);
		mav.addObject("rvo",rvo);
		mav.addObject("mvo",mvo);
		mav.addObject("resvo",resvo);
		mav.setViewName("index");
		return mav;
	}
	
}
