/**
 * 
 */
package de.madana.webclient.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

import de.madana.webclient.exceptions.UserNotAuthenticatedException;

/**
 * @author J.-Fabian Wenisch
 *
 */
public class ExceptionHandlerFilter extends OncePerRequestFilter {

	@Override
	public void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException
	{
		try 
		{
			filterChain.doFilter(request, response);
		} catch (Exception e) 
		{
			if(e.getCause() instanceof UserNotAuthenticatedException)
				{
				String strDestUri = request.getRequestURI();
		        response.sendRedirect("/login?msg=You need to authenticate yourself to view "+strDestUri+"&requesturi="+strDestUri);
		     
		        return;
				}
			System.out.println("##################################### FILTER");
			e.printStackTrace();
		}
	}

}