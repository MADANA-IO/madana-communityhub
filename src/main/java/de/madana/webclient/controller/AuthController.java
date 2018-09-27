/**
 * 
 */
package de.madana.webclient.controller;

import javax.servlet.http.HttpSession;
import javax.ws.rs.DefaultValue;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import de.madana.common.restclient.MDN_RestClient;
import de.madana.security.MDN_RandomString;

/**
 * @author J.-Fabian Wenisch
 *
 */
@Controller
@Scope("session")
public class AuthController 
{
	@RequestMapping(value = "/auth/facebook", method = RequestMethod.GET)
	public String authFacebook(HttpSession session, Model model) 
	{
		return "redirect:"+ ((MDN_RestClient) session.getAttribute("oClient")).getFacebookAuthURL();
	}
	@RequestMapping(value = "/auth/fractal", method = RequestMethod.GET)
	public String authFractal(HttpSession session,Model model) 
	{
		String strRandom=new MDN_RandomString(64).nextString();
		session.setAttribute("fractal_state", strRandom);
		return "redirect:"+ ((MDN_RestClient) session.getAttribute("oClient")).getFractalAuthURL()+"&state="+strRandom+"&response_type=code";
	}
	@RequestMapping(value = "/auth/fractal/callback" , method = RequestMethod.GET)
	public String setFractalID(HttpSession session,@DefaultValue("")@RequestParam("state") String state,
			@DefaultValue("")@RequestParam("code") String code, Model model) 
	{
		if(state.equals(session.getAttribute("fractal_state")))
			((MDN_RestClient) session.getAttribute("oClient")).setFractalUID(code);
		return "redirect:/home";
	}
	@RequestMapping(value = "/auth/twitter", method = RequestMethod.GET)
	public String authTwitter(HttpSession session,Model model) 
	{
		return "redirect:"+ ((MDN_RestClient) session.getAttribute("oClient")).getTwitterAuthURL();
	}
	@RequestMapping(value = "/auth/twitter/callback" , method = RequestMethod.GET)
	public String setTwitterUserID(HttpSession session, @RequestParam("oauth_token") String token, @RequestParam("oauth_verifier") String verifier, Model model) 
	{
		((MDN_RestClient) session.getAttribute("oClient")).setTwitterUID(token,verifier);
		return "redirect:/home";
	}

	@RequestMapping(value = "/auth/facebook/callback" , method = RequestMethod.GET)
	public String setFacebookUserID(HttpSession session, @RequestParam("code") String code, Model model) 
	{
		((MDN_RestClient) session.getAttribute("oClient")).setFacebookUID(code);
		return "redirect:/home";
	}
}