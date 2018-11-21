/**
 * 
 */
package de.madana.webclient.system;

import java.io.InputStream;
import java.security.cert.X509Certificate;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import de.madana.common.datastructures.MDN_UserProfile;
import de.madana.common.restclient.MDN_RestClient;
import de.madana.common.security.certficate.CertificateHandler;
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
	 * @throws ClientNotInitizializedException 
	 */
	private static void initNewClient(HttpSession session) throws ClientNotInitizializedException 
	{
		try
		{
			session.removeAttribute("oClient");
		}
		catch(Exception e)
		{
			
		}
		MDN_RestClient oClient =  new MDN_RestClient();

		try
		{
			InputStream inputStream = SessionHandler.class.getClass().getClassLoader().getResourceAsStream("app.crt");
			X509Certificate clientCert =CertificateHandler.getCertificateFromInputStream(inputStream);
			oClient.authApplication(clientCert);
			session.setAttribute("oClient", oClient);
			return;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		throw new  ClientNotInitizializedException();
		
	}

	public static void validateLoginAttempts(HttpSession session) throws Exception
	{
		int loginAttempt;
        if (session.getAttribute("loginCount") == null)
        {
            session.setAttribute("loginCount", 0);
            session.setAttribute("loginWait", false);
            loginAttempt = 0;
        }
        else
        {
             loginAttempt = (Integer) session.getAttribute("loginCount");
        }

        if (loginAttempt >= 2 )
        {     
        	  Date date = new Date();
        	if (session.getAttribute("loginWait").toString().equals("false"))
        	{
                session.setAttribute("loginWait", true);
        		session.setAttribute("loginWaitTime", date.getTime());
        	}
            long lastAccessedTime = (Long) session.getAttribute("loginWaitTime");
          
            long currentTime = date.getTime();
            long timeDiff = currentTime - lastAccessedTime; 
            if (timeDiff >= 600000)
            {
                //invalidate user session, so they can try again
                session.setAttribute("loginCount",0);
                session.invalidate();
                return;
            }
            else
            {
            	long lWaitTime = 600000 - timeDiff;
            throw new Exception("You have exceeded 3 failed login attempts. Please try again in "+ String.format("%d min, %d sec", 
        		    TimeUnit.MILLISECONDS.toMinutes(lWaitTime),
        		    TimeUnit.MILLISECONDS.toSeconds(lWaitTime) - 
        		    TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(lWaitTime))
        		));
            }  

        }
        else
        {
             loginAttempt++;
        }
        session.setAttribute("loginCount",loginAttempt);

	}

	public static void setSuccessfulLogin(HttpSession session, String userName)
	{
		
	session.setAttribute("username",userName);
	 session.setAttribute("loginCount", 0);
     session.setAttribute("loginWait", false);
		// TODO Auto-generated method stub
		
	}
}
