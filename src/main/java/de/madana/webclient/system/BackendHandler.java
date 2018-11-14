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

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;

import de.madana.common.datastructures.MDN_SocialHistoryObject;
import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_SocialUserObject;
import de.madana.common.datastructures.MDN_User;
import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.dto.ReferralSocialPlatform;
import de.madana.webclient.dto.UserSpecificSocialPlatform;

public class BackendHandler
{
	public static BackendHandler instance;
	public final String captchaVerifyURL = "https://www.google.com/recaptcha/api/siteverify";

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
	public String getProperty (String strKey)
	{
		try
		{
			if (System.getProperty(strKey).length() > 0 && System.getProperty(strKey)!=null)
			{
				return System.getProperty(strKey);
			}
		}
		catch(Exception ex)
		{
		}
		try
		{
			if(System.getenv(strKey).length()>0 && System.getenv(strKey)!= null)
			{
				return System.getenv(strKey);
			}
		}
		catch(Exception ex)
		{

		}

		System.err.println("############################################################");
		System.err.println("UNKNOWN PROPERTY: "+strKey);
		System.err.println("############################################################");
		return "";

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
	public  boolean verifyGoogleCaptcha(String gRecaptchaResponse) {
		if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
			return false;
		}
		
		try
		{

		String secret = getProperty("GOOGLECAPTCHA");
			String USER_AGENT = "Mozilla/5.0";
		URL obj = new URL(captchaVerifyURL);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

		// add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

		String postParams = "secret=" + secret + "&response="
				+ gRecaptchaResponse;

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(postParams);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();


		BufferedReader in = new BufferedReader(new InputStreamReader(
				con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		System.out.println("CAPTCHA:" + response.toString());
		
		//parse JSON response and return 'success' value
		JsonReader jsonReader = Json.createReader(new StringReader(response.toString()));
		JsonObject jsonObject = jsonReader.readObject();
		jsonReader.close();
		Double dScore = Double.valueOf(jsonObject.get("score").toString());
		if(dScore < 0.2)
			return false;
		return jsonObject.getBoolean("success");
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	public List<UserSpecificSocialPlatform> getCustomSocialPlatforms(List<MDN_SocialPlatform> oPlatforms , MDN_RestClient oClient, MDN_User oUser, MDN_UserProfile oProfile ) throws Exception
	{
		List<UserSpecificSocialPlatform> oSocialPlatforms = new ArrayList<UserSpecificSocialPlatform>();
		List<MDN_SocialUserObject> oSocialAccounts = oUser.getSocialAccounts();
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


					try
					{
						if(oSocialAccounts.toString().contains(oMyPlatform.getName()))
								oMyPlatform.setIsVerifiedByUser("true");
					}
					catch(Exception ex)
					{
						oMyPlatform.setIsVerifiedByUser("false");
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
