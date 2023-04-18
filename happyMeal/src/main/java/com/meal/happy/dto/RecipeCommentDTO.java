package com.meal.happy.dto;

public class RecipeCommentDTO {
	private int recipe_comment_no;
	private int recipe_no;
	private String recipe_comment_text;
	private String userid;
	private String recipe_comment_date;
	private String ip;
	private int recipe_comment_hit;
	@Override
	public String toString() {
		return "RecipeCommentDTO [recipe_comment_no=" + recipe_comment_no + ", recipe_no=" + recipe_no
				+ ", recipe_comment_text=" + recipe_comment_text + ", userid=" + userid + ", recipe_comment_date="
				+ recipe_comment_date + ", ip=" + ip + ", recipe_comment_hit=" + recipe_comment_hit + "]";
	}
	public int getRecipe_comment_no() {
		return recipe_comment_no;
	}
	public void setRecipe_comment_no(int recipe_comment_no) {
		this.recipe_comment_no = recipe_comment_no;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public String getRecipe_comment_text() {
		return recipe_comment_text;
	}
	public void setRecipe_comment_text(String recipe_comment_text) {
		this.recipe_comment_text = recipe_comment_text;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRecipe_comment_date() {
		return recipe_comment_date;
	}
	public void setRecipe_comment_date(String recipe_comment_date) {
		this.recipe_comment_date = recipe_comment_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getRecipe_comment_hit() {
		return recipe_comment_hit;
	}
	public void setRecipe_comment_hit(int recipe_comment_hit) {
		this.recipe_comment_hit = recipe_comment_hit;
	} 
}
