package com.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.madana.common.datastructures.MDN_MailAddress;
import de.madana.common.datastructures.MDN_PasswordReset;
import de.madana.common.datastructures.MDN_SocialHistoryObject;
import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_SystemHealthObject;
import de.madana.common.datastructures.MDN_User;
import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.dto.MDN_DTO_RegisterUser;
import de.madana.webclient.dto.MDN_DTO_ResetPassword;
import de.madana.webclient.dto.MDN_DTO_SetPassword;
import de.madana.webclient.dto.MDN_ReferralSocialPlatform;
import de.madana.webclient.dto.MDN_UserSpecificSocialPlatform;

@Controller
@Scope("session")
public class LoginController 
{

	String strUserName="ANONYMOUS";
	MDN_UserProfile oProfile;
	MDN_User oUser;
	List<MDN_SocialPlatform> oPlatforms;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loadHomepage(Model model) 
	{
		model.addAttribute("msg", strUserName);
		return "index";
	}
	@RequestMapping(value = "/auth/facebook", method = RequestMethod.GET)
	public String authFacebook(HttpSession session, Model model) 
	{
		return "redirect:"+ ((MDN_RestClient) session.getAttribute("oClient")).getFacebookAuthURL();
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
	@RequestMapping(value = "/bounty/{platform}", method = RequestMethod.GET)
	public String loadBountyDetail(HttpSession session, Model model,@PathVariable("platform") String platform) 
	{
		oUser = ((MDN_RestClient) session.getAttribute("oClient")).getUser(strUserName);
		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(oPlatforms.get(i).getName().equalsIgnoreCase(platform))
			{
				if(oPlatforms.get(i).getIsReferralPlatform().equals("true"))
				{
					List<MDN_UserProfile> oReferred =  ((MDN_RestClient) session.getAttribute("oClient")).getReferredUsers(oPlatforms.get(i).getName(), strUserName);
					model.addAttribute("platform",oPlatforms.get(i));
					model.addAttribute("referrals",oReferred);
					model.addAttribute("user", oUser);
					return "bountydetail";
				}
				else
				{
					for(int j=0; j<oUser.getSocialAccounts().size();j++)
					{
						if(oUser.getSocialAccounts().get(j).getPlatform().equals(oPlatforms.get(i).getName()))
						{
							model.addAttribute("platform",oPlatforms.get(i));
							return "bountydetail";
						}
					}
				}

			}

		}
		return "redirect:/bounty";
	}
	@RequestMapping(value = "/bounty", method = RequestMethod.GET)
	public String loadBounty(HttpSession session, Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		oPlatforms = oClient.getSocialPlatforms();
		List<MDN_UserSpecificSocialPlatform> oSocialPlatforms = new ArrayList<MDN_UserSpecificSocialPlatform>();
		List<MDN_ReferralSocialPlatform> oRefferalPlatforms = new ArrayList<MDN_ReferralSocialPlatform>();
		oUser = oClient.getUser(strUserName);
		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(oPlatforms.get(i).getIsReferralPlatform().equals("true"))
			{
				MDN_ReferralSocialPlatform oMyPlatform = new MDN_ReferralSocialPlatform();
				oMyPlatform.setName(oPlatforms.get(i).getName());
				oMyPlatform.setFeed(oPlatforms.get(i).getFeed());
				oMyPlatform.setLink(oPlatforms.get(i).getLink());
				oMyPlatform.setIcon(oPlatforms.get(i).getIcon());
				oMyPlatform.setIsReferralPlatform(oPlatforms.get(i).getIsReferralPlatform());
				try
				{
					oMyPlatform.setReferrals(((MDN_RestClient) session.getAttribute("oClient")).getReferredUsers(oPlatforms.get(i).getName(), strUserName));
				}
				catch(Exception e)
				{
					System.err.println("Error receiving referrals for " +oPlatforms.get(i).getName());
				}
				oRefferalPlatforms.add(oMyPlatform);

			}
			else
			{
				try
				{
					oClient.getSocialFeed(oPlatforms.get(i));
					MDN_UserSpecificSocialPlatform oMyPlatform = new MDN_UserSpecificSocialPlatform();
					oMyPlatform.setName(oPlatforms.get(i).getName());
					oMyPlatform.setFeed(oPlatforms.get(i).getFeed());
					oMyPlatform.setLink(oPlatforms.get(i).getLink());
					oMyPlatform.setIcon(oPlatforms.get(i).getIcon());
					oMyPlatform.setIsReferralPlatform(oPlatforms.get(i).getIsReferralPlatform());
					oSocialPlatforms.add(oMyPlatform);

					for(int j=0; j<oUser.getSocialAccounts().size();j++)
					{
						if(oUser.getSocialAccounts().get(i).getPlatform().equals(oMyPlatform.getName()))
							oMyPlatform.setIsVerifiedByUser("true");
					}
					if(oMyPlatform.getIsVerifiedByUser().equals("true"))
					{
						for(int j=0; j< oProfile.getHistory().size();j++)
						{
							if(oProfile.getHistory().get(j).getPlatform().equals(oPlatforms.get(i).getName()))
							{
								MDN_SocialHistoryObject oHistoryObject =oProfile.getHistory().get(j);
								String strActionIconName="share";
								if(oHistoryObject.getAction().equalsIgnoreCase("like"))
								{
									strActionIconName="thumb_up";
								}
								if (oMyPlatform.oActions.get(strActionIconName) == null )
									oMyPlatform.oActions.put(strActionIconName, "1");
								else
								{
									int iNewCount = Integer.parseInt(oMyPlatform.oActions.get(strActionIconName))+1;
									oMyPlatform.oActions.put(strActionIconName, String.valueOf(iNewCount));
								}
							}
						}
					}
				}
				catch(Exception ex)
				{
					System.err.println("Error requesting Feed for " +oSocialPlatforms.get(i).getName());
				}
			}

		}
		model.addAttribute("social_platforms",oSocialPlatforms);
		model.addAttribute("referral_platforms",oRefferalPlatforms);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		model.addAttribute("profile", oProfile);
		return "bounty";
	}
	@RequestMapping(value = "/rather", method = RequestMethod.GET)
	public String loadRather(HttpSession session,Model model) 
	{
		model.addAttribute("msg", strUserName);
		model.addAttribute("profile", oProfile);
		return "rather";
	}
	@RequestMapping(value = "/ranking", method = RequestMethod.GET)
	public String loadRanking(HttpSession session, Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
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
	public String submitResetPassword(HttpSession session,Model model, @PathVariable("token") String token, @ModelAttribute("MDN_DTO_SetPassword") MDN_DTO_SetPassword oNewPassword,  final RedirectAttributes redirectAttributes) 
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

					if (((MDN_RestClient) session.getAttribute("oClient")).setNewPassword(oReset)) ;
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
	public String submitResetPassword(HttpSession session,Model model, @ModelAttribute("MDN_DTO_ResetPassword") MDN_DTO_ResetPassword mail,final RedirectAttributes redirectAttributes) 
	{

		if (mail.getMail()!= null && mail.getMail().length()>3 && mail.getMail().contains("@")) 
		{

			try 
			{
				MDN_MailAddress oMail = new MDN_MailAddress();
				oMail.setMail(mail.getMail());
				if (((MDN_RestClient) session.getAttribute("oClient")).requestNewPassword(oMail)) ;
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
	public String homePage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		model.addAttribute("system",  oClient.getSystemHealth());
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
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);

		return "home";

	}
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profilePage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);

		return "profile";

	}
	@RequestMapping(value = "/profile/{username}", method = RequestMethod.GET)
	public String userProfilePage(HttpSession session,Model model,@PathVariable("username") String strDestUsername) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strDestUsername);
		model.addAttribute("profile", oProfile);
		return "profile";
	}
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settingsPage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);

		return "settings";

	}
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String homeAction(HttpSession session,Model model ,final RedirectAttributes redirectAttributes)
	{
		try
		{
			((MDN_RestClient) session.getAttribute("oClient")).deleteUser(strUserName);
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
	public String submit(HttpSession session,@RequestParam(value = "referrer", required=false) String strToken, Model model, @ModelAttribute("MDN_DTO_RegisterUser") MDN_DTO_RegisterUser user,final RedirectAttributes redirectAttributes) 
	{

		if (user != null && user.getUsername()!= null & user.getPassword() != null) 
		{
			if( user.getPassword().equals(user.getMatchingPassword()))
			{
				try 
				{
					if (((MDN_RestClient) session.getAttribute("oClient")).createUser(user.getUsername(), user.getPassword(), user.getEmail(), strToken)) ;
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
	public String submit(HttpSession session,Model model, @ModelAttribute("loginBean") LoginBean loginBean, final RedirectAttributes redirectAttributes) 
	{
		if (loginBean != null && loginBean.getUserName() != null & loginBean.getPassword() != null) 
		{
			try 
			{
				MDN_RestClient oClient =  new MDN_RestClient();
				session.setAttribute("oClient", oClient);
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
