/**
 * 
 */
package com.madana.webclient.controller;

import javax.servlet.http.HttpSession;
import javax.ws.rs.DefaultValue;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.madana.common.security.RandomString;
import com.madana.webclient.exceptions.ClientNotInitizializedException;
import com.madana.webclient.system.SessionHandler;

/**
 * @author J.-Fabian Wenisch
 *
 */
@Controller
@Scope("session")
public class AuthController 
{
	@RequestMapping(value = "/auth/facebook", method = RequestMethod.GET)
	public String authFacebook(HttpSession session, Model model) throws ClientNotInitizializedException 
	{
		return "redirect:"+ SessionHandler.getClient(session).getFacebookAuthURL();
	}
	@RequestMapping(value = "/auth/fractal", method = RequestMethod.GET)
	public String authFractal(HttpSession session,Model model) throws ClientNotInitizializedException 
	{
		String strRandom=new RandomString(64).nextString();
		session.setAttribute("fractal_state", strRandom);
		return "redirect:"+ SessionHandler.getClient(session).getFractalAuthURL()+"&state="+strRandom+"&response_type=code";
	}
	@RequestMapping(value = "/auth/fractal/callback" , method = RequestMethod.GET)
	public String setFractalID(HttpSession session,@DefaultValue("")@RequestParam("state") String state,
			@DefaultValue("")@RequestParam("code") String code, Model model) throws ClientNotInitizializedException 
	{
		if(state.equals(session.getAttribute("fractal_state")))
			SessionHandler.getClient(session).setFractalUID(code);
		return "redirect:/home";
	}
	@RequestMapping(value = "/auth/twitter", method = RequestMethod.GET)
	public String authTwitter(HttpSession session,Model model) throws ClientNotInitizializedException 
	{
		return "redirect:"+ SessionHandler.getClient(session).getTwitterAuthURL();
	}
	@RequestMapping(value = "/auth/twitter/callback" , method = RequestMethod.GET)
	public String setTwitterUserID(HttpSession session, @RequestParam("oauth_token") String token, @RequestParam("oauth_verifier") String verifier, Model model ,   final RedirectAttributes redirectAttributes) throws ClientNotInitizializedException 
	{
		try
		{
			SessionHandler.getClient(session).setTwitterUID(token,verifier);
		}
		catch(Exception e)
		{
			redirectAttributes.addFlashAttribute("error", "Could not verifiy Twitter" +e.getMessage());
		}
		return "redirect:/home";
	}

	@RequestMapping(value = "/auth/facebook/callback" , method = RequestMethod.GET)
	public String setFacebookUserID(HttpSession session, @RequestParam("code") String code, Model model) throws ClientNotInitizializedException 
	{
		SessionHandler.getClient(session).setFacebookUID(code);
		return "redirect:/home";
	}

	@RequestMapping(value = "/auth/ethereum" , method = RequestMethod.GET)
	public String authEthereumWallet(HttpSession session, Model model)
	{
		return "ethereum";
	}

	@RequestMapping(value = "/auth/ethereum", method = RequestMethod.POST, params = "wallet", produces = "application/json")
	public String getEthereumVerificationNonce(HttpSession session, @RequestParam("wallet") String wallet, Model model) throws ClientNotInitizializedException 
	{
		try {
			String nonce = SessionHandler.getClient(session).getEthereumVerificationNonce(wallet);
			model.addAttribute("nonce", nonce );
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
		}

		return "ethereum";
	}
	
	@RequestMapping(value = "/auth/ethereum", method = RequestMethod.POST, params = { "wallet", "nonce", "signature" }, produces = "application/json")
	public String getEthereumVerificationNonce(HttpSession session, @RequestParam("wallet") String wallet, @RequestParam("nonce") String nonce, @RequestParam("signature") String signature, Model model) throws ClientNotInitizializedException 
	{
		try {
			SessionHandler.getClient(session).verifyEthereumWallet(wallet, nonce, signature);
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			return "ethereum";
		}
		return "redirect:/home/";
	}

}
