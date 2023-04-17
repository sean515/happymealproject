package com.meal.happy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.CommCommentDTO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.service.CommCommentService;





@RestController
public class CommCommentController {
	@Autowired
	CommCommentService service;
	
	//글쓰기 form		
	
	@PostMapping("/commcommentSend")
	public String commconnentSend(CommCommentDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());//ip
		dto.setUserid((String)request.getSession().getAttribute("logId"));
		
		int result = service.commcommentInsert(dto);
		
		return result+"";
	}
	

	//댓글 수 조회
	@GetMapping("/count_comment_hit")
	public CommCommentDTO count_comment_hit(CommCommentDTO dto) {
		System.out.println("!23");
		System.out.println(dto.toString());
		ModelAndView mav = new ModelAndView();
		dto.setComm_comment_hit(service.count_comment_hit(dto));
		System.out.println(dto.toString());
		System.out.println("123");
		mav.addObject("dto",dto);
		System.out.println(mav);
		System.out.println("dto:"+dto);
		return dto;
	}
	
	//댓글목록
	@GetMapping("/commcommentList")//원글 글번호
	public List<CommCommentDTO> commcommentList(int comm_no) {
		System.out.println("no->"+comm_no);
		//List<CommentDTO> list = service.commentListSelect(no);
		//System.out.println("size="+ list.size());
		//return list;
		System.out.println("댓글 목록"+service.commcommentListSelect(comm_no));
		return service.commcommentListSelect(comm_no);
	}
	
	
	//댓글수정
	@PostMapping("/commcommentEdit")
	public String commcommentEdit(CommCommentDTO dto, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
		int result = service.commcommentUpdate(dto);
		System.out.println("123"+String.valueOf(result));
		return String.valueOf(result); 
	}
	//댓글삭제
	@GetMapping("/commcommentDelete")
	public String commcommentDelete(int comm_comment_no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		return String.valueOf(service.commcommentDelete(comm_comment_no, userid));
	}
}
