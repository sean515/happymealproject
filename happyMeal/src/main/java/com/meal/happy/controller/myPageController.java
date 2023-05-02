package com.meal.happy.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.AudioSystem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.CommCommentDTO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.MenuUserCommentDTO;
import com.meal.happy.dto.MenuUserDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.dto.SupDTO;
import com.meal.happy.service.RecipeService;
import com.meal.happy.service.myPageService;

@Controller
public class myPageController {
	@Autowired
	myPageService service;

	// 마이페이지 폼 - session 로그인 아이디에 해당하는 회원정보 select하여 뷰페이지로 이동
	@GetMapping("/myPage")
	public ModelAndView myPage(HttpSession session) {
		RegisterDTO dto = service.myPage((String) session.getAttribute("logId"));
		CommDTO cdto = service.selectComm((String) session.getAttribute("logId"));
		CommCommentDTO co_codto = service.selectCommComment((String) session.getAttribute("logId"));
		
		RecipeDTO rdto = service.selectRecipe((String) session.getAttribute("logId"));
		RecipeCommentDTO re_redto = service.selectRecipeComment((String) session.getAttribute("logId"));
		System.out.println(re_redto);
		MenuUserDTO mdto = service.selectMenu((String) session.getAttribute("logId"));
		MenuUserCommentDTO me_medto = service.selectMenuComment((String) session.getAttribute("logId"));
		
		SupDTO sdto = service.selectSup((String) session.getAttribute("logId"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("cdto", cdto);
		mav.addObject("rdto", rdto);
		mav.addObject("sdto", sdto);
		mav.addObject("co_codto", co_codto);
		mav.addObject("re_redto", re_redto);
		mav.addObject("me_medto", me_medto);
		mav.addObject("mdto", mdto);
	    
		System.out.println(mav);
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
	public ModelAndView recipeList_user(PagingVO vo, HttpSession session, Integer cate) {
		System.out.println(vo);
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String) session.getAttribute("logId"));
		//레시피
		if (Objects.equals(cate, 1) || cate == null) {
		vo.setTotalRecord(service.recipeTotalRecord_user(vo));
		mav.addObject("list",service.pageSelect_user(vo));
		}
		//식단
		if (Objects.equals(cate, 2)) {
		vo.setTotalRecord(service.menuTotalRecord_user(vo));
		mav.addObject("list",service.menu_pageSelect_user(vo));
		}
		
		if (Objects.equals(cate, 3)) {
			vo.setTotalRecord(service.totalRecord(vo));
			mav.addObject("list",service.pageSelect(vo));
		}
		mav.addObject("vo", vo);//뷰페이지로 페이지정보 셋팅.
		
		mav.setViewName("myPage/userWrite");
		return mav;
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
	
	//bmi계산하러가기
	@GetMapping("/myPage/checkBmi")
	public String checkBmi() {
		return "myPage/checkBmi";
	}
	
	@RequestMapping(value="/myPage/bmicheck", method={RequestMethod.POST, RequestMethod.GET} )
	@ResponseBody
	public ResponseEntity<Map<String, Object>> calculateBMI(int height, int weight, double exercise, HttpSession session) {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		RegisterDTO dto = service.myPage((String) session.getAttribute("logId")); //세션에서 유저 아이디가져오기
		String userid = dto.getUserid();
		String username = dto.getUsername();
		String gender = dto.getGender();
		String Age = dto.getAge();

		String birthYear = Age.substring(0, 2); // 생년 (97)
		String birthMonth = Age.substring(3, 5); // 생월 (02)
		String birthDay = Age.substring(6, 8); // 생일 (14)

		int currentYear = LocalDate.now().getYear(); // 현재년도 (2023)
		int currentMonth = LocalDate.now().getMonthValue(); // 현재월 (4)
		int currentDay = LocalDate.now().getDayOfMonth(); // 현재일 (22)

		int age = currentYear - (Integer.parseInt(birthYear) + 1900) - 1;
		if (currentMonth > Integer.parseInt(birthMonth)) {
		    age++;
		} else if (currentMonth == Integer.parseInt(birthMonth) && currentDay >= Integer.parseInt(birthDay)) {
		    age++;
		}

		System.out.println("age="+age);
		
		
		System.out.println(exercise);
	    if (height <= 0 || weight <= 0) { // 키나 몸무게가 0 이하일 경우
	    	resultMap.put("error", "N");

	    	return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.BAD_REQUEST);
	    }
	    double bmi = weight / ((height / 100.0) * (height / 100.0)); // BMI 계산
	    
	    String standardBmi;
	    if (bmi < 18.5) {
	    	standardBmi = "저체중";
	    } else if (bmi < 23) {
	    	standardBmi = "정상체중";
	    } else if (bmi < 25) {
	    	standardBmi = "과체중";
	    } else if (bmi < 30) {
	    	standardBmi = "경도비만";
	    } else if (bmi < 35) {
	    	standardBmi = "중등도비만";
	    } else {
	    	standardBmi = "고도비만";
	    }

	    double kal = 0.0;
	    System.out.println("gender"+gender);
	    if(gender.equals("여성")) {
	        kal = (665.1 + (9.56 * weight) + (1.85 * height) - (4.68 * age))*exercise;
	    } else if(gender.equals("남성")) {
	        kal = (66.47 + (13.75 * weight) + (5 * height) - (6.76 * age))*exercise;
	    } else {    
	        resultMap.put("error", "N");

	        return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.BAD_REQUEST);
	    }
	    
	    service.updateBMIAndKal(userid, bmi, kal, standardBmi);
	    
	    resultMap.put("username", username);
	    System.out.println(username);
	    resultMap.put("bmi", String.format("%.2f", bmi));
	    resultMap.put("standardBmi", standardBmi);
	    resultMap.put("kal", String.format("%.2f", kal));
	    
	    // myPage 컨트롤러에서 다시 해당 사용자 정보를 조회하여 dto 객체에 반영
	    dto = service.myPage((String) session.getAttribute("logId"));

	    // dto 객체를 ModelAndView에 추가하여 myPage 뷰에서 사용할 수 있도록 함
	    ModelAndView mav=new ModelAndView();
	    mav.addObject("dto", dto);
	    
	    dto.setKal(kal);
	    dto.setBmi(bmi);
	    dto.setStandardBmi(standardBmi);
	    
	    
	    
	    System.out.println(dto.toString());
	    myPage(session);
	    
	    return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}
	
}