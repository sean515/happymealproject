package com.meal.happy.dto;

public class MenuUserCommentDTO {
	private int menu_comment_no;
	private int menu_no;
	private String menu_comment_text;
	private String menu_title;
	private String userid;
	private String menu_comment_date;
	private String ip;
	private int menu_comment_hit;
	
	@Override
	public String toString() {
		return "MenuUserCommentDTO [menu_comment_no=" + menu_comment_no + ", menu_no=" + menu_no
				+ ", menu_comment_text=" + menu_comment_text + ", userid=" + userid + ", menu_comment_date="
				+ menu_comment_date + ", ip=" + ip + ", menu_comment_hit=" + menu_comment_hit + "]";
	}

	public int getMenu_comment_no() {
		return menu_comment_no;
	}

	public void setMenu_comment_no(int menu_comment_no) {
		this.menu_comment_no = menu_comment_no;
	}

	public int getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}

	public String getMenu_comment_text() {
		return menu_comment_text;
	}

	public void setMenu_comment_text(String menu_comment_text) {
		this.menu_comment_text = menu_comment_text;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMenu_comment_date() {
		return menu_comment_date;
	}

	public void setMenu_comment_date(String menu_comment_date) {
		this.menu_comment_date = menu_comment_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getMenu_comment_hit() {
		return menu_comment_hit;
	}

	public void setMenu_comment_hit(int menu_comment_hit) {
		this.menu_comment_hit = menu_comment_hit;
	}

	public String getMenu_title() {
		return menu_title;
	}

	public void setMenu_title(String menu_title) {
		this.menu_title = menu_title;
	}
	
}
