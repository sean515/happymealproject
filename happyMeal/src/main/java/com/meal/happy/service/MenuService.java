package com.meal.happy.service;

import java.util.List;

import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.MenuDTO;
import com.meal.happy.dto.PagingVO;



public interface MenuService {

	public int menuTotalRecord(PagingVO vo);
	public List<MenuDTO> pageSelect(PagingVO vo);
	public void menuHitCount(int amenu_type_no, int amenu_name);
	public List<MenuDTO> menuSelect(int amenu_type_no, int amenu_name);
}
