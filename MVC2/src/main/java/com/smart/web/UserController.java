package com.smart.web;

import com.smart.domain.User;
import com.smart.service.UserService;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;

//spring MVC的Controller
@Controller
public class UserController {
	private UserService userService;
	
	@RequestMapping(value = "/userDetail.html",method = RequestMethod.GET)
	public ModelAndView userDetail(HttpServletRequest request){
		User user = userService.findUserByUserName(request.getParameter("accountDetail"));
		request.getSession().setAttribute("userDetail",user);
		request.getSession().setAttribute("account",request.getParameter("accountDetail"));
		return new ModelAndView("userDetail");
    }
	@RequestMapping(value = "/userDetail.html",method = RequestMethod.POST)
	public ModelAndView editDetail(HttpServletRequest request){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User user=new User();
		user.setName(request.getParameter("editName"));
		user.setAccount(request.getParameter("editAccount"));
		user.setPasswd(request.getParameter("editPasswd"));
		user.setEmail(request.getParameter("editEmail"));
		user.setGender(request.getParameter("editGender"));
		user.setAge(Integer.parseInt(request.getParameter("editAge")));
		
		userService.editUserData(user);
		
		User userDetail = userService.findUserByUserName(request.getParameter("editAccount"));
		request.getSession().setAttribute("userDetail",userDetail);
		request.getSession().setAttribute("account",request.getParameter("editAccount"));
		request.getSession().setAttribute("editAccountCheck",true);
		return new ModelAndView("userDetail");
    }
	
	
	@RequestMapping(value = "/userDelete.html")
	public ModelAndView userDelete(HttpServletRequest request){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String account=(String)request.getSession().getAttribute("account");
		userService.deleteUserData(account);
		request.getSession().invalidate();
		request.getSession().setAttribute("deleteAccount",account);
		request.getSession().setAttribute("dataLists",userService.findAll());
		return new ModelAndView("main");
    }
	
	@RequestMapping(value = "/main.html")
	public ModelAndView returnMain(HttpServletRequest request){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().invalidate();
		request.getSession().setAttribute("dataLists",userService.findAll());
		return new ModelAndView("main");
    }
	@Autowired
    public void setUserService(UserService userService){
            this.userService = userService;
    }
}
