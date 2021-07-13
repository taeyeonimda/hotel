package hotel.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hotel.common.domain.Page;
import hotel.review.dao.ReviewDao;
import hotel.review.domain.Review;

@Service
public class ReviewServicecImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<Review> listReviews(Page page){
		return reviewDao.getReviews(page);
	}
	@Override
	public int getReviewsCnt() {
		return reviewDao.getReviewsCnt();
	}

	@Override
	public Review displayReview(int reviewNum) {
		return reviewDao.getReview(reviewNum);
	}

	@Override
	public void registerReview(Review review) {
		reviewDao.addReview(review);
	}
	
	@Override
	public void removeReview(int reviewNum) {
		reviewDao.deleteReview(reviewNum);
	}
	
	@Override
	public void modifyReview(Review review) {
		reviewDao.updateReview(review);
	}
	
	@Override
	public void increaseCnt(int reviewNum) {
		reviewDao.plusCnt(reviewNum);
	}
	
	@Override
	public List<Review> myListBoards(){
		return reviewDao.myReviewBoards();
	}
	
}
  