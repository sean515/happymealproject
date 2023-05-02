package com.meal.happy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.ResDTO;
import com.meal.happy.dto.ResEditDTO;
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
		System.out.print(vo.toString());
		
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
	
	//식당정보 수정 요청
	@PostMapping("resEditReq")
	@ResponseBody
	public int resEditReq(ResEditDTO edto, HttpServletRequest request) {
		//로그인한 아이디 구하기
		edto.setUserid((String)request.getSession().getAttribute("logId"));
		//DB등록될 시 1
		int result = service.resEditInsert(edto);
		
		return result;
	}
	
	//식당업데이트 요청
	@GetMapping("/resUpdateReq")
	public ModelAndView resUpdateReq() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("res/resUpdateReq");
		return mav;
	}
	
	//식당업데이트 요청 등록(DB)
	@PostMapping("/resUpdateOk")
	public ModelAndView resUpdateOk(ResDTO dto, HttpServletRequest request){ 
		dto.setIp(request.getRemoteAddr());//ip
		dto.setUserid((String)request.getSession().getAttribute("logId"));//로그인한 아이디 구하기
		
		ModelAndView mav = new ModelAndView();
		System.out.println(dto.toString());
		int result = service.resReqInsert(dto);
		
		if(result>0) {//요청성공시 - 식당메인으로 이동
			mav.setViewName("redirect:res");
		}else {//요청실패시
			mav.addObject("msg", "요청 실패하였습니다");
			mav.setViewName("res/requestResult");
		}
		return mav;
	}
	
	//베스트 식당 페이지
	@GetMapping("resBestTop")
	public ModelAndView resBestTop(String res_type, String res_category) {
		ModelAndView mav = new ModelAndView();
		
		List<ResDTO> list = null;
		if(res_type != null) {
			list = service.resBestTypeSelect(res_type);
		} else if(res_category != null) {
			list = service.resBestCategorySelect(res_category);
		}
		
		mav.addObject("list", list);
		mav.setViewName("res/resBestTop");
		
		return mav;
	}

	
	
	//현재 좋아요 상태
	@GetMapping("/resLike")
	@ResponseBody
	public LikeVO resLike(int res_no, HttpSession session ,LikeVO like) {
		
		like.setUserid((String)session.getAttribute("logId"));
		like.setRes_no(res_no);
		int result = service.findLike(like);
		
		like.setResult(result);
		return like;
	}
	
	//현재 좋아요 취소
	@GetMapping("/delResLike")
	@ResponseBody
	public LikeVO delResLike(int res_no, HttpSession session ,LikeVO like) {
		
		like.setUserid((String)session.getAttribute("logId"));
		like.setRes_no(res_no);
		int result = service.delResLike(like);
		
		like.setResult(result);
		return like;
	}
	
	//현재 좋아요 등록
	@GetMapping("/resLikeup")
	@ResponseBody
	public LikeVO resLikeup(int res_no, HttpSession session ,LikeVO like) {
		
		like.setUserid((String)session.getAttribute("logId"));
		like.setRes_no(res_no);
		int result = service.resLikeUp(like);
		
		like.setResult(result);
		return like;
	}

	//좋아요 수 조회
	@GetMapping("/res_count_like_hit")
	@ResponseBody
	public LikeVO count_like_hit(LikeVO vo) {
		ModelAndView mav = new ModelAndView();
		vo.setRes_like_hit(service.count_like_hit(vo));
		mav.addObject("vo",vo);
		return vo;
	}	
	
	
}
