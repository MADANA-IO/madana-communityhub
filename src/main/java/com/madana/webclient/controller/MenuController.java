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
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.madana.common.datastructures.MDN_PersonalSocialPost;
import com.madana.common.datastructures.MDN_SimpleUserProfile;
import com.madana.common.datastructures.MDN_SocialHistoryObject;
import com.madana.common.datastructures.MDN_SocialPlatform;
import com.madana.common.datastructures.MDN_User;
import com.madana.common.datastructures.MDN_UserProfile;
import com.madana.common.datastructures.MDN_UserProfileImage;
import com.madana.common.datastructures.MDN_UserSetting;
import com.madana.common.restclient.MDN_RestClient;
import com.madana.webclient.dto.ReferralSocialPlatform;
import com.madana.webclient.dto.UserSpecificSocialPlatform;
import com.madana.webclient.dto.VisualSocialHistoryObject;
import com.madana.webclient.exceptions.ClientNotInitizializedException;
import com.madana.webclient.exceptions.UserNotAuthenticatedException;
import com.madana.webclient.system.BackendHandler;
import com.madana.webclient.system.SessionHandler;

@Controller
@Scope("session")
public class MenuController 
{

	MDN_UserProfile oProfile;
	MDN_User oUser;
	List<MDN_SocialPlatform> oPlatforms;
	@RequestMapping(value = "/bounty/{platform}", method = RequestMethod.GET)
	public String loadBountyDetail(HttpSession session, Model model,@PathVariable("platform") String platform) throws UserNotAuthenticatedException, ClientNotInitizializedException 
	{
		String strUserName = SessionHandler.getCurrentUser(session);
		oUser = SessionHandler.getClient(session).getUser(strUserName);
		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(oPlatforms.get(i).getName().equalsIgnoreCase(platform))
			{
				if(oPlatforms.get(i).getIsReferralPlatform().equals("true"))
				{
					List<MDN_UserProfile> oReferred =  SessionHandler.getClient(session).getReferredUsers(oPlatforms.get(i).getName(), strUserName);
					model.addAttribute("platform",oPlatforms.get(i));
					model.addAttribute("referrals",oReferred);
					model.addAttribute("platformname", oPlatforms.get(i).getName().toLowerCase());
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
							List<MDN_PersonalSocialPost> oPosts =SessionHandler.getClient(session).getPersonalizedTwitterFeed(strUserName);
							Collections.sort(oPosts);
							for(int k=0; k < oPosts.size(); k++)
							{
								oPosts.get(k).setEmbeddCode( SessionHandler.getClient(session).getTwitterEmbeddCode(oPosts.get(k).getLink()));
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
	public String loadRanking(HttpSession session, Model model) throws ClientNotInitizializedException 
	{
		MDN_RestClient oClient = SessionHandler.getClient(session);


		List<MDN_SimpleUserProfile> oUsers = oClient.getRanking();
		if(oUsers.size()>2)
		{
			model.addAttribute("user1", oUsers.get(0));
			model.addAttribute("user2", oUsers.get(1));
			model.addAttribute("user3", oUsers.get(2));
		}
		model.addAttribute("msg", SessionHandler.getCurrentUser(session));
		model.addAttribute("users", oUsers);
		model.addAttribute("profile", oProfile);
		model.addAttribute("info", "Last updated "+oClient.getSystemHealth().getRankingupdate());
		model.addAttribute("currentsite","ranking");



		return "ranking";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homePage(HttpSession session,Model model) throws Exception 
	{

		Instant start = Instant.now();
		MDN_RestClient oClient = SessionHandler.getClient(session);
		String strUserName = SessionHandler.getCurrentUser(session);
		oPlatforms = oClient.getSocialPlatforms();
		Instant end = Instant.now();
		Duration timeElapsed = Duration.between(start, end);
		System.out.println("Get social platforms: "+ timeElapsed.toMillis() +" milliseconds");
		start = Instant.now();
		oUser = oClient.getUser(strUserName);
		end = Instant.now();
		timeElapsed = Duration.between(start, end);
		System.out.println("Loading user: "+ timeElapsed.toMillis() +" milliseconds");
		start = Instant.now();
		oProfile= oClient.getProfile(strUserName);
		end = Instant.now();
		timeElapsed = Duration.between(start, end);
		System.out.println("Loading Profile: "+ timeElapsed.toMillis() +" milliseconds");
		start = Instant.now();
		List<UserSpecificSocialPlatform> oSocialPlatforms = BackendHandler.getInstance().getCustomSocialPlatforms(oPlatforms, oClient, oUser, oProfile);
		List<ReferralSocialPlatform> oRefferalPlatforms = BackendHandler.getInstance().getReferralPlatforms(oPlatforms, oClient, strUserName);

		start = Instant.now();

		List<MDN_SimpleUserProfile> oUsers = oClient.getRanking();
		if(oUsers.size()>2)
		{
			Collections.sort(oUsers);
			model.addAttribute("user1", oUsers.get(0));
			model.addAttribute("user2", oUsers.get(1));
			model.addAttribute("user3", oUsers.get(2));
		}
		model.addAttribute("currentsite","home");
		model.addAttribute("social_platforms",oSocialPlatforms);
		model.addAttribute("referral_platforms",oRefferalPlatforms);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oUser);
		model.addAttribute("profile", oProfile);	
		session.setAttribute("profile", oProfile);
		model.addAttribute("msg", strUserName);
		model.addAttribute("system",  oClient.getSystemHealth());
		end = Instant.now();
		timeElapsed = Duration.between(start, end);
		System.out.println("Loading Home: "+ timeElapsed.toMillis() +" milliseconds");
		return "home";

	}


	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String loadHomepage(HttpSession session,Model model) 
	{
		model.addAttribute("currentsite","news");
		return "news";
	}
	@RequestMapping(value = "/bounty", method = RequestMethod.GET)
	public String bountyPage(HttpSession session,Model model) throws Exception 
	{


		MDN_RestClient oClient = SessionHandler.getClient(session);
		String strUserName = SessionHandler.getCurrentUser(session);
		oPlatforms = oClient.getSocialPlatforms();
		List<UserSpecificSocialPlatform> oSocialPlatforms = BackendHandler.getInstance().getCustomSocialPlatforms(oPlatforms, oClient, oUser, oProfile);
		List<ReferralSocialPlatform> oRefferalPlatforms = BackendHandler.getInstance().getReferralPlatforms(oPlatforms, oClient, strUserName);

	

		List<MDN_SimpleUserProfile> oUsers = oClient.getRanking();
		if(oUsers.size()>2)
		{
			Collections.sort(oUsers);
			model.addAttribute("user1", oUsers.get(0));
			model.addAttribute("user2", oUsers.get(1));
			model.addAttribute("user3", oUsers.get(2));
		}
		model.addAttribute("currentsite","bounty");
		model.addAttribute("social_platforms",oSocialPlatforms);
		model.addAttribute("referral_platforms",oRefferalPlatforms);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oUser);
		model.addAttribute("profile", oProfile);	


		return "bounty";

	}
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profilePage(HttpSession session,Model model) throws Exception 
	{
		String strUserName = SessionHandler.getCurrentUser(session);
		MDN_RestClient oClient = SessionHandler.getClient(session);
		model.addAttribute("msg", strUserName);
		model.addAttribute("currentsite","profile");
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
		model.addAttribute("destprofile", oProfile);

		return "profile";

	}
	@RequestMapping(value = "/profile/{username}", method = RequestMethod.GET)
	public String userProfilePage(HttpSession session,Model model,@PathVariable("username") String strDestUsername) throws Exception 
	{
		MDN_RestClient oClient = SessionHandler.getClient(session);
		model.addAttribute("msg", SessionHandler.getCurrentUser(session));
		model.addAttribute("currentsite","profile");
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
		model.addAttribute("profile", oProfile);
		model.addAttribute("destprofile", oDestUserProfile);
		return "profile";
	}
	@RequestMapping(value = "/settings/avatar/{avatarid}", method = RequestMethod.GET)
	public String setAvatar(HttpSession session,Model model,@PathVariable("avatarid") String strAvatarID) throws ClientNotInitizializedException 
	{
		MDN_RestClient oClient = SessionHandler.getClient(session);
		MDN_UserProfileImage oImage = new MDN_UserProfileImage();
		oImage.setId(strAvatarID);
		oImage.setImage(strAvatarID);
		oClient.setAvatar(SessionHandler.getCurrentUser(session), oImage);
		model.addAttribute("currentsite","settings");
		return "redirect:/settings";
	}
	@RequestMapping(value = "/settings/verifymail", method = RequestMethod.GET)
	public String sendverifyMail(HttpSession session,Model model) throws ClientNotInitizializedException 
	{
		MDN_RestClient oClient = SessionHandler.getClient(session);
		oClient.requestEmailVerification(SessionHandler.getCurrentUser(session));
		model.addAttribute("info","E-Mail Sent!");
		return "redirect:/settings";
	}
	@RequestMapping(value = "/settings/changemail/{email}", method = RequestMethod.GET)
	public String setNewMail(HttpSession session,Model model,@PathVariable("email") String mail) throws Exception 
	{
		MDN_RestClient oClient = SessionHandler.getClient(session);
		MDN_User oUser = new MDN_User();
		oUser.setMail(mail);
		oClient.updateUser(oUser, SessionHandler.getCurrentUser(session));
		model.addAttribute("currentsite","settings");
		return "redirect:/settings";
	}
	@RequestMapping(value = "/settings/{settingid}", method = RequestMethod.GET)
	public String setSetting(HttpSession session,Model model,@PathVariable("settingid") String strSettingID, @RequestParam("value") String strValue) throws ClientNotInitizializedException 
	{
		MDN_RestClient oClient = SessionHandler.getClient(session);
		MDN_UserSetting oSetting = new MDN_UserSetting();
		oSetting.setId(strSettingID);
		oSetting.setValue(strValue);
		oClient.setUserSetting(SessionHandler.getCurrentUser(session), oSetting);
		model.addAttribute("currentsite","settings");
		return "redirect:/settings";
	}

	@RequestMapping(value = "/settings", method = RequestMethod.GET)
	public String settingsPage(HttpSession session,Model model) throws Exception 
	{
		MDN_RestClient oClient = SessionHandler.getClient(session);
		String strUserName = SessionHandler.getCurrentUser(session);
		model.addAttribute("msg", strUserName);
		model.addAttribute("user", oClient.getUser(strUserName));
		oProfile =  oClient.getProfile(strUserName);
		model.addAttribute("profile", oProfile);
		model.addAttribute("avatars", oClient.getAvailableAvatars(strUserName));
		model.addAttribute("currentsite","settings");

		return "settings";

	}
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faqPage(HttpSession session,Model model) 
	{

		model.addAttribute("url", "https://intranet.madana.io/confluence/x/CQCeB");
		return "externalframe";

	}

}
