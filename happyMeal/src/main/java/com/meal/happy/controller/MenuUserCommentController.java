package com.meal.happy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.MenuUserCommentDTO;
import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.service.MenuUserCommentService;



@RestController
public class MenuUserCommentController {
	@Autowired
	MenuUserCommentService service;

	//댓글쓰기 form

	@PostMapping("/menucommentSend")
	public String menuconnentSend(MenuUserCommentDTO dto, HttpServletRequest request) {
		
		dto.setIp(request.getRemoteAddr());//ip
		dto.setUserid((String)request.getSession().getAttribute("logId"));
		int result = service.menucommentInsert(dto);

		return result+"";
	}


	//댓글 수 조회
	@GetMapping("/menu_count_comment_hit")
	public MenuUserCommentDTO count_comment_hit(MenuUserCommentDTO dto) {
		System.out.println(dto.toString());
		ModelAndView mav = new ModelAndView();
		dto.setMenu_comment_hit(service.count_comment_hit(dto));
		System.out.println(dto.toString());
		System.out.println("123");
		mav.addObject("dto",dto);
		System.out.println(mav);
		System.out.println("dto:"+dto);
		return dto;
	}


	//댓글목록
	@GetMapping("/menucommentList")//원글 글번호
	public List<MenuUserCommentDTO> menucommentList(int menu_no) {
		System.out.println("no->"+menu_no);
		//List<CommentDTO> list = service.commentListSelect(no);
		//System.out.println("size="+ list.size());
		//return list;
		System.out.println("댓글 목록"+service.menucommentListSelect(menu_no));
		return service.menucommentListSelect(menu_no);
	}


	//댓글수정
	@PostMapping("/menucommentEdit")
	public String commcommentEdit(MenuUserCommentDTO dto, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
		int result = service.menucommentUpdate(dto);
		System.out.println("123"+String.valueOf(result));
		return String.valueOf(result);
	}
	//댓글삭제
	@GetMapping("/menucommentDelete")
	public String menucommentDelete(int menu_comment_no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		return String.valueOf(service.menucommentDelete(menu_comment_no, userid));
	}
}
