package com.meal.happy.dto;

import java.util.List;

public class CommDTO {
	private int comm_no;
	private String userid;
	private String comm_bullet_point;
	private String comm_title;
	private String comm_text;
	private String comm_date;
	private String comm_file;
	private int comm_hit;
	private int comm_like_hit;
	private String ip;
	private String username;

	//여러개의 레코드 한번에 삭제할 때 필요한 레코드 번호
	private List<Integer> noList;



	@Override
	public String toString() {
		return "CommDTO [comm_no=" + comm_no + ", userid=" + userid + ", comm_bullet_point=" + comm_bullet_point
				+ ", comm_title=" + comm_title + ", comm_text=" + comm_text + ", comm_date=" + comm_date
				+ ", comm_file=" + comm_file + ", comm_hit=" + comm_hit + ", comm_like_hit=" + comm_like_hit + ", ip="
				+ ip + ", noList=" + noList + "]";
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

	public String getComm_bullet_point() {
		return comm_bullet_point;
	}

	public void setComm_bullet_point(String comm_bullet_point) {
		this.comm_bullet_point = comm_bullet_point;
	}

	public String getComm_title() {
		return comm_title;
	}

	public void setComm_title(String comm_title) {
		this.comm_title = comm_title;
	}

	public String getComm_text() {
		return comm_text;
	}

	public void setComm_text(String comm_text) {
		this.comm_text = comm_text;
	}

	public String getComm_date() {
		return comm_date;
	}

	public void setComm_date(String comm_date) {
		this.comm_date = comm_date;
	}


	public String getComm_file() {
		return comm_file;
	}

	public void setComm_file(String comm_file) {
		this.comm_file = comm_file;
	}

	public int getComm_hit() {
		return comm_hit;
	}

	public void setComm_hit(int comm_hit) {
		this.comm_hit = comm_hit;
	}

	public int getComm_like_hit() {
		return comm_like_hit;
	}

	public void setComm_like_hit(int comm_like_hit) {
		this.comm_like_hit = comm_like_hit;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public List<Integer> getNoList() {
		return noList;
	}

	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
