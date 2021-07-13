package hotel.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.common.domain.Page;
import hotel.user.domain.User;
import hotel.user.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserAdminController {
	@Autowired
	private UserService userService;

	@GetMapping("/listUser") 
	public String listUser(Page page,HttpSession session,
			@RequestParam(value="nowPage", required=false)String nowPage
			,@RequestParam(value="cntPerPage",required=false)String cntPerPage) {
		
		int total = userService.getUsersCnt();
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

		session.setAttribute("users", userService.getUsers(page));

		return "/admin/user/listUser";
	};
	
   @RequestMapping("/userInfo")
   public ModelAndView userInfo(@RequestParam(value ="testId",defaultValue="null")String userId,HttpServletRequest req,HttpSession session) {
      ModelAndView mv = new ModelAndView();
      mv.setViewName("admin/user/userInfo");
      User user = new User();
      user = userService.getUser(userId);
      session.setAttribute("users", user);
      return mv;
   }
	
	@Transactional
	@RequestMapping("/modUser")
	public String modUser() {
		return "admin/user/modUser";
	}
	
	@RequestMapping("/chnage")
	@ResponseBody
	public void modiUser(User user) {
		userService.updateUser(user);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public void delUser(User user) {
		userService.deleteUser(user);
	}
}