package com.madana.webclient.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/cookies")
public class CookieService {


	@RequestMapping(value = "/styles", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public String getProcessors(@CookieValue(value = "style", defaultValue = "madana") String stylename, @Context  HttpServletRequest request)
	{

		return stylename;

	}
	@RequestMapping(value = "/styles", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String setLightStyle(HttpServletResponse response, @RequestParam(required = true) String  style, @Context  HttpServletRequest request)
	{

		Cookie cookie = new Cookie("style", style);
		cookie.setPath("/");
		cookie.setMaxAge(60 * 60 * 24 * 365 * 10); // Setting expiry to 10 years -> in general never
		response.addCookie(cookie);
		return style+" set as style";

//				return Response.status(Response.Status.OK).entity(style+" set as style").build();

	}


}

