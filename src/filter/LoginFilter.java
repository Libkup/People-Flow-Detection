package filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Admin;
import entity.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		 	
			HttpServletRequest request = (HttpServletRequest) req;
			request.setCharacterEncoding("utf-8");
			HttpServletResponse response = (HttpServletResponse) resp;
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();     //初始化out对象
	        List<String> list= new ArrayList<String>(); //将不需要过滤的请求存放到集合中
			list.add("/login.jsp");//登录页面
			list.add("/adminlogin.jsp");//登录页面
			list.add("/forgetpassword.jsp");//登录页面
			String path = request.getServletPath();//得到请求的url
			//循环集合把不需要过滤的请求放行
			for(String l : list){
				if(path.endsWith(l)){
					chain.doFilter(request, response);
					return;
				}
			}
			if((path.endsWith("index.jsp")||path.endsWith("changepassword.jsp")||path.endsWith("information.jsp")||path.endsWith("userAddCamera.jsp")||path.endsWith("userDeleteCamera.jsp"))&&!path.endsWith("adminindex.jsp")) {
				//查看session是否存在对象，有对象的话也不需要过滤
				User user =  (User) request.getSession().getAttribute("User");
				if(user==null){
					//session没有对象就跳转到登录页面
					out.print("<script language='javascript'>alert('请您先登录！');window.location.href='login.jsp';</script>");     
				}
			}else {
				Admin admin = (Admin)request.getSession().getAttribute("admin");
				if(admin==null){
				out.print("<script language='javascript'>alert('请您先登录！');window.location.href='adminlogin.jsp';</script>");
			}
			}
			chain.doFilter(request, response);


	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
