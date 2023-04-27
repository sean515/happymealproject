package com.meal.happy.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.MenuDTO;
import com.meal.happy.dto.MenuUserDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.service.MenuUserService;

@Controller
public class MenuUserController {
	@Autowired MenuUserService service;

	//식단 유저 리스트
	@GetMapping("/menu_user")
	public ModelAndView menu_userList(PagingVO vo) {
		ModelAndView mav = new ModelAndView();
		vo.setTotalRecord(service.menuTotalRecord_user(vo));		
		
		System.out.println(vo.toString());		
		
		mav.addObject("list",service.pageSelect_user(vo));
		mav.addObject("vo", vo);//뷰페이지로 페이지정보 셋팅.
		mav.setViewName("menu/menu_user");
		System.out.println(mav);
		
		return mav; 
	}
	
	//글쓰기form
		@GetMapping("/menuWrite_user")
		public ModelAndView recipeWrite()	{
			ModelAndView mav = new ModelAndView();
			mav.setViewName("menu/menuWrite");
			return mav;
		}

		//글쓰기(DB등록)
		@PostMapping("/menuWriteOk")
		public ResponseEntity<String> menuWriteOk(MenuUserDTO dto, HttpServletRequest request, MultipartHttpServletRequest mRequest) throws Exception {
			dto.setIp(request.getRemoteAddr());//ip
			dto.setUserid((String)request.getSession().getAttribute("logId"));//로그인한 아이디 구하기
			
			
			MultipartFile mFile = dto.getMenu_thumbnail2();
			String uploadPath = request.getSession().getServletContext().getRealPath("/uploadfile"); // 파일이 저장될 경로
			String originalFileName = mFile.getOriginalFilename(); // 원본 파일 이름	
			String savedFileName = UUID.randomUUID().toString() + "_" + originalFileName; // 저장될 파일 이름
			dto.setMenu_thumbnail(savedFileName);
			File file = new File(uploadPath + File.separator + savedFileName);
		    mFile.transferTo(file);
		    
			//글등록시 실패하면 예외발생
		    

			String htmlTag = "<script>";
			try {
				int result = service.menuInsert(dto);
				htmlTag += "location.href='menu_user'";

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
	
	@GetMapping("/menuView_user")
	public ModelAndView recipeView_user(int menu_no, PagingVO vo) {

		//조회수 증가
		service.menuHitCount(menu_no);
		//글 선택
		MenuUserDTO dto = service.menuSelect(menu_no);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);	//선택한 레코드
		mav.addObject("vo", vo);	//페이지번호, 검색어, 검색키
		mav.setViewName("menu/menuView_user");

		System.out.println(dto.toString());

		return mav;
	}
}
