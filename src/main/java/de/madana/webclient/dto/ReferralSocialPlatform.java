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
package de.madana.webclient.dto;

import java.util.List;

import de.madana.common.datastructures.MDN_SocialPlatform;
import de.madana.common.datastructures.MDN_UserProfile;

public class ReferralSocialPlatform extends MDN_SocialPlatform
{
	List<MDN_UserProfile> referrals;

	public List<MDN_UserProfile> getReferrals() {
		return referrals;
	}

	public void setReferrals(List<MDN_UserProfile> referrals) {
		this.referrals = referrals;
	}
}
