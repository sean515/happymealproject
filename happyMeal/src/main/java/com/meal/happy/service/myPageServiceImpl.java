package com.meal.happy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.meal.happy.dao.RegisterDAO;
import com.meal.happy.dto.CommCommentDTO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.MenuUserCommentDTO;
import com.meal.happy.dto.MenuUserDTO;
import com.meal.happy.dto.PagingVO;
import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.dto.ReportDTO;
import com.meal.happy.dto.ResCommentDTO;
import com.meal.happy.dto.ResDTO;
import com.meal.happy.dto.ResEditDTO;
import com.meal.happy.dto.SupDTO;

@Service
public class myPageServiceImpl implements myPageService {
	//객체생성
	//    @AutoWired, @Inject : interface를 객체로 생성
	@Inject
	RegisterDAO dao;

	@Override
	public RegisterDTO registerEdit(String userid) {
		return dao.registerEdit(userid);
	}

	@Override
	public int registerEditOk(RegisterDTO dto) {
		return dao.registerEditOk(dto);
	}

	@Override
	public RegisterDTO registerEditPopup(String userid) {
		return dao.registerEditPopup(userid, userid);
	}

	@Override
	public RegisterDTO myPage(String userid) {
		return dao.myPage(userid);
	}

	@Override
	public int registerEditPopup(RegisterDTO dto) {
		return 0;
	}

	@Override
	public RegisterDTO checkPasswordOk(String userid, String userpwd) {
		return dao.checkPasswordOk(userid, userpwd);
	}

	@Override
	public RegisterDTO checkPassword(String userid, String userpwd) {
		return dao.checkPassword(userid, userpwd);
	}

	@Override
	public CommDTO selectComm(String userid) {
		return dao.selectComm(userid);
	}

	@Override
	public RecipeDTO selectRecipe(String userid) {
		return dao.selectRecipe(userid);
	}

	
	 @Override public CommCommentDTO selectCommComment(String userid) { 
		 return dao.selectCommComment(userid);
	 }
	  
	 /* @Override public RecipeCommentDTO selectRecipeComment(String userid) { return
	 * dao.selectRecipeComment(userid); }
	 */

	@Override
	public SupDTO selectSup(String userid) {
		return dao.selectSup(userid);
	}

	@Override
	public void updateBMIAndKal(String userid, double bmi, double kal, String standardBmi) {
		dao.updateBMIAndKal(userid, bmi, kal, standardBmi);
	}

	@Override
	public MenuUserDTO selectMenu(String userid) {
		return dao.selectMenu(userid);
	}

	@Override
	public RecipeCommentDTO selectRecipeComment(String userid) {
		return dao.selectRecipeComment(userid);
	}

	@Override
	public MenuUserCommentDTO selectMenuComment(String userid) {
		return dao.selectMenuComment(userid);
	}



	@Override
	public int recipeTotalRecord_user(PagingVO vo) {
		return dao.recipeTotalRecord_user(vo);
	}

	@Override
	public List<RecipeDTO> pageSelect_user(PagingVO vo) {
		return dao.pageSelect_user(vo);
	}

	@Override
	public int menuTotalRecord_user(PagingVO vo) {
		return dao.menuTotalRecord_user(vo);
	}

	@Override
	public List<MenuUserDTO> menu_pageSelect_user(PagingVO vo) {
		return dao.menu_pageSelect_user(vo);
	}

	@Override
	public int totalRecord(PagingVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public List<CommDTO> pageSelect(PagingVO vo) {
		return dao.pageSelect(vo);
	}

	@Override
	public int recipeCommentTotalRecord_user(PagingVO vo) {
		return dao.recipeCommentTotalRecord_user(vo);
	}

	@Override
	public List<RecipeCommentDTO> recipe_Comment_PageSelect_user(PagingVO vo) {
		return dao.recipe_Comment_PageSelect_user(vo);
	}

	@Override
	public int menuCommentTotalRecord_user(PagingVO vo) {
		return dao.menuCommentTotalRecord_user(vo);
	}

	@Override
	public List<MenuUserCommentDTO> menu_Comment_PageSelect_user(PagingVO vo) {
		return dao.menu_Comment_PageSelect_user(vo);
	}

	@Override
	public int commentTotalRecord(PagingVO vo) {
		return dao.commentTotalRecord(vo);
	}

	@Override
	public List<CommCommentDTO> comm_Comment_PageSelect(PagingVO vo) {
		return dao.comm_Comment_PageSelect(vo);
	}
	@Override
	public RecipeDTO selectRecipeLike(String userid) {
		return dao.selectRecipeLike(userid);
	}

	@Override
	public MenuUserDTO selectMenuLike(String userid) {
		return dao.selectMenuLike(userid);
	}

	@Override
	public ResDTO selectResLike(String userid) {
		return dao.selectResLike(userid);
	}

	@Override
	public List<ResDTO> res_PageSelect_user(PagingVO vo) {
		return dao.res_PageSelect_user(vo);
	}

	@Override
	public int resTotalRecord_user(PagingVO vo) {
		return dao.resTotalRecord_user(vo);
	}

	@Override
	public List<MenuUserDTO> menulike_pageSelect_user(PagingVO vo) {
		return dao.menulike_pageSelect_user(vo);
	}

	@Override
	public List<RecipeDTO> recipelike_pageSelect_user(PagingVO vo) {
		return dao.recipelike_pageSelect_user(vo);
	}

	@Override
	public ResDTO selectAddRes(String userid) {
		return dao.selectAddRes(userid);
	}

	@Override
	public ResEditDTO selectEditRes(String userid) {
		return dao.selectEditRes(userid);
	}

	@Override
	public List<ResDTO> selectAllAddRes(PagingVO vo) {
		return dao.selectAllAddRes(vo);
	}

	@Override
	public List<ResEditDTO> selectAllEditRes(PagingVO vo) {
		return dao.selectAllEditRes(vo);
	}

	@Override
	public List<SupDTO> selectAllAddSup(PagingVO vo) {
		return dao.selectAllAddSup(vo);
	}

	@Override
	public ReportDTO reportList(String userid) {
		return dao.reportList(userid);
	}

	@Override
	public List<ReportDTO> selectreportList(PagingVO vo) {
		return dao.selectreportList(vo);
	}


}
