package com.office.automation.filter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.office.automation.bean.RoleAt;
import com.office.automation.bean.User;

public class UrlFilter implements Filter{
	
	private FilterConfig config;
	@Override
	public void init(FilterConfig config){
		this.config=config;
	}
	
	@Override
	public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws IOException, ServletException{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse rep=(HttpServletResponse)response;
		ServletContext context=config.getServletContext();
		HttpSession session=req.getSession();
		User user=(User)session.getAttribute("user");
		RequestDispatcher rd=context.getRequestDispatcher("/WEB-INF/jsp/message.jsp");
		boolean flag=false;
		String uri=null;
		if(user==null){
			chain.doFilter(request, response);
		}else{
			uri=req.getRequestURI();
			for(String s:getList(session)){
				if(uri.startsWith(s)){
					flag=true;
				}
			}
			if(flag){
				chain.doFilter(request, response);
			}else{
				rd.forward(request, response);
				//rep.getWriter().print(uri);
				//rep.getWriter().print(getList(session));
				
			}
			
		}
	}
	
	@Override
	public void destroy(){
		
	}
	private ArrayList<String> getList(HttpSession session){
		ArrayList<String> list=new ArrayList<String>();
		list.add("/OfficeAutomation/home/index");
		list.add("/OfficeAutomation/home/logout");
		list.add("/OfficeAutomation/home/annoShow");
		list.add("/OfficeAutomation/home/listHistoryTask");
		list.add("/OfficeAutomation/home/listRunTask");
		
		list.add("/OfficeAutomation/home/historyShow");
		list.add("/OfficeAutomation/home/messageShow");
		list.add("/OfficeAutomation/css");
		list.add("/OfficeAutomation/js");
		@SuppressWarnings("unchecked")
		ArrayList<RoleAt> roleAts=(ArrayList<RoleAt>)session.getAttribute("roleAts");
		for(RoleAt roleAt: roleAts){
			if(roleAt.getIsHave()){
				for(RoleAt childRoleAt: roleAt.getChildRoleAts()){
					if(childRoleAt.getIsHave()){
						int i=childRoleAt.getUrl().indexOf("?");
						if(i==-1){
						    list.add(childRoleAt.getUrl());
						}else{
							list.add(childRoleAt.getUrl().substring(0,i));
						}
					}
			    }
		    }
		}
		
	
		return list;
	}

}
