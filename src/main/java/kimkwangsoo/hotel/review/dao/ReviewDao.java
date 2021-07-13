package kimkwangsoo.hotel.review.dao;

import java.util.List;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.review.domain.Review;

public interface ReviewDao {
	List<Review> getReviews(Page page);
	Review getReview(int reviewNum);
	void addReview(Review review);
	void deleteReview(int reviewNum);
	void updateReview(Review review);
	void plusCnt(int reviewNum);
	List<Review> myReviewBoards();
	int getReviewsCnt();
}
