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

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import de.madana.common.datastructures.MDN_PersonalSocialPost;
import de.madana.common.datastructures.MDN_SocialHistoryObject;
import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_User;
import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.datastructures.MDN_UserProfileImage;
import de.madana.common.datastructures.MDN_UserSetting;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.dto.ReferralSocialPlatform;
import de.madana.webclient.dto.UserSpecificSocialPlatform;
import de.madana.webclient.dto.VisualSocialHistoryObject;
import de.madana.webclient.exceptions.UserNotAuthenticatedException;
import de.madana.webclient.system.BackendHandler;
import de.madana.webclient.system.SessionHandler;

@Controller
@Scope("session")
public class MenuController 
{

	MDN_UserProfile oProfile;
	MDN_User oUser;
	List<MDN_SocialPlatform> oPlatforms;
	@RequestMapping(value = "/bounty/{platform}", method = RequestMethod.GET)
	public String loadBountyDetail(HttpSession session, Model model,@PathVariable("platform") String platform) throws UserNotAuthenticatedException 
	{
		String strUserName = SessionHandler.getCurrentUser(session);
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
		model.addAttribute("msg", session.getAttribute("username").toString());
		model.addAttribute("users", oUsers);
		model.addAttribute("profile", oProfile);



		return "ranking";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(HttpSession session,Model model) throws UserNotAuthenticatedException 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		String strUserName = SessionHandler.getCurrentUser(session);
		oPlatforms = oClient.getSocialPlatforms();
		oUser = oClient.getUser(strUserName);
		oProfile= oClient.getProfile(strUserName);
		List<UserSpecificSocialPlatform> oSocialPlatforms = BackendHandler.getInstance().getCustomSocialPlatforms(oPlatforms, oClient, oUser, oProfile);
		List<ReferralSocialPlatform> oRefferalPlatforms = BackendHandler.getInstance().getReferralPlatforms(oPlatforms, oClient, strUserName);



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


	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String loadHomepage(HttpSession session,Model model) 
	{
		return "news";
	}
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profilePage(HttpSession session,Model model) throws UserNotAuthenticatedException 
	{
		String strUserName = SessionHandler.getCurrentUser(session);
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		List<VisualSocialHistoryObject> oNewList = new ArrayList<VisualSocialHistoryObject>();
		List<MDN_SocialHistoryObject> oList = oProfile.getHistory();
		for(int i=0; i< oList.size();i ++)
		{
			VisualSocialHistoryObject oObject = new VisualSocialHistoryObject(oList.get(i));
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
		model.addAttribute("msg", session.getAttribute("username").toString());
		MDN_UserProfile oDestUserProfile = oClient.getProfile(strDestUsername);

		List<VisualSocialHistoryObject> oNewList = null; 
		List<MDN_SocialHistoryObject> oList = oDestUserProfile.getHistory();
		if(oList!=null)
		{
			oNewList =  new ArrayList<VisualSocialHistoryObject>();
			for(int i=0; i< oList.size();i ++)
			{
				
				VisualSocialHistoryObject oObject = new VisualSocialHistoryObject(oList.get(i));
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
		}
	
		model.addAttribute("history", oNewList);
		model.addAttribute("user", oProfile);
		model.addAttribute("profile", oDestUserProfile);
		return "profile";
	}
	@RequestMapping(value = "/settings/avatar/{avatarid}", method = RequestMethod.GET)
	public String setAvatar(HttpSession session,Model model,@PathVariable("avatarid") String strAvatarID) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		MDN_UserProfileImage oImage = new MDN_UserProfileImage();
		oImage.setId(strAvatarID);
		oImage.setImage(strAvatarID);
		oClient.setAvatar(session.getAttribute("username").toString(), oImage);
		return "redirect:/settings";
	}
	@RequestMapping(value = "/settings/{settingid}", method = RequestMethod.GET)
	public String setSetting(HttpSession session,Model model,@PathVariable("settingid") String strSettingID, @RequestParam("value") String strValue) 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		MDN_UserSetting oSetting = new MDN_UserSetting();
		oSetting.setId(strSettingID);
		oSetting.setValue(strValue);
		oClient.setUserSetting(session.getAttribute("username").toString(), oSetting);
		return "redirect:/settings";
	}

	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settingsPage(HttpSession session,Model model) throws UserNotAuthenticatedException 
	{
		MDN_RestClient oClient = ((MDN_RestClient) session.getAttribute("oClient"));
		String strUserName = SessionHandler.getCurrentUser(session);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);
		model.addAttribute("avatars", oClient.getAvailableAvatars(strUserName));

		return "settings";

	}
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqPage(HttpSession session,Model model) 
	{

		model.addAttribute("url", "https://intranet.madana.io/confluence/display/MADANA/MADANA+FAQ");
		return "externalframe";

	}
	@RequestMapping(value = "/home", method = RequestMethod.POST)
	public String homeAction(HttpSession session,Model model ,final RedirectAttributes redirectAttributes)
	{
		try
		{
			((MDN_RestClient) session.getAttribute("oClient")).deleteUser(session.getAttribute("username").toString());
			redirectAttributes.addFlashAttribute("error", "Account deleted");
			return "redirect:/login";
		}
		catch(Exception e)
		{

		}
		model.addAttribute("msg", "Account couldn't be deleted");
		return "home";

	}

}