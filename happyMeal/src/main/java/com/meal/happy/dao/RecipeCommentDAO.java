package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.RecipeCommentDTO;





public interface RecipeCommentDAO {

	//댓글등록
	public int recipecommentInsert(RecipeCommentDTO dto);
	//댓글목록
	public List<RecipeCommentDTO> recipecommentListSelect(int recipe_no);
	//댓글 수정
	public int recipecommentUpdate(RecipeCommentDTO dto);
	//댓글 삭제
	public int recipecommentDelete(int recipe_comment_no, String userid);	
	//댓글 수
	public int count_comment_hit(RecipeCommentDTO dto);
	
}
