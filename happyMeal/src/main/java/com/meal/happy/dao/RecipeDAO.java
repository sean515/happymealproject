package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.PagingVO;

public interface RecipeDAO {
	//글등록
	public int recipeInsert(RecipeDTO dto);
	//총레코드 수
	public int recipeTotalRecord(PagingVO vo);
	public int recipeTotalRecord_user(PagingVO vo);
	//해당 페이지 선택
	public List<RecipeDTO> pageSelect(PagingVO vo);
	public List<RecipeDTO> pageSelect_user(PagingVO vo);
	//글 선택(no)
	public RecipeDTO recipeSelect(int recipe_no);
	//글 선택 수정
	public RecipeDTO recipeEditSelect(int recipe_no);
	//글 수정(DB update)
	public int recipeUpdate(RecipeDTO dto);
	//조회수 증가
	public void recipeHitCount(int recipe_no);
	//글 삭제
	public int recipeDelete(RecipeDTO dto);
}
