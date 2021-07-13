package hotel.query.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotel.common.domain.Page;
import hotel.query.dao.map.QueryMap;
import hotel.query.domain.Query;

@Repository
public class QueryDaoImpl implements QueryDao {
	@Autowired
	private QueryMap queryMap;
 
	@Override	// 문의 목록
	public List<Query> getQuerys(Page page) {
		return queryMap.getQuerys(page);
	}

	@Override	// 문의 조회
	public Query getQuery(int queryNum) {
		return queryMap.getQuery(queryNum);
	}

	@Override	// 문의 등록
	public void addQuery(Query query) {
		queryMap.addQuery(query);
	}

	@Override	// 문의 수정
	public void updateQuery(Query query) {
		queryMap.updateQuery(query);
	}

	@Override	// 문의 삭제
	public void deleteQuery(int queryNum) {
		queryMap.deleteQuery(queryNum);
	}

	@Override	// 문의 조회수 증가
	public void plusCnt(int queryNum) {
		queryMap.plusCnt(queryNum);
	}
	
	@Override	// Mypage 문의 목록
	public List<Query> myQueryBoards() {
		return queryMap.myQueryBoards();
	}
	
	@Override	// 총 문의
    public int getQuerysCnt(){
      return queryMap.getQuerysCnt();
   }

	@Override
	public void queryReply(Query query) {
		queryMap.queryReply(query);
	}
}