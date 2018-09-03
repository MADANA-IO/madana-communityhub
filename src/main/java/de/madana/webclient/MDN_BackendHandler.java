package de.madana.webclient;

import java.util.ArrayList;
import java.util.List;

import de.madana.common.datastructures.MDN_SocialHistoryObject;
import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_User;
import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.dto.MDN_ReferralSocialPlatform;
import de.madana.webclient.dto.MDN_UserSpecificSocialPlatform;

public class MDN_BackendHandler
{
	public static MDN_BackendHandler instance;
	
	private MDN_BackendHandler()
	{
		
	}
	public static MDN_BackendHandler getInstance()
	{
		if (instance == null) 
		{
			instance = new MDN_BackendHandler();
		}
		return instance;
	}
	public List<MDN_ReferralSocialPlatform> getReferralPlatforms(List<MDN_SocialPlatform> oPlatforms, MDN_RestClient oClient, String strUserName)
	{
		List<MDN_ReferralSocialPlatform> oRefferalPlatforms = new ArrayList<MDN_ReferralSocialPlatform>();
		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(oPlatforms.get(i).getIsReferralPlatform().equals("true"))
			{
				MDN_ReferralSocialPlatform oMyPlatform = new MDN_ReferralSocialPlatform();
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
	public List<MDN_UserSpecificSocialPlatform> getCustomSocialPlatforms(List<MDN_SocialPlatform> oPlatforms , MDN_RestClient oClient, MDN_User oUser, MDN_UserProfile oProfile )
	{
		List<MDN_UserSpecificSocialPlatform> oSocialPlatforms = new ArrayList<MDN_UserSpecificSocialPlatform>();
		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(!oPlatforms.get(i).getIsReferralPlatform().equals("true"))
			{
				oClient.getSocialFeed(oPlatforms.get(i));
				MDN_UserSpecificSocialPlatform oMyPlatform = new MDN_UserSpecificSocialPlatform();
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
