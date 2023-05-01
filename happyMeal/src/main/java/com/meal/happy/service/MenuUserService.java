package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.MenuDTO;
import com.meal.happy.dto.MenuUserDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;


public interface MenuUserService {
	public int menuInsert(MenuUserDTO dto);
	public int menuTotalRecord_user(PagingVO vo);
	public List<MenuUserDTO> pageSelect_user(PagingVO vo);
	public MenuUserDTO menuSelect(int menu_no);
	public void menuHitCount(int menu_no);
	public int menuDelete(MenuUserDTO dto);

}
