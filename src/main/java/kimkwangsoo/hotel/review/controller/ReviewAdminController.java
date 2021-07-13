package kimkwangsoo.hotel.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kimkwangsoo.hotel.common.domain.Page;
import kimkwangsoo.hotel.review.domain.Review;
import kimkwangsoo.hotel.review.service.ReviewService;

@Controller
@RequestMapping("/admin/review")
public class ReviewAdminController {
	@Autowired
	private ReviewService reviewService;

	// 문의 목록
	@GetMapping("/reviewList")
	public String reviewList(Page page, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = reviewService.getReviewsCnt();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		page = new Page(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		session.setAttribute("paging", page);

		session.setAttribute("reviews", reviewService.listReviews(page));
		

		return "admin/review/reviewList";
	};

	//  조회
	@RequestMapping("/reviewContentUser") // 내용 조회, 조회수
	public ModelAndView displayReview(@RequestParam(defaultValue = "1") Integer reviewNum, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/review/reviewContentUser");
		Review review = new Review();
		

		review = reviewService.displayReview(reviewNum);
		reviewService.increaseCnt(reviewNum); // 조회수 증가
		System.out.println(reviewNum);
		session.setAttribute("review", review);
		return mv;
	}

	// 문의 삭제
	@RequestMapping(value = "removeReview.do")
	public String Review(@RequestParam(value = "reviewNum") int reviewNum) {
		reviewService.removeReview(reviewNum);
		return "redirect:reviewList";
	}
}
