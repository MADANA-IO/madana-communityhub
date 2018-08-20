package de.madana.webclient;

import de.madana.common.datastructures.MDN_SocialHistoryObject;

public class MDN_VisualSocialHistoryObject extends MDN_SocialHistoryObject
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

	public MDN_VisualSocialHistoryObject(MDN_SocialHistoryObject oObject)
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
