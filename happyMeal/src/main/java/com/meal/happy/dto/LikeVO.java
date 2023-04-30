package com.meal.happy.dto;

public class LikeVO {
	//페이징처리시 필요한 변수들
	private int like_no;
	private int recipe_like_no;
	private int comm_no;
	private int recipe_no;
	private String userid;
	private int result;
	private int recipe_like_hit;
	
	
	@Override
	public String toString() {
		return "LikeVO [like_no=" + like_no + ", recipe_like_no=" + recipe_like_no + ", comm_no=" + comm_no
				+ ", recipe_no=" + recipe_no + ", userid=" + userid + ", result=" + result + "]";
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
}
