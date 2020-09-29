package com.madana.webclient.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.madana.common.datastructures.MDN_SimpleUserProfile;
import com.madana.common.restclient.MDN_RestClient;
import com.madana.webclient.exceptions.ClientNotInitizializedException;
import com.madana.webclient.system.SessionHandler;

@Controller
@Scope("session")
@RequestMapping("/session")
public class SessionController {


	@RequestMapping(value = "/ranking/top", method = RequestMethod.GET)
	@ResponseBody
	public List<MDN_SimpleUserProfile> getSystemlog(HttpSession session) throws ClientNotInitizializedException {
		MDN_RestClient client = SessionHandler.getClient(session);
		List<MDN_SimpleUserProfile> oUsers = client.getRanking(0,5);
		List<MDN_SimpleUserProfile> topUsers = new ArrayList<MDN_SimpleUserProfile>();
		if(oUsers.size()>2)
		{
			Collections.sort(oUsers);
			topUsers.add(oUsers.get(0));
			topUsers.add(oUsers.get(1));
			topUsers.add(oUsers.get(2));
		}
		return topUsers;
	}

}
