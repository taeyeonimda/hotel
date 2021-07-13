package hotel.reservation.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.common.domain.Page;
import hotel.reservation.domain.Reservation;
import hotel.reservation.service.ReservationService;

@Controller
@RequestMapping("/admin/reservation")
public class ReservationAdminController {
	@Autowired
	private ReservationService resService;
	
	@GetMapping("/resList")
	public String resList(Page page, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = resService.getResCnt();
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

		session.setAttribute("reservations", resService.listReservations(page));
		

		return "/admin/reservation/resList";
	};
	
	@RequestMapping("/resInfo")
	public @ModelAttribute("reservation") Reservation displayReservation(int resNum) {
		return resService.displayReservation(resNum);
	}
}
