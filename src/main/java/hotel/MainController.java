package hotel;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hotel.common.domain.Page;
import hotel.query.service.QueryService;
import hotel.room.service.RoomService;
import hotel.user.service.UserService;

@Controller
public class MainController {
	@Autowired private RoomService roomService;
	@Autowired private UserService userService;
	@Autowired private QueryService queryService;
	
	@RequestMapping("/")
	   public String userMain(Model model, Page page,HttpSession session,
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
	      return "/main";
	   }
	
	@RequestMapping("/admin")
	public String adminMain(Model model, Page page,   
			@RequestParam(value="nowPage", required=false)String nowPage,
            @RequestParam(value="cntPerPage",required=false)String cntPerPage)
	{
		 
		model.addAttribute("todayCnt", userService.todayCnt());
        
		int total = queryService.getQuerysCnt();
        if(nowPage ==null && cntPerPage ==null) { 
          nowPage ="1";
          cntPerPage ="5";
       }else if(nowPage ==null) {
          nowPage ="1";
       }else if(cntPerPage ==null) {
          cntPerPage = "5";
       }
        page = new Page(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging",page);
        model.addAttribute("querys",queryService.listQuerys(page));
		return "/admin/main";
	}
	
	@RequestMapping("/common/myPage")
	public String myPage(Model model, Page page,HttpSession session,
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
	      return "/common/myPage";
	}

	@RequestMapping("/map/mapInfo")
	public String mapInfo(Model model, Page page,HttpSession session,
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
	      return "/map/mapInfo";
	}
}
