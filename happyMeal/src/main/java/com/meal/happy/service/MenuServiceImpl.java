package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.MenuDAO;
import com.meal.happy.dto.MenuDTO;
import com.meal.happy.dto.PagingVO;

@Service
public class MenuServiceImpl implements MenuService {
	@Inject
	MenuDAO dao;

	@Override
	public int menuTotalRecord(PagingVO vo) {
		return dao.menuTotalRecord(vo);
	}

	@Override
	public List<MenuDTO> pageSelect(PagingVO vo) {
		// TODO Auto-generated method stub
		return dao.pageSelect(vo);
	}

	@Override
	public void menuHitCount(int amenu_type_no, int amenu_name) {
		dao.menuHitCount(amenu_type_no, amenu_name);
	}

	@Override
	public List<MenuDTO> menuSelect(int amenu_type_no, int amenu_name) {
		return dao.menuSelect(amenu_type_no, amenu_name);
	}



}
