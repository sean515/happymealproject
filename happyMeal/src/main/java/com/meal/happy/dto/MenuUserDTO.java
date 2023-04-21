package com.meal.happy.dto;

import java.sql.Blob;

public class MenuUserDTO {
	private Integer menu_no;
	private int amenu_type_no;
	private String userid;
	private String menu_title;
	private String menu_text;
	private Blob menu_file;
	private String menu_date;
	private int menu_like;
	private int menu_hit;
	private String ip;
	private String nickname;
	private String amenu_type_name;
	
	
	@Override
	public String toString() {
		return "MenuUserDTO [menu_no=" + menu_no + ", amenu_type_no=" + amenu_type_no + ", userid=" + userid
				+ ", menu_title=" + menu_title + ", menu_text=" + menu_text + ", menu_file=" + menu_file
				+ ", menu_date=" + menu_date + ", menu_like=" + menu_like + ", menu_hit=" + menu_hit + ", ip=" + ip
				+ ", nickname=" + nickname + ", amenu_type_name=" + amenu_type_name + "]";
	}


	public Integer getMenu_no() {
		return menu_no;
	}


	public void setMenu_no(Integer menu_no) {
		this.menu_no = menu_no;
	}


	public int getAmenu_type_no() {
		return amenu_type_no;
	}


	public void setAmenu_type_no(int amenu_type_no) {
		this.amenu_type_no = amenu_type_no;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getMenu_title() {
		return menu_title;
	}


	public void setMenu_title(String menu_title) {
		this.menu_title = menu_title;
	}


	public String getMenu_text() {
		return menu_text;
	}


	public void setMenu_text(String menu_text) {
		this.menu_text = menu_text;
	}


	public Blob getMenu_file() {
		return menu_file;
	}


	public void setMenu_file(Blob menu_file) {
		this.menu_file = menu_file;
	}


	public String getMenu_date() {
		return menu_date;
	}


	public void setMenu_date(String menu_date) {
		this.menu_date = menu_date;
	}


	public int getMenu_like() {
		return menu_like;
	}


	public void setMenu_like(int menu_like) {
		this.menu_like = menu_like;
	}


	public int getMenu_hit() {
		return menu_hit;
	}


	public void setMenu_hit(int menu_hit) {
		this.menu_hit = menu_hit;
	}


	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getAmenu_type_name() {
		return amenu_type_name;
	}


	public void setAmenu_type_name(String amenu_type_name) {
		this.amenu_type_name = amenu_type_name;
	}

	
}
