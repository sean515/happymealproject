package com.meal.happy.dto;

public class ResCommentDTO {
	private int res_comment_no;
	private int res_no;
	private String userid;
	private String res_comment_text;
	private String ip;
	private int res_star;
	private int resCommentCount;

	@Override
	public String toString() {
		return "ResCommentDTO [res_comment_no=" + res_comment_no + ", res_no=" + res_no + ", userid=" + userid
				+ ", res_comment_text=" + res_comment_text + ", ip=" + ip + ", res_star=" + res_star
				+ ", resCommentCount=" + resCommentCount + "]";
	}

	public int getRes_comment_no() {
		return res_comment_no;
	}

	public void setRes_comment_no(int res_comment_no) {
		this.res_comment_no = res_comment_no;
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

	public String getRes_comment_text() {
		return res_comment_text;
	}

	public void setRes_comment_text(String res_comment_text) {
		this.res_comment_text = res_comment_text;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getRes_star() {
		return res_star;
	}

	public void setRes_star(int res_star) {
		this.res_star = res_star;
	}

	public int getResCommentCount() {
		return resCommentCount;
	}

	public void setResCommentCount(int resCommentCount) {
		this.resCommentCount = resCommentCount;
	}
	
}
