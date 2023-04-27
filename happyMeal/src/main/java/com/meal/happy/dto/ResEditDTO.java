package com.meal.happy.dto;

public class ResEditDTO {
	private int res_edit_no;
	private int res_no;
	private String userid;
	private int res_edit_type;
	private String res_edit_text;
	private String res_edit_date;
	
	@Override
	public String toString() {
		return "ResEditDTO [res_edit_no=" + res_edit_no + ", res_no=" + res_no + ", userid=" + userid
				+ ", res_edit_type=" + res_edit_type + ", res_edit_text=" + res_edit_text + ", res_edit_date="
				+ res_edit_date + "]";
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
	
}
