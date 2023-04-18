package com.meal.happy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.service.RegisterService;

@Controller
public class RegisterController {
	@Autowired
	RegisterService service;
	
	//로그인폼
	@GetMapping("/loginForm")
	public String login() {
		return "register/loginForm"; //WEB-INF/views/register/loginForm.jsp
	}
	//로그인(DB)
	@PostMapping("/loginOk")
	public ModelAndView loginOk(String userid, String userpwd, HttpServletRequest request, HttpSession session) {
		//Session 객체 얻어오기
		//매개변수로 HttpServletRequest request -> Session 구하기
		//매개변수로 HttpSession session
		
		RegisterDTO dto = service.loginOk(userid, userpwd);
		//dto -> null인 경우 선택레코드가 없다. - 로그인 실패
		//       null이 아닌 경우 선택레코드 있다. - 로그인 성공
		ModelAndView mav = new ModelAndView();
		if(dto!=null) {//로그인 성공
			session.setAttribute("logId", dto.getUserid());
			session.setAttribute("logName", dto.getUsername());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");
		}else {//로그인실패
			mav.setViewName("redirect:loginForm");
		}
		return mav;
	}
	//로그아웃 - 세션제거
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	//회원가입 폼
	@GetMapping("/join")
	public String join() {
		return "register/join";
	}
	//아이디 중복검사
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) {
		int cnt = service.idCheck(userid);
		return cnt;
	}
	
	@RequestMapping(value="/joinOk", method=RequestMethod.POST)
	public ModelAndView joinOk(RegisterDTO dto) {
		System.out.println(dto.toString());
		
		ModelAndView mav = new ModelAndView();
		//회원가입
		int result = service.registerInsert(dto);
		
		if(result>0) {//회원가입 성공시 - 로그인폼을 이동
			mav.setViewName("redirect:loginForm");
		}else {//회원가입 실패시
			mav.addObject("msg", "회원등록실패하였습니다.");
			mav.setViewName("register/joinOkResult");
		}
		return mav;
	}
	//아이디 찾기 폼
	@GetMapping("/idSearchForm")
	public String idSearchForm() {
		return "register/idSearchForm";
	}
	//아이디 찾기
	
	@RequestMapping(value="/idSearch", method=RequestMethod.POST)
	 
	@ResponseBody public String idSearch(@RequestParam("username") String
	username,@RequestParam("email") String email) { String result =
	service.idSearch(username, email);
	 
	return result;
	 
	}
	 
	
	
	
	
	@GetMapping("/index.html")
	public String adminForm() {
		return "resources/index.html";
	}
}
