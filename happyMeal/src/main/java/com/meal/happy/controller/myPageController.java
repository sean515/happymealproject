package com.meal.happy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.service.myPageService;

@Controller
public class myPageController {
	@Autowired
	myPageService service;

	// 마이페이지 폼 - session 로그인 아이디에 해당하는 회원정보 select하여 뷰페이지로 이동
	@GetMapping("/myPage")
	public ModelAndView myPage(HttpSession session) {
		RegisterDTO dto = service.myPage((String) session.getAttribute("logId"));

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("myPage/myPage");
		return mav;
	}

	// 개인정보 수정 폼 - session 로그인 아이디에 해당하는 회원정보 select하여 뷰페이지로 이동
	@GetMapping("/myPage/registerEdit")
	public ModelAndView registerEdit(HttpSession session) {
		RegisterDTO dto = service.registerEdit((String) session.getAttribute("logId"));

		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("myPage/registerEdit");
		return mav;
	}

	// 회원정보 수정(DB) - form의 내용과 session의 로그인 아이디를 구하여 회원정보를 수정한다.
	@PostMapping("/myPage/registerEditOk")
	public ModelAndView registerEditOk(RegisterDTO dto, HttpSession session) {
		dto.setUserid((String) session.getAttribute("logId"));
		System.out.println(dto.toString());
		int cnt = service.registerEditOk(dto);
		
		ModelAndView mav = new ModelAndView();
		if (cnt > 0) {// 수정성공시 -> DB에서 수정된 내용을 보여주고
			mav.setViewName("redirect:/myPage");
		} else {// 수정실패시 -> 이전페이지 (알림)
			mav.addObject("msg", "회원 정보 수정 실패하였습니다.");
			mav.setViewName("myPage/registerOkResult");
		}
		return mav;
	}
	
	// 개인정보 수정 폼 가기 전 비밀번호 체크
	@GetMapping("/myPage/checkPassword")
	public ModelAndView CheckPasswordForm(String userid, String userpwd, HttpServletRequest request, HttpSession session) {
		RegisterDTO dto = service.checkPassword((String) session.getAttribute("logId"), userpwd);
		// System.out.println(dto.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("myPage/checkPassword");
		// System.out.println(mav);
		return mav;
	}

	// 비밀번호 체킹 폼
	@PostMapping("/myPage/checkPasswordOk")
	public ModelAndView checkPasswordOk(String userid, String userpwd, HttpServletRequest request, HttpSession session) {
		//Session 객체 얻어오기
		//매개변수로 HttpServletRequest request -> Session 구하기
		//매개변수로 HttpSession session
		
		RegisterDTO dto = service.checkPasswordOk(userid, userpwd);
		//dto -> null인 경우 선택레코드가 없다. - 로그인 실패
		//       null이 아닌 경우 선택레코드 있다. - 로그인 성공
		ModelAndView mav = new ModelAndView();
		if(dto!=null) {//인증 성공
			session.setAttribute("logId", dto.getUserid());
			session.setAttribute("logName", dto.getUsername());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:registerEdit");
		}else {//로그인실패
			mav.addObject("msg", "비밀번호를 잘못 입력하였습니다.");
			mav.setViewName("myPage/registerOkResult");
		}
		return mav;
	}
	
	// 즐겨찾는 식당
	@GetMapping("/myPage/userLikeRes")
	public String userLikeResForm() {
		return "myPage/userLikeRes";
	}

	// 즐겨찾는 식단
	@GetMapping("/myPage/userLikeMenu")
	public String menuLikeListForm() {
		return "myPage/userLikeMenu";
	}

	// 즐겨찾는 레시피
	@GetMapping("/myPage/userLikeRecipe")
	public String recipeLikeListForm() {
		return "myPage/userLikeRecipe";
	}

	// 내가 작성한 글
	@GetMapping("/myPage/userWrite")
	public String userWriteForm() {
		return "myPage/userWrite";
	}

	// 내가 작성한 댓글
	@GetMapping("/myPage/userWriteReply")
	public String userWriteReplyForm() {
		return "myPage/userWriteReply";
	}

	// 식당 정보 업데이트
	@GetMapping("/myPage/userResUpdate")
	public String userResUpdateForm() {
		return "myPage/userResUpdate";
	}

	// 문의사항
	@GetMapping("/myPage/userSupView")
	public String userSupViewForm() {
		return "myPage/userSupView";
	}

	
}