package com.meal.happy.dto;

public class SupPagingVO {
	
	//고객센터 페이징 변수
	private int supNowPage = 1; //현재페이지
	private int supOnePageRecord = 5; // 한페이지에 표시할 레코드 수
	private int supTotalRecord; // 총레코드 수
	private int supTotalPage; //총페이지 수
	private int supLastPageRecord; // 마지막 페이지에 남아있는 레코드 수
	
	private int supOnePageNumCount=5; //한페이지당 페이지 갯수
	private int supStartPageNum=1;
	
	@Override
	public String toString() {
		return "SupPagingVO [supNowPage=" + supNowPage + ", supOnePageRecord=" + supOnePageRecord + ", supTotalRecord="
				+ supTotalRecord + ", supTotalPage=" + supTotalPage + ", supLastPageRecord=" + supLastPageRecord
				+ ", supOnePageNumCount=" + supOnePageNumCount + ", supStartPageNum=" + supStartPageNum + "]";
	}

	public int getSupNowPage() {
		return supNowPage;
	}

	public void setSupNowPage(int supNowPage) {
		this.supNowPage = supNowPage;
		
		//출력할 페이지 시작번호를 계산
		//((현재페이지-1)/표시할 페이지수)*표시할 페이지수 +1
		supStartPageNum =((supNowPage-1)/supOnePageNumCount)*supOnePageNumCount+1;
	}

	public int getSupOnePageRecord() {
		return supOnePageRecord;
	}

	public void setSupOnePageRecord(int supOnePageRecord) {
		this.supOnePageRecord = supOnePageRecord;
	}

	public int getSupTotalRecord() {
		return supTotalRecord;
	}

	public void setSupTotalRecord(int supTotalRecord) {
		this.supTotalRecord = supTotalRecord;
		
		//총레코드수를 이용하여 총페이지 수를 구하기
		supTotalPage = (int)Math.ceil((double)supTotalRecord/supOnePageRecord);
		
		//마지막페이지에 남아 있는 레코드 수
		supLastPageRecord = supOnePageRecord;
		if(supNowPage==supTotalPage) {
			if(supTotalRecord%supOnePageRecord==0) {//나머지가 0일경우는 lastPageRecord <- onePageRecord
				supLastPageRecord = supOnePageRecord;
			}else {//나머지가 있을 경우 남아있는 레코드수를 lastPageRecord
				supLastPageRecord = supTotalRecord%supOnePageRecord;
			}
		}
	}

	public int getSupTotalPage() {
		return supTotalPage;
	}

	public void setSupTotalPage(int supTotalPage) {
		this.supTotalPage = supTotalPage;
	}

	public int getSupLastPageRecord() {
		return supLastPageRecord;
	}

	public void setSupLastPageRecord(int supLastPageRecord) {
		this.supLastPageRecord = supLastPageRecord;
	}

	public int getSupOnePageNumCount() {
		return supOnePageNumCount;
	}

	public void setSupOnePageNumCount(int supOnePageNumCount) {
		this.supOnePageNumCount = supOnePageNumCount;
	}

	public int getSupStartPageNum() {
		return supStartPageNum;
	}

	public void setSupStartPageNum(int supStartPageNum) {
		this.supStartPageNum = supStartPageNum;
	}
	
	
}
