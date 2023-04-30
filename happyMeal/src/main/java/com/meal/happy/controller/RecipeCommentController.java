package com.meal.happy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.service.RecipeCommentService;






@RestController
public class RecipeCommentController {
	@Autowired
	RecipeCommentService service;

	//댓글쓰기 form

	@PostMapping("/recipecommentSend")
	public String commconnentSend(RecipeCommentDTO dto, HttpServletRequest request) {
		dto.setIp(request.getRemoteAddr());//ip
		dto.setUserid((String)request.getSession().getAttribute("logId"));

		int result = service.recipecommentInsert(dto);

		return result+"";
	}


	//댓글 수 조회
	@GetMapping("/recipe_count_comment_hit")
	public RecipeCommentDTO count_comment_hit(RecipeCommentDTO dto) {
		System.out.println(dto.toString());
		ModelAndView mav = new ModelAndView();
		dto.setRecipe_comment_hit(service.count_comment_hit(dto));
		System.out.println(dto.toString());
		System.out.println("123");
		mav.addObject("dto",dto);
		System.out.println(mav);
		System.out.println("dto:"+dto);
		return dto;
	}

	//댓글목록
	@GetMapping("/recipecommentList")//원글 글번호
	public List<RecipeCommentDTO> recipecommentList(int recipe_no) {
		System.out.println("no->"+recipe_no);
		//List<CommentDTO> list = service.commentListSelect(no);
		//System.out.println("size="+ list.size());
		//return list;
		System.out.println("댓글 목록"+service.recipecommentListSelect(recipe_no));
		return service.recipecommentListSelect(recipe_no);
	}


	//댓글수정
	@PostMapping("/recipecommentEdit")
	public String commcommentEdit(RecipeCommentDTO dto, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
		int result = service.recipecommentUpdate(dto);
		System.out.println("123"+String.valueOf(result));
		return String.valueOf(result);
	}
	//댓글삭제
	@GetMapping("/recipecommentDelete")
	public String recipecommentDelete(int recipe_comment_no, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		return String.valueOf(service.recipecommentDelete(recipe_comment_no, userid));
	}
}
