package com.spring.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.ws.rs.DefaultValue;

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
import de.madana.common.datastructures.MDN_PersonalSocialPost;
import de.madana.common.datastructures.MDN_SocialHistoryObject;
import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_User;
import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.datastructures.MDN_UserProfileImage;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.security.MDN_RandomString;
import de.madana.webclient.MDN_BackendHandler;
import de.madana.webclient.MDN_VisualSocialHistoryObject;
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
	public String loadHomepage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient =  new MDN_RestClient();
		session.setAttribute("oClient", oClient);
		model.addAttribute("msg", strUserName);
		return "index";
	}
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
					return "referralbountydetail";
				}
				else
				{
					for(int j=0; j<oUser.getSocialAccounts().size();j++)
					{
						if(oUser.getSocialAccounts().get(j).getPlatform().equals(oPlatforms.get(i).getName()))
						{
							model.addAttribute("platform",oPlatforms.get(i));
							List<MDN_PersonalSocialPost> oNoActions = new ArrayList<MDN_PersonalSocialPost>();
							List<MDN_PersonalSocialPost> oInProgress = new ArrayList<MDN_PersonalSocialPost>();
							List<MDN_PersonalSocialPost> oCompleted = new ArrayList<MDN_PersonalSocialPost>();
							List<MDN_PersonalSocialPost> oPosts =((MDN_RestClient) session.getAttribute("oClient")).getPersonalizedTwitterFeed(strUserName);
							Collections.sort(oPosts);
							for(int k=0; k < oPosts.size(); k++)
							{
								oPosts.get(k).setEmbeddCode( ((MDN_RestClient) session.getAttribute("oClient")).getTwitterEmbeddCode(oPosts.get(k).getLink()));
								if(oPosts.get(k).isCompleted())
									{
							
									oCompleted.add(oPosts.get(k));
									}
								else
								{
									if(oPosts.get(k).getCompletedActions().size()>0)
									{
										
										oInProgress.add(oPosts.get(k));
									}
									else
									{
									
										oNoActions.add(oPosts.get(k));
									}
								}
							}
							model.addAttribute("noaction",oNoActions);
							model.addAttribute("inprogress",oInProgress);
							model.addAttribute("completed",oCompleted);
							return "bountydetail";
						}
					
					}
				}

			}

		}
		return "redirect:/home";
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
		oPlatforms = oClient.getSocialPlatforms();
		oUser = oClient.getUser(strUserName);
		oProfile= oClient.getProfile(strUserName);
		List<MDN_UserSpecificSocialPlatform> oSocialPlatforms = MDN_BackendHandler.getInstance().getCustomSocialPlatforms(oPlatforms, oClient, oUser, oProfile);
		List<MDN_ReferralSocialPlatform> oRefferalPlatforms = MDN_BackendHandler.getInstance().getReferralPlatforms(oPlatforms, oClient, strUserName);

		
	
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
		
		model.addAttribute("social_platforms",oSocialPlatforms);
		model.addAttribute("referral_platforms",oRefferalPlatforms);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oUser);
		model.addAttribute("profile", oProfile);	
		session.setAttribute("profile", oProfile);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oUser);
		model.addAttribute("system",  oClient.getSystemHealth());
		return "home";

	}
	@RequestMapping(value = "/help", method = RequestMethod.GET)
	public String helpPage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("profile", oProfile);
		model.addAttribute("user", oProfile);

		return "help";

	}
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profilePage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		List<MDN_VisualSocialHistoryObject> oNewList = new ArrayList<MDN_VisualSocialHistoryObject>();
		List<MDN_SocialHistoryObject> oList = oProfile.getHistory();
		for(int i=0; i< oList.size();i ++)
		{
			MDN_VisualSocialHistoryObject oObject = new MDN_VisualSocialHistoryObject(oList.get(i));
			for(int j=0; j < oPlatforms.size(); j++)
			{
				if(oObject.getPlatform().equalsIgnoreCase(oPlatforms.get(j).getName()))
					oObject.setPlatformIcon(oPlatforms.get(j).getIcon());
			}
			if(oObject.getAction().equalsIgnoreCase("like"))
				oObject.setActionIcon("<i class=\"material-icons\">thumb_up</i>");
			else if(oObject.getAction().equalsIgnoreCase("share"))
				oObject.setActionIcon("<i class=\"material-icons\">share</i>");
			if(oObject.getAction().equalsIgnoreCase("referral"))
				oObject.setActionIcon("<i class=\"material-icons\">person_add</i>");
		
			
			oNewList.add(oObject);
		}
		Collections.sort(oNewList);
		model.addAttribute("history", oNewList);
		model.addAttribute("profile", oProfile);
		model.addAttribute("user", oProfile);

		return "profile";

	}
	@RequestMapping(value = "/profile/{username}", method = RequestMethod.GET)
	public String userProfilePage(HttpSession session,Model model,@PathVariable("username") String strDestUsername) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getProfile(strUserName));
		List<MDN_VisualSocialHistoryObject> oNewList = new ArrayList<MDN_VisualSocialHistoryObject>();
		List<MDN_SocialHistoryObject> oList = oProfile.getHistory();
		for(int i=0; i< oList.size();i ++)
		{
			MDN_VisualSocialHistoryObject oObject = new MDN_VisualSocialHistoryObject(oList.get(i));
			for(int j=0; j < oPlatforms.size(); j++)
			{
				if(oObject.getPlatform().equalsIgnoreCase(oPlatforms.get(j).getName()))
					oObject.setPlatformIcon(oPlatforms.get(j).getIcon());
			}
			if(oObject.getAction().equalsIgnoreCase("like"))
				oObject.setActionIcon("<i class=\"material-icons\">thumb_up</i>");
			else if(oObject.getAction().equalsIgnoreCase("share"))
				oObject.setActionIcon("<i class=\"material-icons\">share</i>");
			if(oObject.getAction().equalsIgnoreCase("referral"))
				oObject.setActionIcon("<i class=\"material-icons\">person_add</i>");
		
			
			oNewList.add(oObject);
		}
		Collections.sort(oNewList);
		model.addAttribute("history", oNewList);
		model.addAttribute("profile", oProfile);
		return "profile";
	}
	@RequestMapping(value = "/settings/avatar/{avatarid}", method = RequestMethod.GET)
	public String setAvatar(HttpSession session,Model model,@PathVariable("avatarid") String strAvatarID) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		MDN_UserProfileImage oImage = new MDN_UserProfileImage();
		oImage.setId(strAvatarID);
		oImage.setImage(strAvatarID);
		oClient.setAvatar(strUserName, oImage);
		return "redirect:/settings";
	}
	
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settingsPage(HttpSession session,Model model) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);
		model.addAttribute("avatars", oClient.getAvailableAvatars(strUserName));

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
				MDN_RestClient oClient = (MDN_RestClient) session.getAttribute("oClient");
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
