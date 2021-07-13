package hotel.reservation.controller;

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
import hotel.reservation.domain.Reservation;
import hotel.reservation.service.ReservationService;
import hotel.room.domain.Room;
import hotel.room.domain.RoomType;
import hotel.room.service.RoomService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	@Autowired
	private ReservationService resService;
	
	@Autowired
	private RoomService roomService;
	

	@RequestMapping("../room/roomSt")
	public void displayRoom() {
		// return "../room/roomSt";
	}
	
	@RequestMapping(value="/resWrite")
	public void registerResWrite() {
		
	}
	
	@RequestMapping(value="/resPay")
	public void registerResPay(Model model, String roomTypeTxt) {
		RoomType roomType = new RoomType();
		roomType = roomService.getRoomType(roomTypeTxt);
		
		model.addAttribute("roomType", roomType);
	}
	
	@RequestMapping(value="/resInfo")
	public @ModelAttribute("reservation") Reservation displayResInfo(int resNum) {
		return resService.displayReservation(resNum);
	}
	
	@GetMapping("/resMy")
	public String resMy(Page page, HttpSession session,
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
		

		return "/reservation/resMy";
	};
	
	@RequestMapping(value="registerResInfo.do", method=RequestMethod.POST)
	public String registerResInfo(@ModelAttribute("reservation") Reservation res, @ModelAttribute("room") Room room) {
		resService.registerResInfo(res);
		roomService.updateRoomResStatus(room);
		return "redirect:resMy";
	}
/*
	@RequestMapping(value="registerResPay.do", method=RequestMethod.POST)
	public String registerResPay(@ModelAttribute("reservation") Reservation res) {
		resService.registerResPay(res);
		return "redirect:resInfo";
	} */
}
