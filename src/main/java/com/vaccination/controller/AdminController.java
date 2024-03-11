//***********************github.com/AkshayTR2023*************************//
package com.vaccination.controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vaccination.entity.AdminUser;
import com.vaccination.service.AdminUserService;

@Controller
public class AdminController {
	@Autowired
	AdminUserService adminService;

	@RequestMapping("/")
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/home");
		response.setStatus(response.getStatus());
		return modelAndView;
	}

	@PostMapping("/login")
	public ModelAndView adminLogin(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ModelAndView modelAndView = new ModelAndView();
		AdminUser user1 = adminService.getByUserName(username);
		if (user1 == null) {
			modelAndView.setViewName("/loginUser404");
			return modelAndView;
		}
		AdminUser user2 = adminService.getByUserNamePwd(username, password);
		if (user2 == null) {
			modelAndView.setViewName("/loginError");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			modelAndView.addObject("user", user2);
			modelAndView.setViewName("adminDashboard");
		}
		return modelAndView;
	}

	@PostMapping("/register")
	public ModelAndView adminRegister(HttpServletRequest request, HttpServletResponse response) {
		Logger log = Logger.getAnonymousLogger();
		AdminUser user = new AdminUser();
		log.info("inside reg - method");
		user.setUsername(request.getParameter("username"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		log.info(request.getParameter("username") + request.getParameter("email") + request.getParameter("password"));
		ModelAndView modelAndView = new ModelAndView();
		String check = adminService.registerUser(user);
		log.info(check);
		if (check.equals("Duplicate username") || check.equals("Duplicate email")) {
			modelAndView.addObject("errorMsg", check);
			modelAndView.setViewName("/registerError");
		} else {
			modelAndView.setViewName("/registerSuccess");
		}
		return modelAndView;
	}

}
