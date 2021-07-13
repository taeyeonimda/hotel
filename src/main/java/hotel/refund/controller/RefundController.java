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
import hotel.room.domain.Room;
import hotel.room.service.RoomService;

@Controller
@RequestMapping("/refund")
public class RefundController {
	@Autowired
	private RefundService refundService;
	
	@Autowired
	private ReservationService resService;
	
	@Autowired
	private RoomService roomService;
	
	@RequestMapping("/refundWrite")
	public void registerRefundWrite(Model model, int resNum) {
		Reservation res = new Reservation();
		res = resService.displayReservation(resNum);
		
		model.addAttribute("res", res);
	}
	
	@RequestMapping("/refundInfo")
	public @ModelAttribute("refund")
	Refund displayRefund(Model model, int refundNum) {
		Reservation res = new Reservation();
		res = resService.displayReservation(refundNum);
		
		model.addAttribute("res", res);
		
		return refundService.displayRefund(refundNum);
	}
	

	@GetMapping("/refundMy")
	public String refundMy(Page page, HttpSession session,
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
		

		return "/refund/refundMy";
	};
	
	
	@RequestMapping(value="registerRefundInfo.do", method=RequestMethod.POST)
	public String registerRefundInfo(@ModelAttribute("reservation") Reservation res,
			@ModelAttribute("refund") Refund refund, @ModelAttribute("room") Room room) {
		resService.updateResStatus(res);
		refundService.registerRefundInfo(refund);
		roomService.updateRoomResStatus(room);
		return "redirect:refundMy";
	}
}
