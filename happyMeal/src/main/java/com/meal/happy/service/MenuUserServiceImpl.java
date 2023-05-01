package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.meal.happy.dao.MenuUserDAO;
import com.meal.happy.dto.MenuUserDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeDTO;

@Service
public class MenuUserServiceImpl implements MenuUserService {
	@Inject
	MenuUserDAO dao;
	@Override
	public int menuTotalRecord_user(PagingVO vo) {
		return dao.menuTotalRecord_user(vo);
	}

	@Override
	public List<MenuUserDTO> pageSelect_user(PagingVO vo) {
		return dao.pageSelect_user(vo);
	}

	@Override
	public MenuUserDTO menuSelect(int menu_no) {
		return dao.menuSelect(menu_no);
	}

	@Override
	public void menuHitCount(int menu_no) {
		dao.menuHitCount(menu_no);
	}

	@Override
	public int menuInsert(MenuUserDTO dto) {
		return dao.menuInsert(dto);
	}

	@Override
	public int menuDelete(MenuUserDTO dto) {
		return dao.menuDelete(dto);
	}


	
	
}
