package com.meal.happy.dto;

public class PagingVO {
	//페이징처리시 필요한 변수들
	private int nowPage = 1; //현재페이지
	private int onePageRecord = 12; //한페이지에 표시할 레코드 수 
	private int totalRecord; //총레코드 수 
	private int totalPage; //총페이지수
	private int lastPageRecord; //마지막 페이지에 남아있는 레코드 수 
	
	private int onePageNumCount=5; //한페이지당 페이지 갯수
	private int startPageNum=1;
	
	//검색에 필요한 변수들
	private String searchKey;
	private String searchWord;
	private String parts1;
	private String parts2;
	private String parts3;
	private String parts4;
	private String parts5;
	private String delparts1;
	private String delparts2;
	private String delparts3;
	private String delparts4;
	private String delparts5;
	
	
	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", onePageRecord=" + onePageRecord + ", totalRecord=" + totalRecord
				+ ", totalPage=" + totalPage + ", lastPageRecord=" + lastPageRecord + ", onePageNumCount="
				+ onePageNumCount + ", startPageNum=" + startPageNum + ", searchKey=" + searchKey + ", searchWord="
				+ searchWord + ", parts1=" + parts1 + ", parts2=" + parts2 + ", parts3=" + parts3 + ", parts4=" + parts4
				+ ", parts5=" + parts5 + ", delparts1=" + delparts1 + ", delparts2=" + delparts2 + ", delparts3="
				+ delparts3 + ", delparts4=" + delparts4 + ", delparts5=" + delparts5 + "]";
	}
	
	public int getNowPage() {
		return nowPage;
	}
	
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		//출력할 페이지 시작번호를 계산
		//((현재페이지-1)/표시할 페이지수)*표시할 페이지수+1
		startPageNum =((nowPage-1)/onePageNumCount)*onePageNumCount+1;
	}
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		//총레코드수를 이용하여 총페이지 수를 구하기
		totalPage = (int)Math.ceil((double)totalRecord/onePageRecord);
		
		//마지막페이지에 남아 있는 레코드 수
		lastPageRecord = onePageRecord;
		if(nowPage==totalPage) {
			if(totalRecord%onePageRecord==0){//나머지가 0일경우는 lastPageRecord <- onePageRecord
					lastPageRecord = onePageRecord;
			}else{//나머지가 있을 경우 남아있는 레코드수를 lastPageRecord
					lastPageRecord = totalRecord%onePageRecord;
			}
		}	
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLastPageRecord() {
		return lastPageRecord;
	}

	public void setLastPageRecord(int lastPageRecord) {
		this.lastPageRecord = lastPageRecord;
	}

	public int getOnePageNumCount() {
		return onePageNumCount;
	}

	public void setOnePageNumCount(int onePageNumCount) {
		this.onePageNumCount = onePageNumCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public String getSearchKey() {
		return searchKey;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getParts1() {
		return parts1;
	}

	public void setParts1(String parts1) {
		this.parts1 = parts1;
	}

	public String getParts2() {
		return parts2;
	}

	public void setParts2(String parts2) {
		this.parts2 = parts2;
	}

	public String getParts3() {
		return parts3;
	}

	public void setParts3(String parts3) {
		this.parts3 = parts3;
	}

	public String getParts4() {
		return parts4;
	}

	public void setParts4(String parts4) {
		this.parts4 = parts4;
	}

	public String getParts5() {
		return parts5;
	}

	public void setParts5(String parts5) {
		this.parts5 = parts5;
	}

	public String getDelparts1() {
		return delparts1;
	}

	public void setDelparts1(String delparts1) {
		this.delparts1 = delparts1;
	}

	public String getDelparts2() {
		return delparts2;
	}

	public void setDelparts2(String delparts2) {
		this.delparts2 = delparts2;
	}

	public String getDelparts3() {
		return delparts3;
	}

	public void setDelparts3(String delparts3) {
		this.delparts3 = delparts3;
	}

	public String getDelparts4() {
		return delparts4;
	}

	public void setDelparts4(String delparts4) {
		this.delparts4 = delparts4;
	}

	public String getDelparts5() {
		return delparts5;
	}

	public void setDelparts5(String delparts5) {
		this.delparts5 = delparts5;
	}	
	
	
}
