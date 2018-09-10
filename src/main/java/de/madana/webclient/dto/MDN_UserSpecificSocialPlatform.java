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
