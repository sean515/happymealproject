package com.meal.happy.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import com.meal.happy.dto.DataFileDTO;
import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.service.RecipeService;

@Controller
public class RecipeController {
	@Autowired RecipeService service;

	//레시피 유저 리스트
	@GetMapping("/recipe_user")
	public ModelAndView recipeList_user(PagingVO vo) {
		System.out.println(vo);
		ModelAndView mav = new ModelAndView();
		vo.setTotalRecord(service.recipeTotalRecord_user(vo));

		System.out.println(vo.toString());
		//DB 조회
		//해당 페이지 조회하기
		mav.addObject("list",service.pageSelect_user(vo));

		mav.addObject("vo", vo);//뷰페이지로 페이지정보 셋팅.

		mav.setViewName("recipe/recipe_user");
		System.out.println(vo);
		System.out.println(mav);
		System.out.println(vo);
		return mav;
	}

	//레시피 글 리스트
	@GetMapping("/recipe")
	public ModelAndView recipeList(PagingVO vo, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		vo.setTotalRecord(service.recipeTotalRecord(vo));
		
		RegisterDTO dto = service.myInfo((String) session.getAttribute("logId"));

		System.out.println(vo.toString());
		//DB 조회
		//해당 페이지 조회하기
		mav.addObject("list",service.pageSelect(vo));

		mav.addObject("vo", vo);//뷰페이지로 페이지정보 셋팅.
		mav.addObject("dto", dto);
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
	public ResponseEntity<String> recipeWriteOk(RecipeDTO dto, HttpServletRequest request, MultipartHttpServletRequest mRequest) throws Exception {
		dto.setIp(request.getRemoteAddr());//ip
		dto.setUserid((String)request.getSession().getAttribute("logId"));//로그인한 아이디 구하기
		
		
		MultipartFile mFile = dto.getRecipe_thumbnail2();
		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadfile"); // 파일이 저장될 경로
		String originalFileName = mFile.getOriginalFilename(); // 원본 파일 이름	
		String savedFileName = UUID.randomUUID().toString() + "_" + originalFileName; // 저장될 파일 이름
		dto.setRecipe_thumbnail(savedFileName);
		File file = new File(uploadPath + File.separator + savedFileName);
	    mFile.transferTo(file);
	    
		//글등록시 실패하면 예외발생
	    

		String htmlTag = "<script>";
		try {
			int result = service.recipeInsert(dto);
			htmlTag += "location.href='recipe_user'";

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
	//글 내용 보기_user
	@GetMapping("/recipeView_user")
	public ModelAndView recipeView_user(int recipe_no, PagingVO vo) {

		//조회수 증가
		service.recipeHitCount(recipe_no);
		//글 선택
		RecipeDTO dto = service.recipeSelect(recipe_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);	//선택한 레코드
		mav.addObject("vo", vo);	//페이지번호, 검색어, 검색키
		mav.setViewName("recipe/recipeView_user");

		System.out.println(dto.toString());

		return mav;
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
	public ResponseEntity<String> recipeEditOk(RecipeDTO dto, PagingVO vo, HttpServletRequest request, MultipartHttpServletRequest mRequest) throws Exception{
		//recipe_no레코드 번호, 로그인 아이디가 같을때 업데이트
		dto.setUserid((String)request.getSession().getAttribute("logId"));//로그인한 아이디 구하기
		
		dto.setIp(request.getRemoteAddr());//ip
		
		MultipartFile mFile = dto.getRecipe_thumbnail2();
		String uploadPath = request.getSession().getServletContext().getRealPath("/uploadfile"); // 파일이 저장될 경로
		String originalFileName = mFile.getOriginalFilename(); // 원본 파일 이름	
		String savedFileName = UUID.randomUUID().toString() + "_" + originalFileName; // 저장될 파일 이름
		dto.setRecipe_thumbnail(savedFileName);
		File file = new File(uploadPath + File.separator + savedFileName);
	    mFile.transferTo(file);
		
		
		String bodyTag = "<script>";
		try {
			service.recipeUpdate(dto);
			bodyTag += "location.href='recipe_user?recipe_no="+dto.getRecipe_no()+"&nowPage="+vo.getNowPage();
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
			mav.setViewName("redirect:recipe_user");
		}else {//삭제실패시 글내용보기로 이동
			mav.addObject("recipe_no", dto.getRecipe_no());
			mav.setViewName("redirect:recipeView_user");

		}
		return mav;
	}
	//현재 좋아요 상태
	@GetMapping("/recipelike")
	@ResponseBody
		public LikeVO recipelike(int recipe_no, HttpSession session ,LikeVO like) {
		
		like.setUserid((String)session.getAttribute("logId"));
		like.setRecipe_no(recipe_no);
		System.out.println("like"+like);
		int result = service.findLike(like);
		
		like.setResult(result);
		System.out.println("tt"+result);
		System.out.println("like2"+like);
		return like;
	}
//현재 좋아요 취소
	@GetMapping("/delrecipelike")
	@ResponseBody
		public LikeVO delcommlike(int recipe_no, HttpSession session ,LikeVO like) {
		
		like.setUserid((String)session.getAttribute("logId"));
		like.setRecipe_no(recipe_no);
		System.out.println("like"+like);
		int result = service.delRecipeLike(like);
		
		like.setResult(result);
		return like;
	}
	//현재 좋아요 등록
	@GetMapping("/recipelikeup")
	@ResponseBody
		public LikeVO commlikeup(int recipe_no, HttpSession session ,LikeVO like) {
		
		like.setUserid((String)session.getAttribute("logId"));
		like.setRecipe_no(recipe_no);
		System.out.println("like"+like);
		int result = service.recipeLikeUp(like);
		
		like.setResult(result);
		return like;
	}
	//댓글 수 조회
	@GetMapping("/recipe_count_like_hit")
	@ResponseBody
	public LikeVO count_comment_hit(LikeVO dto) {
		System.out.println(dto.toString());
		ModelAndView mav = new ModelAndView();
		dto.setRecipe_like_hit(service.count_like_hit(dto));
		System.out.println(dto.toString());
		System.out.println("123");
		mav.addObject("dto",dto);
		System.out.println(mav);
		System.out.println("dto:"+dto);
		return dto;
	}
}
