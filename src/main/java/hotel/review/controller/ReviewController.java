package hotel.review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.domain.Page;
import hotel.review.domain.Review;
import hotel.review.service.ReviewService;
import hotel.room.service.RoomService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	@Autowired
	private ReviewService reviewService;
	
	@Autowired private RoomService roomService;

	// 리뷰 리스트보기
	@GetMapping("/reviewList")
	public String reviewList(Model model, Page page, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		//roomlist
  	  int total1 = roomService.getRoomTypesCnt();
	      if(nowPage ==null && cntPerPage ==null) { 
	         nowPage ="1";
	         cntPerPage ="5";
	      }else if(nowPage ==null) {
	         nowPage ="1";
	      }else if(cntPerPage ==null) {
	         cntPerPage = "5";
	      }
	      page = new Page(total1, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	      
	      model.addAttribute("roomTypeList", roomService.getRoomTypes(page));

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
		

		return "/review/reviewList";
	};
	
	@GetMapping("/reviewMy")
	public String reviewMy(Page page, HttpSession session,
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
		

		return "/review/reviewMy";
	};

	// 리뷰상세
	@RequestMapping(value = { "/reviewContentUser" }) // 리뷰 내용보기,조회수
	public ModelAndView displayReview(@RequestParam(defaultValue = "0") Integer reviewNum, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/review/reviewContentUser");
		Review review = new Review();

		review = reviewService.displayReview(reviewNum);
		reviewService.increaseCnt(reviewNum); // 조회수 증가
		session.setAttribute("review", review);
		return mv;
	}
	
	@RequestMapping(value = { "/reviewContent" }) // 리뷰 내용보기,조회수
	public ModelAndView displayReviewMy(@RequestParam(defaultValue = "0") Integer reviewNum, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/review/reviewContent");
		Review review = new Review();

		review = reviewService.displayReview(reviewNum);
		reviewService.increaseCnt(reviewNum); // 조회수 증가
		session.setAttribute("review", review);
		return mv;
	}

	// 수정
	@RequestMapping("/reviewModi")
	public String reviewModi() {
		return "review/reviewModi";
	}
	@ResponseBody
	@RequestMapping("/modiReview")
	public void modifyReview(Review review) {
		reviewService.modifyReview(review);
	}
	
	// 등록
	@RequestMapping(value="/reviewAdd", method=RequestMethod.GET)
	public void registerReviewForm() {
		
	}
	
	@RequestMapping(value="registerReview.do", method=RequestMethod.POST)
	public String registerReview(@ModelAttribute("review") Review review) {
		reviewService.registerReview(review);
		return "redirect:reviewList";
	}
	// 삭제
	@RequestMapping(value = "removeReview.do")
	public String removeReview(@RequestParam(value = "reviewNum") int reviewNum) {
		reviewService.removeReview(reviewNum);
		return "redirect:reviewList";
	}

	// 마이페이지 게시판
	@RequestMapping(value= {"/common/myPage"})
	public void getMyReviews(HttpSession session) {
		session.setAttribute("review", reviewService.myListBoards());
	}
}
