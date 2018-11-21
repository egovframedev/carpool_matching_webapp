package com.carto.common.inteceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.carto.member.domain.MemberDTO;
import com.carto.member.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private MemberService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			log.info("current user is not logined");
			saveDest(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null) {
				MemberDTO member = service.checkLoginBefore(loginCookie.getValue());
				log.info("LOGIN_MEMBER: " + member);
				
				if(member != null) {
					session.setAttribute("login",  member);
					return true;
				}
			}
			
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return true;
	}
	
	private void saveDest(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			log.info("dest: " + (uri + query));
			request.getSession().setAttribute("dest", uri + query);
		}
	}
}
