package hotel.query.dao.map;

import java.util.List;

import hotel.common.domain.Page;
import hotel.query.domain.Query;

public interface QueryMap {
	List<Query> getQuerys(Page page); 	// 문의 목록
	Query getQuery(int queryNum); 		// 문의 조회 
	void addQuery(Query query);			// 문의 등록
	void updateQuery(Query query);		// 문의 수정
	void deleteQuery(int queryNum);		// 문의 삭제
	void plusCnt(int queryNum);			// 문의 조회수
	List<Query> myQueryBoards();		// Mypage 문의 목록
	void queryReply(Query query);
	int getQuerysCnt(); 				// 총 문의
}