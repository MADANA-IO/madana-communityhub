/**
 * 
 */
package de.madana.webclient.system;

import javax.servlet.http.HttpSession;

import de.madana.webclient.exceptions.UserNotAuthenticatedException;

/**
 * @author J.-Fabian Wenisch
 *
 */
public class SessionHandler
{

	public static String getCurrentUser(HttpSession session) throws UserNotAuthenticatedException
	{
		Object oUsername =  session.getAttribute("username");
		if(oUsername ==null)
			throw new UserNotAuthenticatedException();
		
		return oUsername.toString();
	}
}
