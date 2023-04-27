package com.meal.happy.dto;

public class LikeVO {
	//페이징처리시 필요한 변수들
	private int like_no;
	private int comm_no;
	private String userid;
	private int result;

	@Override
	public String toString() {
		return "LikeVO [like_no=" + like_no + ", comm_no=" + comm_no + ", userid=" + userid + ", result=" + result
				+ "]";
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
	
}
