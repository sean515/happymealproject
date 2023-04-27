package com.meal.happy.controller;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.service.CommService;


@RestController
public class CommController {
	@Autowired
	CommService service;

	@GetMapping("/comm_List")
	public ModelAndView commList(PagingVO vo) {
		System.out.println(vo.toString());

		ModelAndView mav = new ModelAndView();
		vo.setTotalRecord(service.totalRecord(vo));

		System.out.println(vo.toString());
		//DB 조회
		//해당 페이지 조회하기
		mav.addObject("list",service.pageSelect(vo));

		mav.addObject("vo", vo);//뷰페이지로 페이지정보 셋팅.

		mav.setViewName("comm/comm_List");

		System.out.println(mav);

		return mav;
	}

	//글쓰기 form
		@GetMapping("/commWrite")
		public ModelAndView commWrite()	{
			ModelAndView mav = new ModelAndView();
			mav.setViewName("comm/commWrite");
			return mav;
		}
		//글쓰기(DB등록)
		@PostMapping("/commWriteOk")
		//						form		 ip(request), 글쓴이(session)
		public ResponseEntity<String> commWriteOk(CommDTO dto, HttpServletRequest request) {
			dto.setIp(request.getRemoteAddr());//ip
			dto.setUserid((String)request.getSession().getAttribute("logId"));//로그인한 아이디 구하기.
			System.out.println((String)request.getSession().getAttribute("logId"));
			//글등록 시 에러가 발생하면
			String htmlTag = "<script>";
			try {
				int result = service.commInsert(dto);
				htmlTag += "location.href='comm_List'";
			}catch(Exception e) {
				e.printStackTrace();
				htmlTag += "alert('글이 등록되지 않았습니다.')";
				htmlTag += "history.back();";

			}
			htmlTag += "</script>";

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text", "html",Charset.forName("UTF-8")));
			headers.add("Content-Type","text/html; charset=UTF-8");

			return new ResponseEntity<String>(htmlTag, headers, HttpStatus.OK);
			//결과

		}

		//내용 변경이 있으면ResponseEntity 없으면ModelAndView
		//글 내용 보기
		@GetMapping("/commView")
		public ModelAndView commView(int comm_no, PagingVO vo) {

			//조회수 증가
			service.commHitCount(comm_no);
			System.out.println("1"+comm_no);
			CommDTO dto = service.commSelect(comm_no);
			System.out.println("2"+dto);
			ModelAndView mav = new ModelAndView();
			System.out.println("3"+dto);
			mav.addObject("dto", dto);	//선택한 레코드
			mav.addObject("vo", vo);	//페이지번호, 검색어, 검색키
			System.out.println("4"+dto);
			mav.setViewName("comm/commView");

			System.out.println(dto.toString());

			return mav;
		}
		//삭제
		@GetMapping("/commDel")
		public ModelAndView CommDel(CommDTO dto, PagingVO vo, HttpSession session) {
			dto.setUserid((String)session.getAttribute("logId"));

			int result = service.commDelete(dto);

			ModelAndView mav = new ModelAndView();

			mav.addObject("nowPage", vo.getNowPage());
			if(vo.getSearchWord()!=null) {
				mav.addObject("searchKey", vo.getSearchKey());
				mav.addObject("searchWord", vo.getSearchWord());
			}

			if(result>0) {// 삭제시 리스트로 이동
				mav.setViewName("redirect:comm_List");
			}else {//삭제 실패 시 글내용 보기로 이동
				mav.addObject("no", dto.getComm_no());
				mav.setViewName("redirect:commView");
			}
			return mav;
		}

		//수정폼
		@GetMapping("/commEdit")
		public ModelAndView commEdit(int comm_no, PagingVO vo) {

			CommDTO dto = service.commEditSelect(comm_no);

			// "  " ' '
			String Comm_text = dto.getComm_title().replaceAll("\"", "&quot;");	//" \"
			Comm_text.replaceAll("'", "&#39");	//" \"
			System.out.println(Comm_text);
			dto.setComm_text(Comm_text);

			ModelAndView mav = new ModelAndView();
			mav.addObject("dto", dto);	//선택한 레코드
			mav.addObject("vo", vo);	//페이지번호, 검색어, 검색키

			mav.setViewName("comm/commEdit");

			return mav;
		}
		//수정(DB update)
		@PostMapping("/commEditOk")
		public ResponseEntity<String> commEditOk(CommDTO dto, PagingVO vo, HttpSession session) {
			//no레코드 번호, 로그인 아이디가 같을 때 업데이트
			dto.setUserid((String)session.getAttribute("logId"));
			String bodyTag = "<script>";
			try {
				service.commUpdate(dto);
				// loaction.href='commView?no=12&nowPage=2
				bodyTag += "location.href='commView?comm_no="+dto.getComm_no() +"&nowPage="+vo.getNowPage();
				if(vo.getSearchWord()!=null) {//검색어가 있을 때
					bodyTag += "&searchKey="+vo.getSearchKey()+"&searchWord="+vo.getSearchWord();
				}
				bodyTag+="';";

			}catch(Exception e) {
				e.printStackTrace();
				//수정실패
				bodyTag += "alert('게시판 글수정에 실패하였습니다.');";
				bodyTag += "history.back();";
			}

			bodyTag += "</script>";

			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
			headers.add("Content-Type", "text/html; charset=UTF-8");

			ResponseEntity<String> entity = new ResponseEntity<String>(bodyTag, headers, HttpStatus.OK);

			return entity;
		}
		
		//현재 좋아요 상태
				@GetMapping("/commlike")
					public LikeVO commlike(int comm_no, HttpSession session ,LikeVO like) {
					
					like.setUserid((String)session.getAttribute("logId"));
					like.setComm_no(comm_no);
					System.out.println("like"+like);
					int result = service.findLike(like);
					
					like.setResult(result);
					return like;
				}
		//현재 좋아요 취소
				@GetMapping("/delcommlike")
					public LikeVO delcommlike(int comm_no, HttpSession session ,LikeVO like) {
					
					like.setUserid((String)session.getAttribute("logId"));
					like.setComm_no(comm_no);
					System.out.println("like"+like);
					int result = service.delCommLike(like);
					
					like.setResult(result);
					return like;
				}
				//현재 좋아요 등록
				@GetMapping("/commlikeup")
					public LikeVO commlikeup(int comm_no, HttpSession session ,LikeVO like) {
					
					like.setUserid((String)session.getAttribute("logId"));
					like.setComm_no(comm_no);
					System.out.println("like"+like);
					int result = service.commLikeUp(like);
					
					like.setResult(result);
					return like;
				}
}
