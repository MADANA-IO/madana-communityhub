/**
 * 
 */
package de.madana.webclient.system;

import javax.servlet.http.HttpSession;

import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.webclient.exceptions.ClientNotInitizializedException;

/**
 * @author J.-Fabian Wenisch
 *
 */
public class SessionHandler
{

	public static String getCurrentUser(HttpSession session) throws ClientNotInitizializedException
	{
	
		String username =  (String) session.getAttribute("username");
		if(username == null)
		{
			MDN_UserProfile oProfile = getClient(session).getProfile();
			if(oProfile==null)
				throw new ClientNotInitizializedException();
			username = oProfile.getUserName();
			session.setAttribute("username", username);
		}

		return username;
	}

	public static MDN_RestClient getClient(HttpSession session) throws  ClientNotInitizializedException
	{
		Object oClient = session.getAttribute("oClient");
		if(oClient == null)
			{
			initNewClient(session);
			oClient = session.getAttribute("oClient");
			}
			
			return (MDN_RestClient) oClient;
	}
	/**
	 * @param session
	 */
	private static void initNewClient(HttpSession session) 
	{
		MDN_RestClient oClient =  new MDN_RestClient();
		session.setAttribute("oClient", oClient);
		
	}
}
