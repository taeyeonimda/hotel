package hotel.room.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import hotel.common.domain.Page;
import hotel.room.domain.Room;
import hotel.room.domain.RoomType;
import hotel.room.service.RoomService;

@Controller
@RequestMapping
public class UserRoomController {
	@Autowired private RoomService roomService;
	
	@ExceptionHandler(NullPointerException.class)
    public void exception(HttpServletResponse response) throws IOException {
       response.setContentType("text/html; charset=UTF-8");       
       PrintWriter out = response.getWriter();      
       out.println("<script>alert('객실이 없습니다.'); location.href='../';</script>");       
       out.flush();
    }
	
	@ResponseBody
	@RequestMapping("/room/roomInfo")
	public @ModelAttribute("room")RoomType roomInfo(Page page, Model model,
			@RequestParam(value="roomType", required=false) String roomTypeText,
			@RequestParam(value="nowPage", required=false)String nowPage
	         ,@RequestParam(value="cntPerPage",required=false)String cntPerPage){
	      int total = roomService.getRoomTypesCnt();
	      if(nowPage ==null && cntPerPage ==null) { 
	         nowPage ="1";
	         cntPerPage ="5";
	      }else if(nowPage ==null) {
	         nowPage ="1";
	      }else if(cntPerPage ==null) {
	         cntPerPage = "5";
	      }
	      page = new Page(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));		
		model.addAttribute("roomTypeList", roomService.getRoomTypes(page));
		
		RoomType chooseroom = new RoomType();
		chooseroom = roomService.getRoomType(roomTypeText);
				
		model.addAttribute("chooseRoom", chooseroom);
		
		RoomType showRoomType = new RoomType();
		showRoomType.setRoomType(roomTypeText);
		showRoomType.setRoomInfo(chooseroom.getRoomInfo());
		showRoomType.setRoomBed(chooseroom.getRoomBed());
		showRoomType.setRoomPerCnt(chooseroom.getRoomPerCnt());
		showRoomType.setRoomPrice(chooseroom.getRoomPrice());
		showRoomType.setAttachName1(chooseroom.getAttachName1());
		showRoomType.setAttachName2(chooseroom.getAttachName2());
		showRoomType.setAttachName2(chooseroom.getAttachName3());
		
		model.addAttribute("showRoomType", showRoomType);
		
		Room findRoom = new Room();
		findRoom = roomService.findRoom(roomTypeText);
		
		findRoom.getRoomNum();
		model.addAttribute("findRoom", findRoom);
		
		return roomService.getRoomType(roomTypeText);
	}
}
