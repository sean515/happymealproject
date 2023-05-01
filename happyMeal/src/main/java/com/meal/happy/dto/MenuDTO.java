package com.meal.happy.dto;

import java.util.Arrays;
 
public class MenuDTO {
	private Integer amenu_no;
	private int amenu_type_no;
	private int amenu_name;
	private int amenu_hit;
	private Integer amenu_time;
	private String amenu_text;
	private String amenu_textArr[];
	private String amenu_type_name;
	private String amenu_thumbnail;
	private String amenu_img1;
	private String amenu_img2;
	private String amenu_img3;
	private String amenu_img4;
	private String amenu_img5;
	private String amenu_img6;


	@Override
	public String toString() {
		return "MenuDTO [amenu_no=" + amenu_no + ", amenu_type_no=" + amenu_type_no + ", amenu_name=" + amenu_name
				+ ", amenu_hit=" + amenu_hit + ", amenu_time=" + amenu_time + ", amenu_text=" + amenu_text
				+ ", amenu_textArr=" + Arrays.toString(amenu_textArr) + ", amenu_type_name=" + amenu_type_name
				+ ", amenu_thumbnail=" + amenu_thumbnail + "]";
	}

	public Integer getAmenu_no() {
		return amenu_no;
	}

	public void setAmenu_no(Integer amenu_no) {
		this.amenu_no = amenu_no;
	}

	public int getAmenu_type_no() {
		return amenu_type_no;
	}

	public void setAmenu_type_no(int amenu_type_no) {
		this.amenu_type_no = amenu_type_no;
	}

	public int getAmenu_name() {
		return amenu_name;
	}

	public void setAmenu_name(int amenu_name) {
		this.amenu_name = amenu_name;
	}

	public Integer getAmenu_time() {
		return amenu_time;
	}

	public void setAmenu_time(Integer amenu_time) {
		this.amenu_time = amenu_time;
	}

	public String getAmenu_text() {
		return amenu_text;
	}

	public void setAmenu_text(String amenu_text) {
		this.amenu_text = amenu_text;
	}

	public String[] getAmenu_textArr() {
		return amenu_textArr;
	}

	public void setAmenu_textArr(String[] amenu_textArr) {
		this.amenu_textArr = amenu_textArr;
	}

	public String getAmenu_type_name() {
		return amenu_type_name;
	}

	public void setAmenu_type_name(String amenu_type_name) {
		this.amenu_type_name = amenu_type_name;
	}

	public int getAmenu_hit() {
		return amenu_hit;
	}

	public void setAmenu_hit(int amenu_hit) {
		this.amenu_hit = amenu_hit;
	}

	public String getAmenu_thumbnail() {
		return amenu_thumbnail;
	}

	public void setAmenu_thumbnail(String amenu_thumbnail) {
		this.amenu_thumbnail = amenu_thumbnail;
	}
	public String getAmenu_img1() {
		return amenu_img1;
	}

	public void setAmenu_img1(String amenu_img1) {
		this.amenu_img1 = amenu_img1;
	}

	public String getAmenu_img2() {
		return amenu_img2;
	}

	public void setAmenu_img2(String amenu_img2) {
		this.amenu_img2 = amenu_img2;
	}

	public String getAmenu_img3() {
		return amenu_img3;
	}

	public void setAmenu_img3(String amenu_img3) {
		this.amenu_img3 = amenu_img3;
	}

	public String getAmenu_img4() {
		return amenu_img4;
	}

	public void setAmenu_img4(String amenu_img4) {
		this.amenu_img4 = amenu_img4;
	}

	public String getAmenu_img5() {
		return amenu_img5;
	}

	public void setAmenu_img5(String amenu_img5) {
		this.amenu_img5 = amenu_img5;
	}

	public String getAmenu_img6() {
		return amenu_img6;
	}

	public void setAmenu_img6(String amenu_img6) {
		this.amenu_img6 = amenu_img6;
	}
}
