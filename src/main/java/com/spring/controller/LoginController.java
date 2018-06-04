package com.spring.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.dto.MDN_DTO_RegisterUser;

@Controller
@Scope("session")
public class LoginController 
{
	MDN_RestClient oClient =  new MDN_RestClient("http://localhost:8080/rest/rest/");
	String strUserName="ANONYMOUS";
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String init(Model model) 
	{
		model.addAttribute("msg", "Please Enter Your Login Details");
		return "login";
	}


	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView registerdddPage() 
	{

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Custom Login Form");
		model.addObject("message", "This is welcome page!");
		model.setViewName("register");
		return model;

	}
	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public ModelAndView successPage() 
	{

		ModelAndView model = new ModelAndView();
		return model;

	}
	@RequestMapping(value = "/success", method = RequestMethod.POST)
	public void successAction(Model model)
	{
		oClient.deleteUser(strUserName);
		model.addAttribute("msg", "account deleted");
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String submit(Model model, @ModelAttribute("MDN_DTO_RegisterUser") MDN_DTO_RegisterUser user) 
	{
		
		if (user != null && user.getUsername()!= null & user.getPassword() != null) 
		{
			if( user.getPassword().equals(user.getMatchingPassword()))
			{
				try 
				{
					if (oClient.createUser(user.getUsername(), user.getPassword(), user.getEmail())) ;
					{
						model.addAttribute("msg", user.getUsername());
						return "login";
					} 
				} catch (Exception e) 
				{
					model.addAttribute("error", e.toString());
					return "register";
				}
			}
			else
			{
				model.addAttribute("error", "Passwords not matching");
				return "register";
			}
		} 
		else 
		{
			model.addAttribute("error", "Please enter Details");
			return "register";
		}
	}
	@RequestMapping(method = RequestMethod.POST)
	public String submit(Model model, @ModelAttribute("loginBean") LoginBean loginBean) 
	{
		if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) 
		{
			try 
			{
				if (oClient.logon(loginBean.getUserName(), loginBean.getPassword())) 
				{
					model.addAttribute("msg", loginBean.getUserName());
					strUserName=loginBean.getUserName();
					return "success";
				} else 
				{
					model.addAttribute("error", "Invalid Details");
					return "login";
				}
			} catch (Exception e) 
			{
				model.addAttribute("error", "Invalid Details");
				return "login";
			}
		} 
		else 
		{
			model.addAttribute("error", "Please enter Details");
			return "login";
		}
	}

}
