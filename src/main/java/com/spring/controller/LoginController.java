package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import de.madana.common.restclient.MDN_RestClient;

@Controller
public class LoginController 
{
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String init(Model model) 
	{
		model.addAttribute("msg", "Please Enter Your Login Details");
		return "login";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(Model model, @ModelAttribute("loginBean") LoginBean loginBean) 
	{
		MDN_RestClient oClient = new MDN_RestClient();
		if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) 
		{
			if (loginBean.getUserName().equals("chandra") && loginBean.getPassword().equals("chandra123")) 
			{
				model.addAttribute("msg", loginBean.getUserName());
				return "success";
			} else 
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
