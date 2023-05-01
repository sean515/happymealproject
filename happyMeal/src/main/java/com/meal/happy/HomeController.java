package com.meal.happy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.service.HomeService;


@Controller
public class HomeController {
	@Autowired HomeService service;
	
	@RequestMapping(value="/", produces="application/text;charset=UTF-8")
	public ModelAndView home(RecipeDTO rdto) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("list",service.hotRecipe(rdto));
		mav.addObject("rdto",rdto);
		mav.setViewName("index");
		System.out.println("테스트용"+mav);
		return mav;
	}
	
}
