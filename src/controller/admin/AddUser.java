package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		adduser(request, response);
	}

	private void adduser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();     //初始化out对象
		User user = new User(request.getParameter("UserName"), request.getParameter("UserEmail"), "e10adc3949ba59abbe56e057f20f883e",request.getParameter("gender"), request.getParameter("PhoneNumber"),request.getParameter("position"), request.getParameter("Introduction"), "",0);
		UserDAO userdao  = new UserDAO();
		if(userdao.verifyExit(request.getParameter("UserEmail"))) {
			out.print("<script language='javascript'>alert('用户已存在！');window.location.href='adduser.jsp';</script>");     
		}else {
			userdao.register(user);
			out.print("<script language='javascript'>alert('用户添加成功！');window.location.href='adduser.jsp';</script>");     
		}
	}

}
