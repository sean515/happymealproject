package com.meal.happy.dto;

import java.util.Arrays;

public class RegisterDTO {
	private String userid;
	private int usernum;
	private String userpwd;
	private String username;
	private String nickname;
	private String age;
	private String email;
	private String gender; // 성별
	private String disease; // 질병 종류
	private String diseaseArr[];
	private String joindate;
	private int admin;
	private double bmi;
	
	@Override
	public String toString() {
		return "RegisterDTO [userid=" + userid + ", usernum=" + usernum + ", userpwd=" + userpwd + ", username="
				+ username + ", nickname=" + nickname + ", age=" + age + ", email=" + email + ", gender=" + gender
				+ ", disease=" + disease + ", diseaseArr=" + Arrays.toString(diseaseArr) + ", joindate=" + joindate
				+ ", admin=" + admin + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDisease() {
		//배열의 질병을 문자열로 바꿔 내보내기
		//[당뇨, 통풍]
		String diseaseStr = Arrays.toString(diseaseArr);
		diseaseStr = diseaseStr.substring(1,diseaseStr.length()-1);
		diseaseStr = diseaseStr.replace(", ", "/");	
		disease = diseaseStr;
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
		diseaseArr = disease.split("/");	//질병을 문자열에서 배열로 변환
	}
	public String[] getDiseaseArr() {
		return diseaseArr;
	}
	public void setDiseaseArr(String[] diseaseArr) {
		this.diseaseArr = diseaseArr;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public double getBmi() {
		return bmi;
	}
	public void setBmi(double bmi) {
		this.bmi = bmi;
	}
	
}
	
