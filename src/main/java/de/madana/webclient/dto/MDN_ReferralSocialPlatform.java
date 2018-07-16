package de.madana.webclient.dto;

import java.util.List;

import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_UserProfile;

public class MDN_ReferralSocialPlatform extends MDN_SocialPlatform
{
	List<MDN_UserProfile> referrals;

	public List<MDN_UserProfile> getReferrals() {
		return referrals;
	}

	public void setReferrals(List<MDN_UserProfile> referrals) {
		this.referrals = referrals;
	}
}
