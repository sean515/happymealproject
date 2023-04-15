package com.meal.happy.dto;

public class SupDTO {
	private int sup_no;
	private String sup_title;
	private String sup_text;
	private String userid;
	private int sup_hit;
	private String sup_date;
	private String ip;
	private int sup_ref;	//원글번호
	private int sup_lvl;	//들여쓰기
	private int sup_step;
	private int sup_answer;
	
	@Override
	public String toString() {
		return "SupDTO [sup_no=" + sup_no + ", sup_title=" + sup_title + ", sup_text=" + sup_text + ", userid=" + userid
				+ ", sup_hit=" + sup_hit + ", sup_date=" + sup_date + ", ip=" + ip + ", sup_ref=" + sup_ref
				+ ", sup_lvl=" + sup_lvl + ", sup_step=" + sup_step + ", sup_answer=" + sup_answer + "]";
	}

	public int getSup_no() {
		return sup_no;
	}

	public void setSup_no(int sup_no) {
		this.sup_no = sup_no;
	}

	public String getSup_title() {
		return sup_title;
	}

	public void setSup_title(String sup_title) {
		this.sup_title = sup_title;
	}

	public String getSup_text() {
		return sup_text;
	}

	public void setSup_text(String sup_text) {
		this.sup_text = sup_text;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getSup_hit() {
		return sup_hit;
	}

	public void setSup_hit(int sup_hit) {
		this.sup_hit = sup_hit;
	}

	public String getSup_date() {
		return sup_date;
	}

	public void setSup_date(String sup_date) {
		this.sup_date = sup_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getSup_ref() {
		return sup_ref;
	}

	public void setSup_ref(int sup_ref) {
		this.sup_ref = sup_ref;
	}

	public int getSup_lvl() {
		return sup_lvl;
	}

	public void setSup_lvl(int sup_lvl) {
		this.sup_lvl = sup_lvl;
	}

	public int getSup_step() {
		return sup_step;
	}

	public void setSup_step(int sup_step) {
		this.sup_step = sup_step;
	}

	public int getSup_answer() {
		return sup_answer;
	}

	public void setSup_answer(int sup_answer) {
		this.sup_answer = sup_answer;
	}
	
	
}

