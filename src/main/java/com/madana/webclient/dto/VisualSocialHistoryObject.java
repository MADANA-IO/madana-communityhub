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
package com.madana.webclient.dto;

import com.madana.common.datastructures.MDN_SocialHistoryObject;

public class VisualSocialHistoryObject extends MDN_SocialHistoryObject
{
	String platformIcon;
	public String getPlatformIcon() {
		return platformIcon;
	}

	public void setPlatformIcon(String platformIcon) {
		this.platformIcon = platformIcon;
	}

	public String getActionIcon() {
		return actionIcon;
	}

	public void setActionIcon(String actionIcon) {
		this.actionIcon = actionIcon;
	}

	String actionIcon;

	public VisualSocialHistoryObject(MDN_SocialHistoryObject oObject)
	{
		this.setAction(oObject.getAction());
		this.setBenefit(oObject.getBenefit());
		this.setCreated(oObject.getCreated());
		this.setLink(oObject.getLink());
		this.setPlatform(oObject.getObjectid());
		this.setPlatform(oObject.getPlatform());
		this.setText(oObject.getText());
	}
}
