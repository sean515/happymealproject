package com.meal.happy.dao;

import java.util.List;

import com.meal.happy.dto.CommCommentDTO;
import com.meal.happy.dto.CommDTO;
import com.meal.happy.dto.RecipeCommentDTO;
import com.meal.happy.dto.RecipeDTO;
import com.meal.happy.dto.RegisterDTO;
import com.meal.happy.dto.SupDTO;

public interface RegisterDAO {
	//추상메소드
	public RegisterDTO loginOk(String userid, String userpwd);
	//아이디중복검사 - 아이디의 갯수를 구한다.
	public int idCheck(String userid);
	//회원가입
	public int registerInsert(RegisterDTO dto);
	//회원정보수정폼
	public RegisterDTO registerEdit(String userid);
	//회원정보 수정 DB update
	public int registerEditOk(RegisterDTO dto);
	//이름과 이메일로 아이디 검색
	public String idSearch(String username, String email);
	//아이디와 이메일로 비밀번호 검색
	public String pwSearch(String userid, String email);
	//임시비밀번호로 DB update
	public int updateTempPw(RegisterDTO dto);
	
	public RegisterDTO myPage(String userid);
	public RegisterDTO registerEditPopup(String userid, String userpwd);
	public RegisterDTO checkPassword(String userid, String userpwd);
	public RegisterDTO checkPasswordOk(String userid, String userpwd);
	
	//마이페이지 게시글 댓글 정보 불러오기
	public CommDTO selectComm(String userid);
	public RecipeDTO selectRecipe (String userid);
	public CommCommentDTO selectCommComment (String userid);
	//public RecipeCommentDTO selectRecipeComment  (String userid);
	public SupDTO selectSup (String userid);
	
	//bmi 계산 후 DB update
	public void updateBMI(String userid, double bmi);
}
