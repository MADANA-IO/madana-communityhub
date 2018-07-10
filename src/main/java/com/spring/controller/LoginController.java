package com.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.dto.MDN_DTO_RegisterUser;
import de.madana.webclient.dto.MDN_DTO_ResetPassword;
import de.madana.webclient.dto.MDN_DTO_SetPassword;

@Controller
@Scope("session")
public class LoginController 
{
	MDN_RestClient oClient =  new MDN_RestClient();
	String strUserName="ANONYMOUS";
	MDN_UserProfile oProfile;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loadHomepage(Model model) 
	{
		model.addAttribute("msg", strUserName);
		return "index";
	}
	@RequestMapping(value = "/auth/facebook", method = RequestMethod.GET)
	public String authFacebook(Model model) 
	{
		return "redirect:"+ oClient.getFacebookAuthURL();
	}
	@RequestMapping(value = "/auth/twitter", method = RequestMethod.GET)
	public String authTwitter(Model model) 
	{
		return "redirect:"+ oClient.getTwitterAuthURL();
	}
	@RequestMapping(value = "/auth/twitter/callback" , method = RequestMethod.GET)
	public String setTwitterUserID(@RequestParam("oauth_token") String token, @RequestParam("oauth_verifier") String verifier, Model model) 
	{
		oClient.setTwitterUID(token,verifier);
		return "redirect:/home";
	}

	@RequestMapping(value = "/auth/facebook/callback" , method = RequestMethod.GET)
	public String setFacebookUserID(@RequestParam("code") String code, Model model) 
	{
		oClient.setFacebookUID(code);
		return "redirect:/home";
	}

	@RequestMapping(value = "/bounty", method = RequestMethod.GET)
	public String loadBounty(Model model) 
	{

		List<MDN_SocialPlatform> oSocialPlatforms = oClient.getSocialPlatforms();
		for(int i=0; i < oSocialPlatforms.size(); i++)
		{
			try
			{
				oClient.getSocialFeed(oSocialPlatforms.get(i));
			}
			catch(Exception ex)
			{
				System.err.println("Error requesting Feed for " +oSocialPlatforms.get(i).getName());
			}
		}
		model.addAttribute("social_platforms",oSocialPlatforms);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		model.addAttribute("profile", oProfile);
		return "bounty";
	}
	@RequestMapping(value = "/rather", method = RequestMethod.GET)
	public String loadRather(Model model) 
	{
		model.addAttribute("msg", strUserName);
		model.addAttribute("profile", oProfile);
		return "rather";
	}
	@RequestMapping(value = "/ranking", method = RequestMethod.GET)
	public String loadRanking(Model model) 
	{
		Map<String, String> oUsers = oClient.getRanking();
		List<String> oRanking =new ArrayList(oUsers.keySet());
		try
		{
			MDN_UserProfile oFirstUser = oClient.getProfile(oRanking.get(0));
			model.addAttribute("user1", oFirstUser);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			MDN_UserProfile oSecondUser = oClient.getProfile(oRanking.get(1));
			model.addAttribute("user2", oSecondUser);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try
		{
			MDN_UserProfile oThirdUser = oClient.getProfile(oRanking.get(2));
			model.addAttribute("user3", oThirdUser);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		model.addAttribute("msg", strUserName);
		model.addAttribute("users", oUsers);
		model.addAttribute("profile", oProfile);



		return "ranking";
	}

	@RequestMapping(value = "/resetpassword/{token}", method = RequestMethod.GET)
	public String loadResetPassword(Model model,@PathVariable("token") String token) 
	{
		return "setpassword";
	}
	@RequestMapping(value = "/resetpassword/{token}", method = RequestMethod.POST)
	public String submitResetPassword(Model model, @PathVariable("token") String token, @ModelAttribute("MDN_DTO_SetPassword") MDN_DTO_SetPassword oNewPassword,  final RedirectAttributes redirectAttributes) 
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

					if (oClient.setNewPassword(oReset)) ;
					{
						model.addAttribute("error", "Login with your new password");
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
	@RequestMapping(value = "/resetPassword", method = RequestMethod.GET)
	public String loadResetPassword(Model model) 
	{
		return "resetpassword";
	}
	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	public String submitResetPassword(Model model, @ModelAttribute("MDN_DTO_ResetPassword") MDN_DTO_ResetPassword mail,final RedirectAttributes redirectAttributes) 
	{

		if (mail.getMail()!= null && mail.getMail().length()>3 && mail.getMail().contains("@")) 
		{

			try 
			{
				MDN_MailAddress oMail = new MDN_MailAddress();
				oMail.setMail(mail.getMail());
				if (oClient.requestNewPassword(oMail)) ;
				{
					redirectAttributes.addFlashAttribute("error", "You'll receive an mail in a few moments");
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
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loadLoginpage(Model model) 
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
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(Model model) 
	{
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);

		return "home";

	}
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profilePage(Model model) 
	{
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);

		return "profile";

	}
	@RequestMapping(value = "/profile/{username}", method = RequestMethod.GET)
	public String userProfilePage(Model model,@PathVariable("username") String strDestUsername) 
	{
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strDestUsername);
		model.addAttribute("profile", oProfile);
		return "profile";
	}
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settingsPage(Model model) 
	{
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);

		return "settings";

	}
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String homeAction(Model model ,final RedirectAttributes redirectAttributes)
	{
		try
		{
			oClient.deleteUser(strUserName);
			redirectAttributes.addFlashAttribute("error", "Account deleted");
			return "redirect:/login";
		}
		catch(Exception e)
		{

		}
		model.addAttribute("msg", "Account couldn't be deleted");
		return "home";

	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String submit(@RequestParam(value = "referrer", required=false) String strToken, Model model, @ModelAttribute("MDN_DTO_RegisterUser") MDN_DTO_RegisterUser user,final RedirectAttributes redirectAttributes) 
	{

		if (user != null && user.getUsername()!= null & user.getPassword() != null) 
		{
			if( user.getPassword().equals(user.getMatchingPassword()))
			{
				try 
				{
					if (oClient.createUser(user.getUsername(), user.getPassword(), user.getEmail(), strToken)) ;
					{
						redirectAttributes.addFlashAttribute("error", "Account created");
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
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String submit(Model model, @ModelAttribute("loginBean") LoginBean loginBean, final RedirectAttributes redirectAttributes) 
	{
		if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) 
		{
			try 
			{
				if (oClient.logon(loginBean.getUserName(), loginBean.getPassword())) 
				{
					strUserName=loginBean.getUserName();
					redirectAttributes.addFlashAttribute("msg", loginBean.getUserName());
					return "redirect:/home";
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
