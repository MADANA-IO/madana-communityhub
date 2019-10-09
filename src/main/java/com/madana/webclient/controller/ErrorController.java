/**
 * 
 */
package com.madana.webclient.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author J.-Fabian Wenisch
 *
 */
@Controller
@Scope("session")
public class ErrorController 
{
	@RequestMapping(value = "/error_404", method = RequestMethod.GET)
	public String loaderror(HttpServletRequest request, HttpSession session,Model model) 
	{
		model.addAttribute("uri",request.getHeader("Referer") );
		return "error_404";
	}
}
