package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.LikeVO;
import com.meal.happy.dto.MenuDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;

public interface MenuDAO {

	//총레코드 수
	public int menuTotalRecord(PagingVO vo);
	//해당 페이지 선택
	public List<MenuDTO> pageSelect(PagingVO vo);
	//조회수 증가
	public void menuHitCount(int amenu_type_no, int amenu_name);
	//글 선택(no)
	public List<MenuDTO> menuSelect(int amenu_type_no, int amenu_name);
	//좋아요 상태
	public int findLike(LikeVO like);
	public int delMenuLike(LikeVO like);
	public int menuLikeUp(LikeVO like);
	public int count_like_hit(LikeVO dto);
}
