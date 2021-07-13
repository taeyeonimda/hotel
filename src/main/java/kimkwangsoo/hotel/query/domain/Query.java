package kimkwangsoo.hotel.query.domain;

import java.sql.Date;

public class Query {
	private int queryNum;			// 문의 번호
	private String queryTitle;		// 문의 제목
	private String queryContent;	// 문의 내용
	private Date queryDate;			// 문의 날짜
	private String queryReply;		// 문의 댓글
	private String queryReplayStat;	// 문의 단변 여부 -> 답변대기 답변완료
	private int queryHit;			// 문의 조회수
	private String userId;			// 회원 ID
	
	public int getQueryNum() {
		return queryNum;
	}

	public void setQueryNum(int queryNum) {
		this.queryNum = queryNum;
	}

	public String getQueryTitle() {
		return queryTitle;
	}

	public void setQueryTitle(String queryTitle) {
		this.queryTitle = queryTitle;
	}

	public String getQueryContent() {
		return queryContent;
	}

	public void setQueryContent(String queryContent) {
		this.queryContent = queryContent;
	}

	public Date getQueryDate() {
		return queryDate;
	}

	public void setQueryDate(Date queryDate) {
		this.queryDate = queryDate;
	}

	public String getQueryReply() {
		return queryReply;
	}

	public void setQueryReply(String queryReply) {
		this.queryReply = queryReply;
	}

	public String getQueryReplayStat() {
		return queryReplayStat;
	}

	public void setQueryReplayStat(String queryReplayStat) {
		this.queryReplayStat = queryReplayStat;
	}

	public int getQueryHit() {
		return queryHit;
	}

	public void setQueryHit(int queryHit) {
		this.queryHit = queryHit;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Query [queryNum=" + queryNum + ", queryTitle=" + queryTitle + ", queryContent=" + queryContent
				+ ", queryDate=" + queryDate + ", queryReply=" + queryReply + ", queryReplayStat=" + queryReplayStat
				+ ", queryHit=" + queryHit + ", userId=" + userId + "]";
	}
}
