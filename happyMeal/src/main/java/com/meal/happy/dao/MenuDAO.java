package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.MenuDTO;
import com.meal.happy.dto.PagingVO;

public interface MenuDAO {

	//총레코드 수
	public int menuTotalRecord(PagingVO vo);
	//해당 페이지 선택
	public List<MenuDTO> pageSelect(PagingVO vo);
}
