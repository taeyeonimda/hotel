package hotel.user.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import hotel.user.domain.User;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)throws Exception{
		boolean isLogin = true;

		if(!request.getRequestURI().equals("/hotel/user/login")) {
			User user = (User)request.getSession().getAttribute("user");
			if(user==null) {
				response.sendRedirect("/hotel/user/logon");
				isLogin = false;
			}
		}
		return isLogin;
	}
}
