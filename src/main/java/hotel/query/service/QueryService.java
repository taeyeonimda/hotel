package hotel.query.service;

import java.util.List;

import hotel.common.domain.Page;
import hotel.query.domain.Query;

public interface QueryService {
	List<Query> listQuerys(Page page); 	// 문의 목록
	Query displayQuery(int queryNum); 	// 문의 조회 
	void registerQuery(Query query);	// 문의 등록
	void modifyQuery(Query query);		// 문의 수정
	void removeQuery(int queryNum);		// 문의 삭제
	void increaseCnt(int queryNum);		// 문의 조회수
	List<Query> myListQuerys();			// Mypage 문의 목록
	void queryReply(Query query);
	int getQuerysCnt();					// 총 문의
}