/*******************************************************************************
 * Copyright (C) 2018 MADANA
 * 
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * @organization:MADANA
 * @author:Jean-Fabian Wenisch
 * @contact:dev@madana.io
 ******************************************************************************/
package com.madana.webclient.controller;

import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.madana.common.datastructures.MDN_MailAddress;
import com.madana.common.datastructures.MDN_PasswordReset;
import com.madana.common.datastructures.MDN_User;
import com.madana.common.datastructures.MDN_UserCredentials;
import com.madana.common.datastructures.MDN_UserProfile;
import com.madana.common.datastructures.MDN_UserSetting;
import com.madana.common.restclient.MDN_RestClient;
import com.madana.webclient.bean.LoginBean;
import com.madana.webclient.bean.ResetPasswordBean;
import com.madana.webclient.bean.SetPasswordBean;
import com.madana.webclient.dto.RegisterUser;
import com.madana.webclient.exceptions.ClientNotInitizializedException;
import com.madana.webclient.system.BackendHandler;
import com.madana.webclient.system.SessionHandler;

@Controller
@Scope("session")
public class LoginController 
{

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loadFrontPage(HttpSession session,Model model) 
	{
		return "redirect:/home/";
	}

	@RequestMapping(value = "/start", method = RequestMethod.GET)
	public String loadStartPage(HttpSession session,Model model) 
	{
		return "index";
	}

