package com.meal.happy.dto;

public class CommCommentDTO {
	private int comm_comment_no;
	private int comm_no;
	private String comm_comment_text;
	private String userid;
	private String comm_comment_date;
	private String ip;
	private int comm_comment_hit; 
	private String comm_title;
	
	@Override
	public String toString() {
		return "CommCommentDTO [comm_comment_no=" + comm_comment_no + ", comm_no=" + comm_no + ", comm_comment_text="
				+ comm_comment_text + ", userid=" + userid + ", comm_comment_date=" + comm_comment_date + ", ip=" + ip
				+ ", comm_comment_hit=" + comm_comment_hit + ", comm_title=" + comm_title + "]";
	}
	
	
	
	public int getComm_comment_no() {
		return comm_comment_no;
	}
	public void setComm_comment_no(int comm_comment_no) {
		this.comm_comment_no = comm_comment_no;
	}
	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getComm_comment_text() {
		return comm_comment_text;
	}
	public void setComm_comment_text(String comm_comment_text) {
		this.comm_comment_text = comm_comment_text;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getComm_comment_date() {
		return comm_comment_date;
	}
	public void setComm_comment_date(String comm_comment_date) {
		this.comm_comment_date = comm_comment_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}


	public int getComm_comment_hit() {
		return comm_comment_hit;
	}


	public void setComm_comment_hit(int comm_comment_hit) {
		this.comm_comment_hit = comm_comment_hit;
	}



	public String getComm_title() {
		return comm_title;
	}



	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}
	
	
	
}
