/**
 * 
 */
package com.madana.webclient.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.servlet.ModelAndView;

import com.madana.webclient.exceptions.ClientNotInitizializedException;
import com.madana.webclient.exceptions.UserNotAuthenticatedException;

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
		} 
		catch (Exception e) 
		{
			if(e.getCause() instanceof UserNotAuthenticatedException | e.getCause() instanceof ClientNotInitizializedException | e.getCause() instanceof javax.ws.rs.NotAuthorizedException)
			{
				String strDestUri = request.getRequestURI();
				response.sendRedirect("/login?msg=You need to authenticate yourself to view "+strDestUri+"&requesturi="+strDestUri);
				return;
			}
			System.out.println("##################################### FILTER");
			e.printStackTrace();
		}
	}
    @org.springframework.web.bind.annotation.ExceptionHandler(Throwable.class)
    public ModelAndView handleError404(HttpServletRequest request, Exception e)  
    {
            ModelAndView mav = new ModelAndView("/404");
            mav.addObject("exception", e);  
            //mav.addObject("errorcode", "404");
            return mav;
    }

}