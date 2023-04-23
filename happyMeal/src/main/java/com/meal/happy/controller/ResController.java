package com.meal.happy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;
import com.meal.happy.service.ResService;

@Controller
public class ResController {
	@Autowired
	ResService service;
	
	//식당페이지
	@GetMapping("/res")
	public ModelAndView resList(PagingVO vo) {
		ModelAndView mav = new ModelAndView();
		vo.setTotalRecord(service.resTotalRecord(vo));
		
		//레코드 찍히는지 확인
		System.out.println(vo.toString());
		
		//DB조회
		//해당 페이지 조회하기
		mav.addObject("list", service.resPageSelect(vo));
		mav.addObject("vo", vo);
		mav.setViewName("res/res");
		
		return mav;
	}
	
	//식당 상세페이지
	@GetMapping("/resView")
	public ModelAndView resView(int res_no, PagingVO vo) {
		
		//조회수 증가
		service.resHitCount(res_no);
		//식당 선택
		ResDTO dto = service.resSelect(res_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto); //선택한 레코드
		mav.addObject("vo", vo);
		mav.setViewName("res/resView");
		
		return mav;
	}
}
