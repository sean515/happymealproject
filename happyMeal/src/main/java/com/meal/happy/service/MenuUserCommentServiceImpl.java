package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.MenuUserCommentDAO;
import com.meal.happy.dao.RecipeCommentDAO;
import com.meal.happy.dto.MenuUserCommentDTO;
import com.meal.happy.dto.RecipeCommentDTO;







@Service
public class MenuUserCommentServiceImpl implements MenuUserCommentService {
	@Inject
	MenuUserCommentDAO dao;

	@Override
	public int menucommentInsert(MenuUserCommentDTO dto) {
		return dao.menucommentInsert(dto);
	}

	@Override
	public List<MenuUserCommentDTO> menucommentListSelect(int menu_no) {
		return dao.menucommentListSelect(menu_no);
	}

	@Override
	public int menucommentUpdate(MenuUserCommentDTO dto) {
		return dao.menucommentUpdate(dto);
	}

	@Override
	public int menucommentDelete(int menu_comment_no, String userid) {
		return dao.menucommentDelete(menu_comment_no, userid);
	}

	@Override
	public int count_comment_hit(MenuUserCommentDTO dto) {
		return dao.count_comment_hit(dto);
	}


}
