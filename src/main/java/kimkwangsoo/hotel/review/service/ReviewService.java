package kimkwangsoo.hotel.review.service;

import java.util.List;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.review.domain.Review;

public interface ReviewService {
	List<Review> listReviews(Page page);
	Review displayReview(int reviewNum);
	void registerReview(Review review);
	void removeReview(int reviewNum);
	void modifyReview(Review review);
	void increaseCnt(int reviewNum);
	List<Review> myListBoards();
	int getReviewsCnt();

}
