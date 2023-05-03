package com.meal.happy.dto;

public class ReportDTO {
	
	private Integer report_no; //신고글번호
	private String userid; //신고자아이디
	private Integer report_post_no; //신고한글번호(원글번호)
	private int report_reason; //신고유형 1.광고2.비방3.허위정보4.기타
	private String report_text; //신고내용
	private String report_date; //신고일
	private int report_status; //처리상태 0.처리예정 1.처리완료
	private int report_response; //진행결과 1.승인 2.반려
	private String report_content; //처리시 메일로 보내는 내용
	private int board_type; //게시판 유형 1.식단 2.레시피 3.커뮤니티
	private String nickname;
	private String email; // 신고자 이메일
	
	@Override
	public String toString() {
		return "ReportDTO [report_no=" + report_no + ", userid=" + userid + ", report_post_no=" + report_post_no
				+ ", report_reason=" + report_reason + ", report_text=" + report_text + ", report_date=" + report_date
				+ ", report_status=" + report_status + ", report_response=" + report_response + ", report_content="
				+ report_content + ", board_type=" + board_type + ", nickname=" + nickname + ", email=" + email + "]";
	}

	public Integer getReport_no() {
		return report_no;
	}

	public void setReport_no(Integer report_no) {
		this.report_no = report_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Integer getReport_post_no() {
		return report_post_no;
	}

	public void setReport_post_no(Integer report_post_no) {
		this.report_post_no = report_post_no;
	}

	public int getReport_reason() {
		return report_reason;
	}

	public void setReport_reason(int report_reason) {
		this.report_reason = report_reason;
	}

	public String getReport_text() {
		return report_text;
	}

	public void setReport_text(String report_text) {
		this.report_text = report_text;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}

	public int getReport_status() {
		return report_status;
	}

	public void setReport_status(int report_status) {
		this.report_status = report_status;
	}

	public int getReport_response() {
		return report_response;
	}

	public void setReport_response(int report_response) {
		this.report_response = report_response;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public int getBoard_type() {
		return board_type;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
