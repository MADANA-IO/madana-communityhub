/**
 * 
 */
package de.madana.webclient.system;

import javax.servlet.http.HttpSession;

import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.exceptions.ClientNotInitizializedException;
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
	public static void setCurrentClient(HttpSession session)
	{
		
	}
	
	public static MDN_RestClient getClient(HttpSession session) throws  ClientNotInitizializedException
	{
		Object oClient = session.getAttribute("oClient");
		if(oClient == null)
			throw new ClientNotInitizializedException();
			
			return (MDN_RestClient) oClient;
	}
}
