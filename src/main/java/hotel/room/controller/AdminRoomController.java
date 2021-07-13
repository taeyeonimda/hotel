package hotel.room.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import hotel.common.domain.Page;
import hotel.room.domain.Room;
import hotel.room.domain.RoomType;
import hotel.room.service.RoomService;

@Controller
@RequestMapping("/admin/room")
public class AdminRoomController {
	@Value("${attachDir}")private String attachDir;
	@Autowired private RoomService roomService;
	
	@ExceptionHandler(NullPointerException.class)
    public void exception(HttpServletResponse response) throws IOException {
       response.setContentType("text/html; charset=UTF-8");       
       PrintWriter out = response.getWriter();      
       out.println("<script>alert('객실타입이 없습니다.'); location.href='roomTypeList';</script>");       
       out.flush();
    }
   
    @ExceptionHandler(IllegalStateException.class)
    public void exception2(HttpServletResponse response) throws IOException {
       response.setContentType("text/html; charset=UTF-8");       
       PrintWriter out = response.getWriter();      
       out.println("<script>alert('객실이 없습니다.'); location.href='roomList';</script>");       
       out.flush();
    }
	
	//Image
	@RequestMapping("/addImage")
	@ResponseBody
	public boolean upload(MultipartFile file, HttpServletRequest request){
		boolean isStored = true;
		String dir = request.getServletContext().getRealPath(attachDir);
		System.out.println("dir: " + dir);
		String fileName = file.getOriginalFilename();
		try{
			save(dir + "/" + fileName, file);
		} catch (IOException e){
			isStored = false;
		}
		return isStored;
	}
	
