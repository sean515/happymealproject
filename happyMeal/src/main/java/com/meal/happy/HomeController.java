package com.meal.happy;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@RequestMapping(value="/", produces="application/text;charset=UTF-8")
	public String home() {

		return "index";
	}
	
}
