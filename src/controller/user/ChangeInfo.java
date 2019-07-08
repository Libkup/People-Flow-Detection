package controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class ChangeInfo
 */
@WebServlet("/ChangeInfo")
public class ChangeInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeInfo() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();     //初始化out对象
		UserDAO userdao = new UserDAO();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		User user = userdao.getuser(email);
		user.setEmail(request.getParameter("useremail"));
		user.setName(request.getParameter("username"));
		user.setGender(request.getParameter("gender"));
		user.setPhoneNumber(request.getParameter("phonenumber"));
		user.setPosition(request.getParameter("position"));
		user.setSelfIntroduction(request.getParameter("introduction"));
		userdao.UpdateUser(user,email);
		session.setAttribute("email", request.getParameter("useremail"));
		session.setAttribute("loginUsername",request.getParameter("username"));
		session.setAttribute("User",user);
		out.print("<script language='javascript'>alert('用户信息修改成功！');window.location.href='information.jsp';</script>"); 
	}

}
