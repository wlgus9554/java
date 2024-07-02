package com.webjjang.util.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class EncodingFilter
 */
// @WebFilter("/EncodingFilter")
public class EncodingFilter extends HttpFilter implements Filter {
       
    /**
    * 
    */
   private static final long serialVersionUID = 1L;

   /**
    * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
    */
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      // TODO Auto-generated method stub
      // place your code here

	   System.out.println("EncodingFilter.doFilter() ------------------------->>>");
	   // 한글처리 - 들어오는 데이터에 대한 엔코딩.
	   request.setCharacterEncoding("utf-8");
	   
      // pass the request along the filter chain
      chain.doFilter(request, response);
   }

   /**
    * @see Filter#init(FilterConfig)
    */
   public void init(FilterConfig fConfig) throws ServletException {
      // TODO Auto-generated method stub
   }

}
