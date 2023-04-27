package com.meal.happy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.ResCommentDTO;
import com.meal.happy.service.ResCommentService;

@RestController
public class ResCommentController {
	@Autowired
	ResCommentService service;
	
	//댓글등록
	@PostMapping("/resCommentSend")
	public String resCommentSend(ResCommentDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());//ip
		dto.setUserid((String)request.getSession().getAttribute("logId"));
		
		int result = service.resCommentInsert(dto);
		
		return result+"";
	}
	
	//댓글 수 조회
	@GetMapping("/resCommentCount")
	public ResCommentDTO resCommentCount(ResCommentDTO dto) {
		ModelAndView mav = new ModelAndView();
		dto.setResCommentCount(service.resCommentCount(dto));
		mav.addObject("dto",dto);
		return dto;
	}

	//댓글목록
	@GetMapping("/resCommentList")            //원글 글번호
	public List<ResCommentDTO> resCommentList(int res_no) {
		return service.resCommentListSelect(res_no);
	}


	//댓글수정
	@PostMapping("/resCommentEdit")
	public String resCommentEdit(ResCommentDTO dto, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
		int result = service.resCommentUpdate(dto);
		return String.valueOf(result);
	}
	
	//댓글삭제
	@GetMapping("/resCommentDel")
	public String resCommentDel(int res_comment_no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		return String.valueOf(service.resCommentDel(res_comment_no, userid));
	}	
}
