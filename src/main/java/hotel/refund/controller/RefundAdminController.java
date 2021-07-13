package hotel.refund.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.common.domain.Page;
import hotel.refund.domain.Refund;
import hotel.refund.service.RefundService;
import hotel.reservation.domain.Reservation;
import hotel.reservation.service.ReservationService;

@Controller
@RequestMapping("/admin/refund")
public class RefundAdminController {
	@Autowired
	private RefundService refundService;
	
	@Autowired
	private ReservationService resService;
	
	@GetMapping("/refundList")
	public String refundList(Page page, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = refundService.getRefundsCnt();
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

		session.setAttribute("refunds", refundService.listRefunds(page));
		

		return "/admin/refund/refundList";
	};
	@RequestMapping("/refundInfo")
	public @ModelAttribute("refund") Refund displayrefund(Model model, int refundNum) {
		Reservation res = new Reservation();
		res = resService.displayReservation(refundNum);
		
		model.addAttribute("res", res);
		
		return refundService.displayRefund(refundNum);
	}

	@RequestMapping(value="updateRefundStatus.do", method=RequestMethod.POST)
	public String updateRefundStatus(@ModelAttribute("refund") Refund refund) {
		refundService.updateRefundStatus(refund);
		return "redirect:refundList";
	}
}
