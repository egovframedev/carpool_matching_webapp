package com.carto.common.inteceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null) {
			log.info("clear login data before");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object memberDTO = modelMap.get("memberDTO");
		
		if(memberDTO != null) {
			log.info("로그인 성공!! .....");
			session.setAttribute(LOGIN, memberDTO);
			
			if(request.getParameter("useCookie") != null) { // useCookie 에 체크 되면
				log.info("remember me.......................");
				Cookie loginCookie = new Cookie("loginCookie", session.getId()); // 로그인 쿠키 생성.
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*60*24*7); // 일주일간 저장.
				response.addCookie(loginCookie);
			}
			
			//response.sendRedirect("/");
			Object dest = session.getAttribute("dest");
			
			log.info(dest);
			response.sendRedirect(dest != null ? (String)dest: request.getContextPath());
		}
	}
}
