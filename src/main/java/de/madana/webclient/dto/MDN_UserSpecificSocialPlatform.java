package de.madana.webclient.dto;

import java.util.HashMap;
import java.util.Map;

import de.madana.common.datastructures.MDN_SocialPlatform;

public class MDN_UserSpecificSocialPlatform extends MDN_SocialPlatform
{
	public Map<String, String> oActions = new HashMap<String, String>();
	public String isVerifiedByUser = "false";

	public String getIsVerifiedByUser() {
		return isVerifiedByUser;
	}

	public void setIsVerifiedByUser(String isVerifiedByUser) {
		this.isVerifiedByUser = isVerifiedByUser;
	}

	public Map<String, String> getoActions() {
		return oActions;
	}

	public void setoActions(Map<String, String> oActions) {
		this.oActions = oActions;
	}
}
