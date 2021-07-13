package kimkwangsoo.hotel.review.dao.map;

import java.util.List;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.review.domain.Review;

public interface ReviewMap {
	List<Review> getReviews(Page page);
	Review getReview(int reviewNo);
	void addReview(Review review);
	void deleteReview(int reviewNo);
	void updateReview(Review review);
	void plusCnt(int reviewNo);
	List<Review> myReviewBoards();
	int getReviewsCnt();
}
