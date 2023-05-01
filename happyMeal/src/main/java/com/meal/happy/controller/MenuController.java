package com.meal.happy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.MenuDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.service.MenuService;

@Controller
public class MenuController {
	@Autowired MenuService service;


	@GetMapping("/menu")
	public ModelAndView menuList(PagingVO vo) {		
		ModelAndView mav = new ModelAndView();
		vo.setTotalRecord(service.menuTotalRecord(vo));		
		System.out.println(vo.toString());
		//DB 조회
		//해당 페이지 조회하기
		mav.addObject("list",service.pageSelect(vo));
		mav.addObject("vo", vo);//뷰페이지로 페이지정보 셋팅.
		mav.setViewName("menu/menu");
		System.out.println(mav);
		
		return mav; 
	}
	
	//글 내용 보기
	@GetMapping("/menuView")
	public ModelAndView menuView(int amenu_type_no, int amenu_name) {

		//조회수 증가
		service.menuHitCount(amenu_type_no, amenu_name);
		//글 선택
		//MenuDTO dto = service.menuSelect(amenu_type_no ,amenu_name);
		ModelAndView mav = new ModelAndView();
		System.out.println("123");
		mav.addObject("list", service.menuSelect(amenu_type_no ,amenu_name));	//선택한 레코드
		System.out.println("456");
		mav.setViewName("menu/menuView");

		System.out.println("1233"+mav);

		return mav;
	}
	//현재 좋아요 상태
		@GetMapping("/menulike")
		@ResponseBody
			public LikeVO menulike(int menu_no, HttpSession session ,LikeVO like) {
			
			like.setUserid((String)session.getAttribute("logId"));
			like.setMenu_no(menu_no);
			System.out.println("like"+like);
			int result = service.findLike(like);
			
			like.setResult(result);
			System.out.println("tt"+result);
			System.out.println("like2"+like);
			return like;
		}
	//현재 좋아요 취소
		@GetMapping("/delmenulike")
		@ResponseBody
			public LikeVO delcommlike(int menu_no, HttpSession session ,LikeVO like) {
			
			like.setUserid((String)session.getAttribute("logId"));
			like.setMenu_no(menu_no);
			System.out.println("like"+like);
			int result = service.delMenuLike(like);
			
			like.setResult(result);
			return like;
		}
		//현재 좋아요 등록
		@GetMapping("/menulikeup")
		@ResponseBody
			public LikeVO commlikeup(int menu_no, HttpSession session ,LikeVO like) {
			
			like.setUserid((String)session.getAttribute("logId"));
			like.setMenu_no(menu_no);
			System.out.println("like"+like);
			int result = service.menuLikeUp(like);
			
			like.setResult(result);
			return like;
		}
		//좋아요 수 조회
		@GetMapping("/menu_count_like_hit")
		@ResponseBody
		public LikeVO count_comment_hit(LikeVO dto) {
			System.out.println(dto.toString());
			ModelAndView mav = new ModelAndView();
			dto.setMenu_like_hit(service.count_like_hit(dto));
			System.out.println(dto.toString());
			System.out.println("123");
			mav.addObject("dto",dto);
			System.out.println(mav);
			System.out.println("dto:"+dto);
			return dto;
		}
}
