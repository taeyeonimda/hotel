package hotel.common.domain;

import org.apache.ibatis.type.Alias;

public class Pagination {
	private int listSize = 10;                //목록개수
	private int rangeSize = 5;            // 페이지범위
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList; //게시판 시작번호
	private int endPage;
	private boolean prev;
	private boolean next;

	public String toString() {
		return listSize + " " + rangeSize + " " + page+ " " + range + " " + listCnt + " " + pageCnt + " " + startPage + " " + startList + " " + endPage;
		//5 5 1 1 40 8 1 0 5
	}
		
	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		//전체 페이지수 
		this.pageCnt = (int)Math.ceil(listCnt/listSize);
		
		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;
		
		//끝 페이지
		this.endPage = range * rangeSize;				

		//게시판 시작번호		
		this.startList = (page - 1) * listSize;	
		if(page == 1) {
			this.startList = (page-1) * listSize;	
		}else if(page > 1) {
			this.startList = (page-1) * listSize + 1;
			this.listSize = listSize -1 ;
		}

		//이전 버튼 상태
		this.prev = range == 1 ? false : true;		

		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
}
