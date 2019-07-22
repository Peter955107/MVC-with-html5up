package com.smart.web;

import com.smart.domain.User;
import com.smart.service.UserService;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//spring MVC的Controller
@Controller
public class signUpController {
	private UserService userService;

    @RequestMapping(value = "/signUp.html")
    public String signUpPage(){ return "signUp"; }
    
    @RequestMapping(value = "/signUpCheck.html")
    public ModelAndView loginCheck(HttpServletRequest request){
    	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    boolean isValidUser = userService.hasMatchUser(request.getParameter("signUpAccount"));
	    if (!isValidUser){
	    	User user=new User();
	    	user.setAccount(request.getParameter("signUpAccount"));
	    	user.setName(request.getParameter("signUpName"));
	    	user.setPasswd(request.getParameter("signUpPasswd"));
	    	user.setEmail(request.getParameter("signUpEmail"));
	    	user.setGender(request.getParameter("signUpGender"));
	    	user.setAge(Integer.parseInt(request.getParameter("signUpAge")));
	    	userService.createAccount(user);
	    	request.getSession().invalidate();
	        return new ModelAndView("signUpSuccess");
	    }
	    else{
	        request.getSession().setAttribute("accountCheck",false);
	        return new ModelAndView("signUp");
	    }
    }
	
    @Autowired
    public void setUserService(UserService userService){
            this.userService = userService;
    }
}
