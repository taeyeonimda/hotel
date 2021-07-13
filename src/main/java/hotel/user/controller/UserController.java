package hotel.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import hotel.user.domain.User;
import hotel.user.service.MailService;
import hotel.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MailService mailService;

	@RequestMapping("/joinForm")
	public String userJoin() {
		return "user/joinForm";
	}

	@Transactional
	@RequestMapping("/join")
	@ResponseBody
	public void regUser(User user) {
		userService.addUser(user);
	}

	@RequestMapping("/logon")
	public String userLogin() {
		return "user/logon";
	}
	
	@Transactional
	@RequestMapping("/login")
	@ResponseBody
	public boolean loginUser(User user,HttpSession session) {
		Boolean result = false;
		User memUser = userService.loginUser(user);
		char status = memUser.getUserStatus();
		
		switch(status) {
		
		case 'D' : result =false;
						break;
		
		case 'A' :
			if(memUser != null) {
				result =true;
				userService.loginUser(user);
				session.removeAttribute("user");
				session.setAttribute("user", user);
			}
		break;
		}
		
		return result;
	}

	@RequestMapping("/logout")
	public String userLogOut(HttpSession session, User user) {
		session.removeAttribute("user");
		session.removeAttribute("userInfo");
		session.removeAttribute("userInfos");
		session.removeAttribute("users");
		return "user/logout";
	}

	@RequestMapping("/userInfo")
	public String userInfo(HttpSession session) {
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		User newUser = new User();
		newUser = userService.getUser(userId);
		session.setAttribute("userInfo", newUser);
		return "user/userInfo";
	}
	
	@Transactional
	@RequestMapping("/modUser")
	public String modUser() {
		return "user/modUser";
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
	
	@RequestMapping("/chkId")
	@ResponseBody
	public int chkIdUser(HttpServletRequest req) {
		
		String userId = req.getParameter("userId");
		User idChk = userService.getUser(userId);
		int result = 0;
		
		if(idChk !=null) {
			result =1;
		}else {
			result =0;
			userService.getUser(userId);
		}
		return result;
	}
	
	@RequestMapping("/chkEmail")
	@ResponseBody
	public int chkMail(HttpServletRequest req) {
		
		String userEmail = req.getParameter("userEmail");
		User chkMail = userService.chkEmail(userEmail);
		int result = 0;
		if(chkMail !=null) {
			result =1;
		}else {
			result =0;
			userService.chkEmail(userEmail);
		}
		return result;
	}
	
	@RequestMapping("/serchId")
	public String userSerchId() {
		return "user/serchId";
	}
	
	@RequestMapping("/findId")
	@ResponseBody
	@Transactional
	public String findId(HttpSession session, User user) {
	String userId = "";
	
	User memUser = userService.serchId(user);
	
	userId= memUser.getUserId();
	
	if(userId != "") {
		userService.serchId(user);
		userId = memUser.getUserId();
	}
	return userId;
	}
	
	@RequestMapping("/serchPw")
	public String userSerchPw() {
		return "user/serchPw";
	}
	
	@RequestMapping("/findPw")
	@ResponseBody
	@Transactional
	public String findPw(User user) {
		String userId = "";
		
		User memUser = userService.serchPw(user);
		
		userId= memUser.getUserId();
		if(userId !="") {
			user = userService.getUser(userId);
			String userEmail = user.getUserEmail();
			userService.serchPw(user);
			mailService.send(user,userEmail);
			userId= memUser.getUserId();
		}
		return userId;
	}
}