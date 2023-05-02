package com.meal.happy.dto;

public class LikeVO {
	//페이징처리시 필요한 변수들
	private int like_no;
	private int recipe_like_no;
	private int comm_no;
	private int recipe_no;
	private int menu_no;
	private int res_no;
	private String userid;
	private int result;
	private int recipe_like_hit;
	private int menu_like_hit;
	private int res_like_hit;
	
	
	@Override
	public String toString() {
		return "LikeVO [like_no=" + like_no + ", recipe_like_no=" + recipe_like_no + ", comm_no=" + comm_no
				+ ", recipe_no=" + recipe_no + ", menu_no=" + menu_no + ", res_no=" + res_no + ", userid=" + userid
				+ ", result=" + result + ", recipe_like_hit=" + recipe_like_hit + ", menu_like_hit=" + menu_like_hit
				+ ", res_like_hit=" + res_like_hit + "]";
	}
	public int getRecipe_like_no() {
		return recipe_like_no;
	}
	public void setRecipe_like_no(int recipe_like_no) {
		this.recipe_like_no = recipe_like_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getRecipe_like_hit() {
		return recipe_like_hit;
	}
	public void setRecipe_like_hit(int recipe_like_hit) {
		this.recipe_like_hit = recipe_like_hit;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public int getMenu_like_hit() {
		return menu_like_hit;
	}
	public void setMenu_like_hit(int menu_like_hit) {
		this.menu_like_hit = menu_like_hit;
	}
	public int getRes_like_hit() {
		return res_like_hit;
	}
	public void setRes_like_hit(int res_like_hit) {
		this.res_like_hit = res_like_hit;
	}
	
	
}
