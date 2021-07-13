package hotel.review.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hotel.common.domain.Page;
import hotel.review.dao.map.ReviewMap;
import hotel.review.domain.Review;

@Repository
public class ReviewDaoImple implements ReviewDao{
	@Autowired
	private ReviewMap reviewMap;

	@Override//게시판 목록
	public List<Review> getReviews(Page page){
		return reviewMap.getReviews(page);
	}
	

	@Override//게시물
	public Review getReview(int reviewNum) {
		return reviewMap.getReview(reviewNum);
	}
	
	@Override
	public void addReview(Review review) {
		reviewMap.addReview(review);
	}
	
	@Override
	public void deleteReview(int reviewNum) {
		reviewMap.deleteReview(reviewNum);
	}
	
	@Override
	public void updateReview(Review review) {
		reviewMap.updateReview(review);
	}
	
	@Override
	public void plusCnt(int reviewNum) {
	  reviewMap.plusCnt(reviewNum);
	}
	@Override
	public List<Review> myReviewBoards(){
		return reviewMap.myReviewBoards();
	}
	
	@Override
	public int getReviewsCnt() {
		return reviewMap.getReviewsCnt();
	}
}
