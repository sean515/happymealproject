package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.MenuUserCommentDTO;



public interface MenuUserCommentService {

	//댓글등록
	public int menucommentInsert(MenuUserCommentDTO dto);
	//댓글목록
	public List<MenuUserCommentDTO> menucommentListSelect(int menu_no);
	//댓글 수정
	public int menucommentUpdate(MenuUserCommentDTO dto);
	//댓글 삭제
	public int menucommentDelete(int menu_comment_no, String userid);	
	//댓글 수
	public int count_comment_hit(MenuUserCommentDTO dto);

}
