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
package de.madana.webclient.controller;

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

import de.madana.common.datastructures.MDN_MailAddress;
import de.madana.common.datastructures.MDN_PasswordReset;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.bean.LoginBean;
import de.madana.webclient.bean.ResetPasswordBean;
import de.madana.webclient.bean.SetPasswordBean;
import de.madana.webclient.dto.RegisterUser;
import de.madana.webclient.exceptions.ClientNotInitizializedException;
import de.madana.webclient.system.SessionHandler;

@Controller
@Scope("session")
public class LoginController 
{
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loadFrontPage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient =  new MDN_RestClient();
		session.setAttribute("oClient", oClient);
		return "index";
	}

	@RequestMapping(value = "/resetpassword/{token}", method = RequestMethod.GET)
	public String loadResetPassword(Model model,@PathVariable("token") String token) 
	{
		return "setpassword";
	}
	@RequestMapping(value = "/resetpassword/{token}", method = RequestMethod.POST)
	public String submitResetPassword(HttpSession session,Model model, @PathVariable("token") String token, @ModelAttribute("MDN_DTO_SetPassword") SetPasswordBean oNewPassword,  final RedirectAttributes redirectAttributes) 
	{
	
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
	public String submitResetPassword(HttpSession session,Model model, @ModelAttribute("MDN_DTO_ResetPassword") ResetPasswordBean mail,final RedirectAttributes redirectAttributes) 
	{

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
	public ModelAndView loadRegisterPage() 
	{

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
	

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String submitRegisterPage(HttpSession session,@RequestParam(value = "TOC", required=false) String read, @RequestParam(value = "referrer", required=false) String strToken, Model model, @ModelAttribute("MDN_DTO_RegisterUser") RegisterUser user,final RedirectAttributes redirectAttributes) 
	{
		if(read== null)
		{
			model.addAttribute("error", "Please read, understand and accept the Privacy Policy and Terms of Use Agreement");
			return "register";
		}
		if (user != null && user.getUsername()!= null & user.getPassword() != null) 
		{
			if( user.getPassword().equals(user.getMatchingPassword()))
			{
			
				try 
				{
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
	public String submitLoginPage(HttpSession session,Model model,  @RequestParam(value="requesturi", required=false) String requesturi, @ModelAttribute("loginBean") LoginBean loginBean, final RedirectAttributes redirectAttributes) 
	{
		if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) 
		{
			try 
			{
				MDN_RestClient oClient =  new MDN_RestClient();
				session.setAttribute("oClient", oClient);
				if (oClient.logon(loginBean.getUserName(), loginBean.getPassword())) 
				{
					session.setAttribute("username",loginBean.getUserName());
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

}