	private void save(String fileFullName, MultipartFile uploadFile) throws IOException{
		uploadFile.transferTo(new File(fileFullName));
	}
/*
	@ResponseBody
	@RequestMapping("/roomList")
	public @ModelAttribute("room") List<Room> roomList(Model model,
		@RequestParam(required = false, defaultValue="1") int page,
        @RequestParam(required = false, defaultValue="1") int range,
        @RequestParam(required = false, defaultValue = "roomType") String searchType,
        @RequestParam(required = false) String keyword,
        @ModelAttribute("search") Search search
        ) throws Exception{
  
		//검색
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
	  
		//전체 게시글 개수
		int listCnt = roomService.getRoomsCnt(search);
	  
		search.pageInfo(page, range, listCnt);
	        
		model.addAttribute("pagination",search);   
	      
		return roomService.getRooms(search);
	}
*/
	@GetMapping("/roomList")
	public String roomList(Page page,HttpSession session,
			@RequestParam(value="nowPage", required=false)String nowPage
			,@RequestParam(value="cntPerPage",required=false)String cntPerPage){
		
		int total = roomService.getRoomsCnt();
		if(nowPage ==null && cntPerPage ==null) { 
			nowPage ="1";
			cntPerPage ="5";
		}else if(nowPage ==null) {
			nowPage ="1";
		}else if(cntPerPage ==null) {
			cntPerPage = "5";
		}
		page = new Page(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		session.setAttribute("paging", page);
		session.setAttribute("room", roomService.getRooms(page));
		
		return "/admin/room/roomList";
	}
	
	@RequestMapping("/roomTypeList")
   public String roomTypeList(Page page,HttpSession session,
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

      session.setAttribute("paging", page);
      session.setAttribute("roomTypeList", roomService.getRoomTypes(page));
       return "/admin/room/roomTypeList";
     }  
	
	@ResponseBody
	@RequestMapping("/roomDetail")
	public @ModelAttribute("room") Room roomDetail(@RequestParam(required=false) int roomNum, 
											@ModelAttribute("chooseRoom") Room room, Model model) {	
		
		room = roomService.getRoom(roomNum);
		model.addAttribute("chooseRoom", room); //선택된 방의 객체
		
		Room showRoom = new Room();
		showRoom.setRoomType(room.getRoomType());
		showRoom.setRoomInfo(room.getRoomInfo());
		showRoom.setRoomBed(room.getRoomBed());
		showRoom.setRoomPerCnt(room.getRoomPerCnt());
		showRoom.setRoomPrice(room.getRoomPrice());
		showRoom.setAttachName1(room.getAttachName1());
		showRoom.setAttachName2(room.getAttachName2());
		showRoom.setAttachName3(room.getAttachName3());
		
		model.addAttribute("showRoom", showRoom);
		
		return roomService.getRoom(roomNum);
	}
	
	@ResponseBody
	   @RequestMapping("/roomTypeDetail")
	   public @ModelAttribute("roomType") RoomType roomTypeDetail(@RequestParam(required=false) String roomType, 
	                                 @ModelAttribute("chooseRoomType") RoomType chooseRoomType, Model model) {   
	      
	      chooseRoomType = roomService.getRoomType(roomType);
	      model.addAttribute("chooseRoomType", chooseRoomType); //선택된 방 타입의 객체
	      
	      RoomType showRoomType = new RoomType();
	      showRoomType.setRoomType(chooseRoomType.getRoomType());
	      showRoomType.setRoomInfo(chooseRoomType.getRoomInfo());
	      showRoomType.setRoomBed(chooseRoomType.getRoomBed());
	      showRoomType.setRoomPerCnt(chooseRoomType.getRoomPerCnt());
	      showRoomType.setRoomPrice(chooseRoomType.getRoomPrice());
	      showRoomType.setAttachName1(chooseRoomType.getAttachName1());
	      showRoomType.setAttachName2(chooseRoomType.getAttachName2());
	      showRoomType.setAttachName3(chooseRoomType.getAttachName3());
	      
	      model.addAttribute("showRoomType", showRoomType);
	      
	      return roomService.getRoomType(roomType);
	   }
	
	@RequestMapping("/roomUpdate")
	public String roomUpdate(@RequestParam(required=false) int roomNum, Model model) {
		Room newRoom = roomService.getRoom(roomNum);
		model.addAttribute("room", newRoom);
		return "admin/room/roomUpdate";
	}
	
	@ResponseBody
	@RequestMapping("/roomCorrect")
	public void roomCorrect(Room room) {
		roomService.updateRoom(room);
	}
	
	@RequestMapping("/roomTypeUpdate")
	public String roomUpdate(@RequestParam(required=false) String roomType, Model model) {
		RoomType newRoomType = roomService.getRoomType(roomType);
		model.addAttribute("roomType", newRoomType);
		return "admin/room/roomTypeUpdate";
	}
	
	@ResponseBody
	@RequestMapping("/roomTypeCorrect")
	public void roomCorrect(RoomType roomType) {
		roomService.updateRoomType(roomType);
	}
	
	@RequestMapping("/chkNum")
	@ResponseBody
	public int chkNum(HttpServletRequest req) {
		
		String roomNumIn = req.getParameter("roomNum");
		
		int roomNum = Integer.parseInt(roomNumIn);
		
		Room roomChk = roomService.getRoom(roomNum);
		int result = 0;
		
		if(roomChk !=null) {
			result =1;
		}else {
			result =0;
			roomService.getRoom(roomNum);
		}
		return result;
	}
	
	@RequestMapping("/chkType")
	@ResponseBody
	public int chkType(HttpServletRequest req) {
		
		String roomType = req.getParameter("roomType");
		
		RoomType roomTypeChk = roomService.getRoomType(roomType);
		
		int result2 = 0;
		
		if(roomTypeChk != null) {
			result2 = 1;
		}else {
			result2 = 0;
			roomService.getRoomType(roomType);
		}
		return result2;
	}

	@RequestMapping("/roomAdd")
	   public String roomAdd(Model model,Room room, Page page,HttpSession session,
	         @RequestParam(value="nowPage", required=false)String nowPage
	         ,@RequestParam(value="cntPerPage",required=false)String cntPerPage) {   
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
	      
	      return "admin/room/roomAdd";
	   }
	
	
	@RequestMapping("/roomjoin")
	@ResponseBody
	public void regRoom(Room room) {
		roomService.addRoom(room);
	}
	
	@RequestMapping("/roomTypeAdd")
	public String roomTypeAdd(RoomType roomType) {
		return "admin/room/roomTypeAdd";
	}
	
	@RequestMapping("/roomTypeDel")
	public String delRoomType(String roomType) {
		roomService.delRoomType(roomType);
		return "admin/room/roomTypeList";
	}
	
	@RequestMapping("/roomTypeJoin")
	@ResponseBody
	public void regRoomType(RoomType roomType) {
		roomService.addRoomType(roomType);
	}
}