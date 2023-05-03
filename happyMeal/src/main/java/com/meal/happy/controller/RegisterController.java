package com.meal.happy.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	
	@Autowired
	JavaMailSenderImpl mailSender;
	
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
			session.setAttribute("logNickname", dto.getNickname());			
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
	//회원가입 ok
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
	@PostMapping("idSearch")
	@ResponseBody
	public String idSearch(RegisterDTO dto) {
		//이름과 이메일 일치하는 회원의 아이디
		String userid = service.idSearch(dto.getUsername(), dto.getEmail());
		if(userid==null || userid.equals("")) {//아이디 없으면 존재하지 않는 정보
			return "N";
		}else {//아이디가 있으면
			return userid;
		}
	 
	}
	//비밀번호 찾기 폼
		@GetMapping("/pwSearchForm")
		public String pwSearchForm() {
			return "register/pwSearchForm";
		}
	
	//비밀번호 찾기
	@PostMapping("pwSearchEmailSend")
	@ResponseBody
	public String pwSearchEmailSend(RegisterDTO dto) {
		
		//아이디와 이메일이 일치하는 회원의 비밀번호
		String userpwd = service.pwSearch(dto.getUserid(), dto.getEmail());
		if(userpwd==null || userpwd.equals("")) {//비밀번호 없으면 존재하지 않는 정보
			return "N";
		}else {//비밀번호가 있으면
			//임시비밀번호 설정
			String tempPw = "";
			for(int i=0; i<12; i++) {
				tempPw += (char)((Math.random()*26)+97);
			}
			//임시 비밀번호를 담고
			dto.setUserpwd(tempPw);
			//임시 비밀번호로 DB update
			service.updateTempPw(dto);
			
			//임시 비밀번호를 이메일로 보내고 메일보냈다는 정보를 알려준다.
			String emailSubject = "비밀번호 찾기 결과";
			String emailContent = "<div style='background:pink; margin:50px; padding:50px; border:2px solid gray; font-size:2em; text-align:center;'>";
			emailContent += "임시비밀번호입니다. 로그인 후 비밀번호를 변경해 주세요.<br/>";
			emailContent += "임시비밀번호 : <b>"+tempPw+"</b>";
			emailContent += "</div>";
			
			
			String email = dto.getEmail();
			try {
				//mimeMessage -> mimeMessageHelper
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				
				//보내는 메일주소
				messageHelper.setFrom("tlgjs4169@naver.com");//본인 네이버 이메일 입력
				messageHelper.setTo(email);
				messageHelper.setSubject(emailSubject);
				messageHelper.setText("text/html; charset=UTF-8", emailContent);
				
				mailSender.send(message);//보내기
				return "Y";
			}catch(Exception e) {
				e.printStackTrace();
				return "N";
			}
		}
	}
	
	
	
	
	@GetMapping("/index.html")
	public String adminForm() {
		return "resources/index.html";
	}
}
