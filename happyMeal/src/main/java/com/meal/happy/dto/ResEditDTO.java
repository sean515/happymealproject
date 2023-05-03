package com.meal.happy.dto;

public class ResEditDTO {
	private int res_edit_no;
	private int res_no;
	private String userid;
	private int res_edit_type;
	private String res_edit_text;
	private String res_edit_date;
	private String res_addr;
	private String res_name;
	private String res_type;
	private int res_status;

	@Override
	public String toString() {
		return "ResEditDTO [res_edit_no=" + res_edit_no + ", res_no=" + res_no + ", userid=" + userid
				+ ", res_edit_type=" + res_edit_type + ", res_edit_text=" + res_edit_text + ", res_edit_date="
				+ res_edit_date + ", res_status=" + res_status + "]";
	}

	public int getRes_edit_no() {
		return res_edit_no;
	}

	public void setRes_edit_no(int res_edit_no) {
		this.res_edit_no = res_edit_no;
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

	public int getRes_edit_type() {
		return res_edit_type;
	}

	public void setRes_edit_type(int res_edit_type) {
		this.res_edit_type = res_edit_type;
	}

	public String getRes_edit_text() {
		return res_edit_text;
	}

	public void setRes_edit_text(String res_edit_text) {
		this.res_edit_text = res_edit_text;
	}

	public String getRes_edit_date() {
		return res_edit_date;
	}

	public void setRes_edit_date(String res_edit_date) {
		this.res_edit_date = res_edit_date;
	}

	public int getRes_status() {
		return res_status;
	}

	public void setRes_status(int res_status) {
		this.res_status = res_status;
	}

	public String getRes_addr() {
		return res_addr;
	}

	public void setRes_addr(String res_addr) {
		this.res_addr = res_addr;
	}

	public String getRes_name() {
		return res_name;
	}

	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}

	public String getRes_type() {
		return res_type;
	}

	public void setRes_type(String res_type) {
		this.res_type = res_type;
	}
	
}
