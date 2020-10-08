/**
 * 
 */
package com.madana.webclient.system;

import java.io.InputStream;
import java.io.ByteArrayInputStream;
import java.security.cert.X509Certificate;
import java.util.Base64;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.madana.common.datastructures.MDN_UserProfile;
import com.madana.common.restclient.MDN_RestClient;
import com.madana.common.security.certficate.CertificateHandler;
import com.madana.webclient.exceptions.ClientNotInitizializedException;

/**
 * @author J.-Fabian Wenisch
 *
 */
public class SessionHandler implements HttpSessionListener
{
	public static final String BEGIN_CERT = "-----BEGIN CERTIFICATE-----";
	public static final String END_CERT = "-----END CERTIFICATE-----";
	private static int globalSessionCount = 0;

	public void sessionCreated(HttpSessionEvent se) {
		globalSessionCount++;
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		if(globalSessionCount > 0)
			globalSessionCount--;
	}

	public static int getSessionCount() {
		return globalSessionCount;
	}
	public static String getCurrentUser(HttpSession session) throws ClientNotInitizializedException
	{

		String username =  (String) session.getAttribute("username");
		if(username == null)
		{
			MDN_UserProfile oProfile = getClient(session).getProfile();
			if(oProfile==null)
				throw new ClientNotInitizializedException("Couldn't request own profile");
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
		MDN_RestClient oClient =  null;
		if(BackendHandler.getInstance().getConnectionURL().length()>1)
		{
			 oClient =  new MDN_RestClient(BackendHandler.getInstance().getConnectionURL());
		}
		else
		{
			oClient =  new MDN_RestClient();
		}
		X509Certificate clientCert =null;
		try
		{
			String certStr = BackendHandler.getProperty("CERTIFICATE"); //Try to get certificate from env
			InputStream inputStream = null;
			if (certStr.equals("")) 
			{
				inputStream = SessionHandler.class.getResourceAsStream("app.crt"); // If not set, try getting it from file in package ( DEBUG Mode )
			} 
			else 
			{
				inputStream = new ByteArrayInputStream(
						Base64.getDecoder().decode(certStr
								.replaceAll(SessionHandler.BEGIN_CERT, "")
								.replaceAll(SessionHandler.END_CERT, "")
								.replaceAll("\n", ""))
						);
			}
			 clientCert = CertificateHandler.getCertificateFromInputStream(inputStream);
		}
		catch(Exception e)
		{
			System.err.println("Couldn't read certificate from ENV or file");
			throw new  ClientNotInitizializedException("Application certificate could not be read");
		}
		try
		{
			oClient.authApplication(clientCert);
			session.setAttribute("oClient", oClient);
			return;
		}
		catch(Exception ex)
		{
			BackendHandler.handleError(SessionHandler.class.getClass().getSimpleName(), ex);
			throw new  ClientNotInitizializedException(ex.toString());
		}
			
		

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
