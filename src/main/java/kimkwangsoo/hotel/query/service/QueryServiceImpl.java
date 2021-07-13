package kimkwangsoo.hotel.query.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.query.dao.QueryDao;
import kimkwangsoo.hotel.query.domain.Query;

@Service
public class QueryServiceImpl implements QueryService {
	@Autowired
	private QueryDao queryDao;
	
	@Override
	public List<Query> listQuerys(Page page) {
		return queryDao.getQuerys(page);
	}

	@Override
	public Query displayQuery(int queryNum) {
		return queryDao.getQuery(queryNum);
	}

	@Override
	public void registerQuery(Query query) {
		queryDao.addQuery(query);
	}

	@Override
	public void modifyQuery(Query query) {
		queryDao.updateQuery(query);
	}

	@Override
	public void removeQuery(int queryNum) {
		queryDao.deleteQuery(queryNum);
	}

	@Override
	public void increaseCnt(int queryNum) {
		queryDao.plusCnt(queryNum);
	}

	@Override
	public List<Query> myListQuerys() {
		return queryDao.myQueryBoards();
	}
	
	@Override
	public int getQuerysCnt() {
		return queryDao.getQuerysCnt();
	}

	@Override
	public void queryReply(Query query) {
		queryDao.queryReply(query);
		
	}
}