	@RequestMapping(value = "/resetpassword/{token}", method = RequestMethod.GET)
	public String loadResetPassword(Model model,@PathVariable("token") String token) 
	{
		return "setpassword";
	}
	@RequestMapping(value = "/intro", method = RequestMethod.GET)
	public String loadIntro(Model model) 
	{
		return "introslider";
	}
	@RequestMapping(value = "/resetpassword/{token}", method = RequestMethod.POST)
	public String submitResetPassword(HttpSession session,Model model,  @RequestParam(value = "captchatoken", required=false) String captchatoken, @PathVariable("token") String token, @ModelAttribute("MDN_DTO_SetPassword") SetPasswordBean oNewPassword,  final RedirectAttributes redirectAttributes) 
	{
		if(!BackendHandler.getInstance().verifyGoogleCaptcha(captchatoken))
		{
			model.addAttribute("error", "We couldn't verify that you are a human");
			return "redirect:/resetpassword/"+token;
		}
		if (oNewPassword.getEmail()!= null && oNewPassword.getEmail().length()>3 && oNewPassword.getEmail().contains("@")) 
		{
			if( oNewPassword.getPassword().equals(oNewPassword.getMatchingPassword()))
				try 
			{

					MDN_PasswordReset oReset = new MDN_PasswordReset();
					oReset.setMail(oNewPassword.getEmail());
					oReset.setPassword(oNewPassword.getPassword());
					oReset.setToken(token);

					if (SessionHandler.getClient(session).setNewPassword(oReset)) ;
					{
						model.addAttribute("info", "Login with your new password");
						return "redirect:/login";
					} 
			} catch (Exception e) 
			{
				redirectAttributes.addFlashAttribute("error",  e.toString());
				return "redirect:/resetpassword/"+token;
			}

		} 
		redirectAttributes.addFlashAttribute("error",  "Please enter details");
		return "redirect:/resetpassword/"+token;

	}
	@RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
	public String loadRequestPassword(Model model) 
	{
		return "resetpassword";
	}
	@RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
	public String submitResetPassword(HttpSession session,Model model,  @RequestParam(value = "captchatoken", required=false) String captchatoken, @ModelAttribute("MDN_DTO_ResetPassword") ResetPasswordBean mail,final RedirectAttributes redirectAttributes) 
	{

		if(!BackendHandler.getInstance().verifyGoogleCaptcha(captchatoken))
		{
			model.addAttribute("error", "We couldn't verify that you are a human");
			return "resetpassword";
		}
		if (mail.getMail()!= null && mail.getMail().length()>3 && mail.getMail().contains("@")) 
		{

			try 
			{
				MDN_MailAddress oMail = new MDN_MailAddress();
				oMail.setMail(mail.getMail());
				if (SessionHandler.getClient(session).requestNewPassword(oMail)) ;
				{
					redirectAttributes.addFlashAttribute("info", "You'll receive an mail in a few moments");
					return "redirect:/login";
				} 
			} catch (Exception e) 
			{
				model.addAttribute("error", e.toString());
				return "resetpassword";
			}

		} 
		else 
		{
			model.addAttribute("error", "Please enter Details");
			return "resetpassword";
		}
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView loadRegisterPage(HttpSession session,@RequestParam(value = "intro", required=false) String intro, @RequestParam(value = "referrer", required=false) String strToken) 
	{
		if(strToken!=null)
			session.setAttribute("ref", strToken);
		ModelAndView model = new ModelAndView();
		if(intro==null)
		{
			model.setViewName("introslider");
		}
		else
		{
			model.setViewName("registerSelect");
		}

		return model;

	}
	@RequestMapping(value = "/register/basic", method = RequestMethod.GET)
	public ModelAndView loadRegisterBasicPage(HttpSession session, @RequestParam(value = "referrer", required=false) String strToken) 
	{
		if(strToken!=null)
			session.setAttribute("ref", strToken);
		ModelAndView model = new ModelAndView();

		model.setViewName("register");


		return model;

	}

	@RequestMapping(value = "/activate/{token}", method = RequestMethod.GET)
	public String loadRegisterPage(HttpSession session,Model model, @PathVariable("token") String token, final RedirectAttributes redirectAttributes) throws ClientNotInitizializedException 
	{

		boolean bActivated = SessionHandler.getClient(session).validateActivationToken(token);
		if(bActivated)
		{
			redirectAttributes.addFlashAttribute("info", "Account activated!" );
		}
		else
		{
			redirectAttributes.addFlashAttribute("error", "Invalid Activation Code" );
		}
		return "redirect:/login";
	}


	@RequestMapping(value = "/register/basic", method = RequestMethod.POST)
	public String submitRegisterPage(HttpSession session,@RequestParam(value = "TOC", required=false) String read, @RequestParam(value = "captchatoken", required=false) String captchatoken, @RequestParam(value = "referrer", required=false) String strToken, Model model, @ModelAttribute("RegisterUser") RegisterUser user,final RedirectAttributes redirectAttributes) 
	{
		if(read== null)
		{
			model.addAttribute("error", "Please read, understand and accept the Privacy Policy and Terms of Use Agreement");
			return "register";
		}
		if(!BackendHandler.getInstance().verifyGoogleCaptcha(captchatoken))
		{
			model.addAttribute("error", "We couldn't verify that you are a human");
			return "register";
		}
		if (user != null && user.getUsername()!= null & user.getPassword() != null) 
		{
			if( user.getPassword().equals(user.getMatchingPassword()))
			{

				try 
				{

					if(session.getAttribute("ref")!=null)
						strToken =(String) session.getAttribute("ref");
					if (SessionHandler.getClient(session).createUser(user.getUsername(), user.getPassword(), user.getEmail(), strToken)) ;
					{
						redirectAttributes.addFlashAttribute("info", "Account created");
						return "redirect:/login";
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
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loadLoginPage( @RequestParam(value="msg", required=false) String msg,  @RequestParam(value="requesturi", required=false) String requesturi, Model model) 
	{

		if (requesturi != null )
		{
			model.addAttribute("requesturi", requesturi );
		}
		if(msg!=null)
		{
			model.addAttribute("error", msg );
		}
		return "login";
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String loadLogoutPage(HttpSession session,Model model) 
	{

		session.invalidate();
		model.addAttribute("info", "See you soon mate!" );

		return "redirect:/login";
	}



	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submitLoginPage(HttpSession session,Model model,  @RequestParam(value="requesturi", required=false) String requesturi, @RequestParam(value = "captchatoken", required=false) String captchatoken, @ModelAttribute("loginBean") LoginBean loginBean, final RedirectAttributes redirectAttributes) 
	{
		if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) 
		{

			try 
			{
				MDN_RestClient oClient =  SessionHandler.getClient(session);
				session.setAttribute("oClient", oClient);


				if(!BackendHandler.getInstance().verifyGoogleCaptcha(captchatoken))
				{
					model.addAttribute("error", "We couldn't verify that you are a human");
					return "login";
				}
				SessionHandler.validateLoginAttempts(session);
				if (oClient.logon(loginBean.getUserName(), loginBean.getPassword())) 
				{

					SessionHandler.setSuccessfulLogin(session, loginBean.getUserName());
					String strUserName = SessionHandler.getCurrentUser(session);
					
				
					MDN_User oUser = oClient.getUser(loginBean.getUserName());
					MDN_UserProfile	oProfile= oClient.getProfile(strUserName);
					session.setAttribute("user", oUser);
					session.setAttribute("profile", oProfile);
					redirectAttributes.addFlashAttribute("msg", loginBean.getUserName());
					if(requesturi!=null)
						return "redirect:"+requesturi;

					return "redirect:/home";
				} else 
				{
					model.addAttribute("error", "Invalid Details");
					return "login";
				}
			} catch (Exception e) 
			{
				model.addAttribute("error",e.getMessage());
				return "login";
			}
		} 
		else 
		{
			model.addAttribute("error", "Please enter Details");
			return "login";
		}
	}
	@RequestMapping(value = "/deleteaccount", method = RequestMethod.GET)
	public ModelAndView loadAccountDeletionPage(HttpSession session) 
	{
		ModelAndView model = new ModelAndView();
		model.setViewName("deleteAccount");
		return model;
	}

	@RequestMapping(value = "/deleteaccount", method = RequestMethod.POST)
	public String submitAccountDeletionPage(HttpSession session,@RequestParam(value = "del", required=false) String del, @RequestParam(value = "TOC", required=false) String read, @RequestParam(value = "captchatoken", required=false) String captchatoken, @RequestParam(value = "referrer", required=false) String strToken, Model model, @ModelAttribute("RegisterUser") RegisterUser user,final RedirectAttributes redirectAttributes) 
	{
		if(read== null)
		{
			model.addAttribute("error", "Please read, understand and accept the Privacy Policy and Terms of Use Agreement");
			return "deleteAccount";
		}
		if(del== null)
		{
			model.addAttribute("error", "Please check that you want to delete your account");
			return "deleteAccount";
		}
		if(!BackendHandler.getInstance().verifyGoogleCaptcha(captchatoken))
		{
			model.addAttribute("error", "We couldn't verify that you are a human");
			return "deleteAccount";
		}

		try 
		{
			SessionHandler.getClient(session).deleteUser(SessionHandler.getCurrentUser(session));
			redirectAttributes.addFlashAttribute("error", "Account deleted");
			return "redirect:/login";
		} catch (ClientNotInitizializedException e)
		{
			redirectAttributes.addFlashAttribute("error", "Please sign in to delete your account");
			redirectAttributes.addFlashAttribute("requesturi","/deleteAccount");
			return "redirect:/login";

		} catch (Exception e) 
		{
			model.addAttribute("error", e.toString());
			return "deleteAccount";
		}



	}
	@RequestMapping(value = "/login/ethereum" , method = RequestMethod.GET)
	public String authEthereumWallet(HttpSession session, Model model)
	{
		return "ethereum";
	}
	@RequestMapping(value = "/login/ethereum", method = RequestMethod.POST, params = "wallet", produces = "application/json")
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

	@RequestMapping(value = "/login/ethereum", method = RequestMethod.POST, params = { "wallet", "nonce", "signature" }, produces = "application/json")
	public String getEthereumVerificationNonce(HttpSession session, @RequestParam("wallet") String wallet, @RequestParam("nonce") String nonce, @RequestParam("signature") String signature, Model model) throws ClientNotInitizializedException 
	{
		try {
			SessionHandler.getClient(session).loginWithWeb3(wallet, nonce, signature);
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
			return "ethereum";
		}
		return "redirect:/home/";
	}
	@RequestMapping(value = "/register/ethereum" , method = RequestMethod.GET)
	public String initWallet(HttpSession session, Model model)
	{
		return "registerEthereum";
	}

	@RequestMapping(value = "/register/ethereum", method = RequestMethod.POST, params = "wallet", produces = "application/json")
	public String getEthereumVerificationNonceForRegistration(HttpSession session, @RequestParam("wallet") String wallet, Model model) throws ClientNotInitizializedException 
	{
		try {
			String nonce = SessionHandler.getClient(session).getEthereumVerificationNonce(wallet);
			model.addAttribute("nonce", nonce );
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());
		}

		return "registerEthereum";
	}

	@RequestMapping(value = "/register/ethereum", method = RequestMethod.POST, params = { "wallet", "nonce", "signature" }, produces = "application/json")
	public String registerWithEthereum(HttpSession session, @RequestParam("wallet") String wallet, @RequestParam("nonce") String nonce, @RequestParam("signature") String signature,@RequestParam(value = "captchatoken", required=false) String captchatoken, @RequestParam(value = "referrer", required=false) String strToken,@RequestParam("email") String email,@RequestParam("username") String username,@RequestParam("read") String read, Model model, final RedirectAttributes redirectAttributes) throws ClientNotInitizializedException 
	{

		if(read.equalsIgnoreCase("false") | read== null)
		{

			redirectAttributes.addFlashAttribute("error", "Please read, understand and accept the Privacy Policy and Terms of Use Agreement");
			return "redirect:/register/ethereum";
		}
		if(!BackendHandler.getInstance().verifyGoogleCaptcha(captchatoken))
		{

			redirectAttributes.addFlashAttribute("error", "We couldn't verify that you are a human");
			return "redirect:/register/ethereum";
		}
		if (username.length()>0 && username!= null && email.length()>0 && email!= null) 
		{

			try 
			{

				if(session.getAttribute("ref")!=null)
					strToken =(String) session.getAttribute("ref");

				MDN_User oUser = new MDN_User();
				oUser.setMail(email);

				MDN_UserCredentials oCredentials = new MDN_UserCredentials();
				oCredentials.setPassword("");
				oCredentials.setUsername(username);
				oUser.setCredentials(oCredentials);

				List<MDN_UserSetting> settings = new ArrayList<MDN_UserSetting>();
				MDN_UserSetting ethSetup = new MDN_UserSetting();
				ethSetup.setDescription("ethereum");
				ethSetup.setName(wallet);
				ethSetup.setId(nonce);
				ethSetup.setValue(signature);
				settings.add(ethSetup);
				oUser.setSettings(settings);
				if (SessionHandler.getClient(session).createUser(oUser, strToken)!=null) ;
				{
					redirectAttributes.addFlashAttribute("info", "Account created");
					return "redirect:/login";
				} 
			} catch (Exception e) 
			{

				redirectAttributes.addFlashAttribute("error", e.toString());
				return "redirect:/register/ethereum";
			}

		} 
		else 
		{
			redirectAttributes.addFlashAttribute("error", "Please enter Details");
			return "redirect:/register/ethereum";
		}

	}

}
