package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.MenuUserDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;


public interface MenuUserDAO {
	//글등록
	public int menuInsert(MenuUserDTO dto);
	//전체 게시글 수
	public int menuTotalRecord_user(PagingVO vo);
	//게시글 해당 페이지 선택
	public List<MenuUserDTO> pageSelect_user(PagingVO vo);
	//글 선택(no)
	public MenuUserDTO menuSelect(int menu_no);
	//조회수 증가
	public void menuHitCount(int menu_no);
	//글 삭제
	public int menuDelete(MenuUserDTO dto);
	//글 선택 수정
	public MenuUserDTO menuEditSelect(int menu_no);
	//글 수정(DB update)
	public int menuUpdate(MenuUserDTO dto);

}

