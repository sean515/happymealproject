package com.meal.happy.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.service.RecipeService;

@Controller
public class RecipeController {
	@Autowired RecipeService service;
	
	//레시피 글 리스트
	@GetMapping("/recipe")
	public ModelAndView recipeList(PagingVO vo) {
		
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
	
	//글쓰기form
	@GetMapping("/recipeWrite")
	public ModelAndView recipeWrite()	{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recipe/recipeWrite");
		return mav;
	}
	
	//글쓰기(DB등록)
	@PostMapping("/recipeWriteOk")
	public ResponseEntity<String> recipeWriteOk(RecipeDTO dto, HttpServletRequest request) {
	dto.setIp(request.getRemoteAddr());//ip
		dto.setUserid((String)request.getSession().getAttribute("logId"));//로그인한 아이디 구하기
		//글등록시 실패하면 예외발생
		String htmlTag = "<script>";
		try {
			int result = service.recipeInsert(dto);
			htmlTag += "location.href='recipe'";
			
		}catch(Exception e) {
			
			htmlTag += "alert('글이 등록되지 않았습니다.');";
			htmlTag += "history.back();";
			e.printStackTrace();
		}
		htmlTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
		
	}
	
	//글 내용 보기
	@GetMapping("/recipeView")
	public ModelAndView recipeView(int recipe_no, PagingVO vo) {
		
		//조회수 증가
		service.recipeHitCount(recipe_no);
		//글 선택
		RecipeDTO dto = service.recipeSelect(recipe_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);	//선택한 레코드
		mav.addObject("vo", vo);	//페이지번호, 검색어, 검색키
		mav.setViewName("recipe/recipeView");
		
		System.out.println(dto.toString());

		return mav;
	}
	
	//수정폼
	@GetMapping("/recipeEdit")
	public ModelAndView recipeEdit(int recipe_no, PagingVO vo) {
		
		RecipeDTO dto = service.recipeEditSelect(recipe_no);
		
		String recipe_name = dto.getRecipe_name().replaceAll("\"", "&quot;"); //"
		recipe_name.replaceAll("'", "&#39;"); //'
		dto.setRecipe_name(recipe_name);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("vo", vo);
		
		mav.setViewName("recipe/recipeEdit");
		
		return mav;
	}
	
	//수정등록
	@PostMapping("/recipeEditOk")
	public ResponseEntity<String> recipeEditOk(RecipeDTO dto, PagingVO vo, HttpSession session) {
		//recipe_no레코드 번호, 로그인 아이디가 같을때 업데이트
		dto.setUserid((String)session.getAttribute("logId"));
		String bodyTag = "<script>";
		try {
			service.recipeUpdate(dto);
			bodyTag += "location.href='recipe?recipe_no="+dto.getRecipe_no()+"&nowPage="+vo.getNowPage();
			if(vo.getSearchWord()!=null) {//검색어가 있을때
				bodyTag += "&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord();
			}
			bodyTag += "';";
			
		}catch(Exception e) {
			e.printStackTrace();
			//수정실패
			bodyTag += "alert('게시판 글수정 실패하였습니다.');";
			bodyTag += "history.back();";
		}
		bodyTag += "</script>";
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		ResponseEntity<String> entity = new ResponseEntity<String>(bodyTag, headers, HttpStatus.OK);
		
		return entity;
	}
	
	//삭제
	@GetMapping("/recipeDel")
	public ModelAndView recipeDel(RecipeDTO dto, PagingVO vo, HttpSession session) {
		dto.setUserid((String)session.getAttribute("logId"));
		
		int result = service.recipeDelete(dto);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("nowPage", vo.getNowPage());
		if(vo.getSearchWord()!=null) {//검색어 있을때
			mav.addObject("searchKey", vo.getSearchKey());
			mav.addObject("searchWord", vo.getSearchWord());
		}
		if(result>0) {//삭제시 리스트로 이동
			mav.setViewName("redirect:recipe");
		}else {//삭제실패시 글내용보기로 이동
			mav.addObject("recipe_no", dto.getRecipe_no());
			mav.setViewName("redirect:recipeView");
	
		}
		return mav;
	}
}
