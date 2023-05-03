package com.meal.happy.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.ReportDTO;
import com.meal.happy.service.ReportService;

@Controller
public class ReportController {
	@Autowired
	ReportService service;
	
	// 신고 팝업창 띄우기
	@GetMapping("/reportForm")
	public ModelAndView reportForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("report/reportForm");
		return mav;
	}
	
	// 신고 등록(DB)
	@PostMapping("reportSend")
	public ModelAndView reportSend(ReportDTO dto, HttpServletRequest request) {
		dto.setUserid((String)request.getSession().getAttribute("logId"));
		
		ModelAndView mav = new ModelAndView();
		int result = service.reportInsert(dto);
		
		if(result>0) {
			mav.addObject("msg", "신고가 등록되었습니다.");
			mav.setViewName("report/reportOkResult");
		}else {
			mav.addObject("msg", "신고 등록에 실패하였습니다.");
			mav.setViewName("report/reportOkResult");
		}
		
		return mav;
		
	}
	
	
}
