package com.kedu.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.kedu.domain.LoginDto;
import com.kedu.domain.UserDto;
import com.kedu.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("lDto") LoginDto lDto){
		
	}
	
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDto lDto, HttpSession session, Model model) throws Exception{
		
		UserDto uDto = service.login(lDto);
		
		if(uDto == null){
			return;
		}
		
		model.addAttribute("userDto", uDto);
		
		if(lDto.isUseCookie()){
			int amount = 60 * 60 * 24 * 7;
			
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			
			service.keepLogin(uDto.getUid(), session.getId(), sessionLimit);
		}
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		
		Object loginSession = session.getAttribute("login");
		
		if(loginSession != null){
			UserDto uDto = (UserDto)loginSession;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(uDto.getUid(), session.getId(), new Date());
			}
		}
		return "main/index";
	}
}
