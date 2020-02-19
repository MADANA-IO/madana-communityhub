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
package com.madana.webclient.system;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.URL;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.madana.common.datastructures.MDN_SocialHistoryObject;
import com.madana.common.datastructures.MDN_SocialPlatform;
import com.madana.common.datastructures.MDN_SocialUserObject;
import com.madana.common.datastructures.MDN_User;
import com.madana.common.datastructures.MDN_UserProfile;
import com.madana.common.restclient.MDN_RestClient;
import com.madana.webclient.dto.ReferralSocialPlatform;
import com.madana.webclient.dto.UserSpecificSocialPlatform;

public class BackendHandler implements ServletContextListener
{
	public static BackendHandler instance;
	private static String GOOGLECAPTCHA_WEBSITEKEY = "";
	private static String GOOGLECAPTCHA_SECRETKEY = "";
	private String GOOGLECAPTCHA_VERIFYURL = "https://www.google.com/recaptcha/api/siteverify";
	private String GOOGLECAPTCHA_TRUSTSCORE = "0.2";

	public BackendHandler()
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
	public static String getProperty (String strKey)
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

//		System.err.println("############################################################");
//		System.err.println("UNKNOWN PROPERTY: "+strKey);
//		System.err.println("############################################################");
		return "";

	}
	public List<ReferralSocialPlatform> getReferralPlatforms(List<MDN_SocialPlatform> oPlatforms, MDN_RestClient oClient, String strUserName)
	{
		Instant start = Instant.now();
		List<ReferralSocialPlatform> oRefferalPlatforms = new ArrayList<ReferralSocialPlatform>();
		if(oPlatforms!=null)
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
						//					oMyPlatform.setReferrals(oClient.getReferredUsers(oPlatforms.get(i).getName(), strUserName));
					}
					catch(Exception e)
					{
						System.err.println("Error receiving referrals for " +oPlatforms.get(i).getName());
					}
					oRefferalPlatforms.add(oMyPlatform);

				}
			}
		Instant end = Instant.now();
		Duration timeElapsed = Duration.between(start, end);
		System.out.println("ReferralPlatforms: "+ timeElapsed.toMillis() +" milliseconds");
		return oRefferalPlatforms;
	}
	public  boolean verifyGoogleCaptcha(String gRecaptchaResponse) 
	{
		if(GOOGLECAPTCHA_SECRETKEY.length()<1) //No captchatoken provided
			return true;
		
		
		if (gRecaptchaResponse == null || "".equals(gRecaptchaResponse)) {
			return false;
		}

		try
		{

	
			String USER_AGENT = "Mozilla/5.0";
			URL obj = new URL(GOOGLECAPTCHA_VERIFYURL);
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

			// add reuqest header
			con.setRequestMethod("POST");
			con.setRequestProperty("User-Agent", USER_AGENT);
			con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");

			String postParams = "secret=" + GOOGLECAPTCHA_SECRETKEY + "&response="
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
			Double dThreshold = Double.valueOf(GOOGLECAPTCHA_TRUSTSCORE);
			if(dScore < dThreshold)
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
		List<MDN_SocialUserObject> oSocialAccounts = null;
		try
		{
			if(oUser!=null)
				oSocialAccounts = oUser.getSocialAccounts();
		}
		catch(Exception ex)
		{
			System.err.println("Error fetching social accounts for " +oUser.getUserName());
		}

		for(int i=0; i < oPlatforms.size(); i++)
		{
			if(!oPlatforms.get(i).getIsReferralPlatform().equals("true"))
			{

				UserSpecificSocialPlatform oMyPlatform = new UserSpecificSocialPlatform();
				oMyPlatform.setName(oPlatforms.get(i).getName());
				oMyPlatform.setFeed(oPlatforms.get(i).getFeed());
				oMyPlatform.setLink(oPlatforms.get(i).getLink());
				oMyPlatform.setIcon(oPlatforms.get(i).getIcon());
				oMyPlatform.setIsReferralPlatform(oPlatforms.get(i).getIsReferralPlatform());
				oMyPlatform.setIsDisabled(oPlatforms.get(i).getIsDisabled());
				oSocialPlatforms.add(oMyPlatform);

				if( oSocialAccounts !=null) // Fill with information if user is initialized
				{
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

		}

		return oSocialPlatforms;
	}
	@Override
	public void contextInitialized(ServletContextEvent sce)
	{
		
		sce.getServletContext().setAttribute("GOOGLECAPTCHA", initGoogleCaptcha(sce)); 
		System.out.println("Succesfully initialized MADANA CommunityHub");
		
	}
	private boolean initGoogleCaptcha(ServletContextEvent sce) 
	{
		boolean initError=false;
		GOOGLECAPTCHA_SECRETKEY= getProperty("GOOGLECAPTCHA_SECRETKEY");
		if(GOOGLECAPTCHA_SECRETKEY.length()<1)
		{
			System.err.println("GOOGLECAPTCHA_SECRETKEY not provided. Disabling captchasecurity" );
			initError=true;
		}
		
		GOOGLECAPTCHA_WEBSITEKEY= getProperty("GOOGLECAPTCHA_WEBSITEKEY");
		if(GOOGLECAPTCHA_WEBSITEKEY.length()<1)
		{
			System.err.println("GOOGLECAPTCHA_WEBSITEKEY not provided. Disabling captchasecurity" );
			initError=true;
		}
		else
		{
			sce.getServletContext().setAttribute("GOOGLECAPTCHA_WEBSITEKEY", GOOGLECAPTCHA_WEBSITEKEY);
		}

		if(getProperty("GOOGLECAPTCHA_VERIFYURL").length()<1)
		{
			System.out.println("GOOGLECAPTCHA_VERIFYURL not provided. Falling back to default "+GOOGLECAPTCHA_VERIFYURL );
		}
		else
		{
			GOOGLECAPTCHA_VERIFYURL= getProperty("GOOGLECAPTCHA_VERIFYURL");
		}
		if(getProperty("GOOGLECAPTCHA_TRUSTSCORE").length()<1)
		{
			System.out.println("GOOGLECAPTCHA_TRUSTSCORE not provided. Falling back to default "+GOOGLECAPTCHA_TRUSTSCORE );
		}
		else
		{
			GOOGLECAPTCHA_TRUSTSCORE = getProperty("GOOGLECAPTCHA_TRUSTSCORE");
		}
		
		return initError==false;
	}
	@Override
	public void contextDestroyed(ServletContextEvent sce)
	{
		System.out.println("Killed MADANA CommunityHub");
		
	}
}
