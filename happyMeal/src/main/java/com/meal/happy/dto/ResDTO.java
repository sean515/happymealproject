package com.meal.happy.dto;

public class ResDTO {
	private int res_no;
	private String res_name;
	private String res_addr;
	private String res_tel;
	private String res_category;
	private String res_type;
	private String res_time;
	private String res_note;
	private String res_like;
	private int res_hit;
	private String res_image;
	private String ip;
	private String res_date;
	private int res_status;
	
	@Override
	public String toString() {
		return "ResDTO [res_no=" + res_no + ", res_name=" + res_name + ", res_addr=" + res_addr + ", res_tel=" + res_tel
				+ ", res_category=" + res_category + ", res_type=" + res_type + ", res_time=" + res_time + ", res_note="
				+ res_note + ", res_like=" + res_like + ", res_hit=" + res_hit + ", res_image=" + res_image + ", ip="
				+ ip + ", res_date=" + res_date + ", res_status=" + res_status + "]";
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_addr() {
		return res_addr;
	}

	public void setRes_addr(String res_addr) {
		this.res_addr = res_addr;
	}

	public String getRes_tel() {
		return res_tel;
	}

	public void setRes_tel(String res_tel) {
		this.res_tel = res_tel;
	}

	public String getRes_category() {
		return res_category;
	}

	public void setRes_category(String res_category) {
		this.res_category = res_category;
	}

	public String getRes_type() {
		return res_type;
	}

	public void setRes_type(String res_type) {
		this.res_type = res_type;
	}

	public String getRes_time() {
		return res_time;
	}

	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}

	public String getRes_note() {
		return res_note;
	}

	public void setRes_note(String res_note) {
		this.res_note = res_note;
	}

	public String getRes_like() {
		return res_like;
	}

	public void setRes_like(String res_like) {
		this.res_like = res_like;
	}

	public int getRes_hit() {
		return res_hit;
	}

	public void setRes_hit(int res_hit) {
		this.res_hit = res_hit;
	}

	public String getRes_image() {
		return res_image;
	}

	public void setRes_image(String res_image) {
		this.res_image = res_image;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public int getRes_status() {
		return res_status;
	}

	public void setRes_status(int res_status) {
		this.res_status = res_status;
	}
	
}
