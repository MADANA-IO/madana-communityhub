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
package de.madana.webclient.system;

import java.util.ArrayList;
import java.util.List;

import de.madana.common.datastructures.MDN_SocialHistoryObject;
import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_User;
import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.dto.ReferralSocialPlatform;
import de.madana.webclient.dto.UserSpecificSocialPlatform;

public class BackendHandler
{
	public static BackendHandler instance;
	
	private BackendHandler()
	{
		
	}
	public static BackendHandler getInstance()
	{
		if (instance == null) 
		{
			instance = new BackendHandler();
		}
		return instance;
	}
	public List<ReferralSocialPlatform> getReferralPlatforms(List<MDN_SocialPlatform> oPlatforms, MDN_RestClient oClient, String strUserName)
	{
		List<ReferralSocialPlatform> oRefferalPlatforms = new ArrayList<ReferralSocialPlatform>();
		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(oPlatforms.get(i).getIsReferralPlatform().equals("true"))
			{
				ReferralSocialPlatform oMyPlatform = new ReferralSocialPlatform();
				oMyPlatform.setName(oPlatforms.get(i).getName());
				oMyPlatform.setFeed(oPlatforms.get(i).getFeed());
				oMyPlatform.setLink(oPlatforms.get(i).getLink());
				oMyPlatform.setIcon(oPlatforms.get(i).getIcon());
				oMyPlatform.setIsDisabled(oPlatforms.get(i).getIsDisabled());
				oMyPlatform.setIsReferralPlatform(oPlatforms.get(i).getIsReferralPlatform());
				try
				{
					oMyPlatform.setReferrals(oClient.getReferredUsers(oPlatforms.get(i).getName(), strUserName));
				}
				catch(Exception e)
				{
					System.err.println("Error receiving referrals for " +oPlatforms.get(i).getName());
				}
				oRefferalPlatforms.add(oMyPlatform);

			}
		}
		return oRefferalPlatforms;
	}
	public List<UserSpecificSocialPlatform> getCustomSocialPlatforms(List<MDN_SocialPlatform> oPlatforms , MDN_RestClient oClient, MDN_User oUser, MDN_UserProfile oProfile )
	{
		List<UserSpecificSocialPlatform> oSocialPlatforms = new ArrayList<UserSpecificSocialPlatform>();
		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(!oPlatforms.get(i).getIsReferralPlatform().equals("true"))
			{
				oClient.getSocialFeed(oPlatforms.get(i));
				UserSpecificSocialPlatform oMyPlatform = new UserSpecificSocialPlatform();
				oMyPlatform.setName(oPlatforms.get(i).getName());
				oMyPlatform.setFeed(oPlatforms.get(i).getFeed());
				oMyPlatform.setLink(oPlatforms.get(i).getLink());
				oMyPlatform.setIcon(oPlatforms.get(i).getIcon());
				oMyPlatform.setIsReferralPlatform(oPlatforms.get(i).getIsReferralPlatform());
				oMyPlatform.setIsDisabled(oPlatforms.get(i).getIsDisabled());
				oSocialPlatforms.add(oMyPlatform);

				for(int j=0; j<oUser.getSocialAccounts().size();j++)
				{
					try
					{
						if(oUser.getSocialAccounts().get(i).getPlatform().equals(oMyPlatform.getName()))
						oMyPlatform.setIsVerifiedByUser("true");
					}
					catch(Exception ex)
					{
						oMyPlatform.setIsVerifiedByUser("false");
					}
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
				
		}
		
		return oSocialPlatforms;
	}
}
