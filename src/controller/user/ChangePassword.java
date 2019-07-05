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

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		changePassword(request, response);
	}

	private void changePassword(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String verificationCode = request.getParameter("verificationcode");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("emailAddress");
		String verificationCodeConfirm = (String) session.getAttribute("verificationCode");
		//before initializing the out object, appoint the characterEncoding 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charsset=utf-8");
		response.setCharacterEncoding( "utf-8");
		PrintWriter out = response.getWriter(); // initialize an out object
		if (!verificationCode.equals(verificationCodeConfirm)) {
			out.print("<script language='javascript'>alert('验证码不正确，请输入正确验证码!');window.location.href='changepassword.jsp';</script>");
		} 
		else if(!password.equals(passwordConfirm)) {
			out.print("<script language='javascript'>alert('两次输入的密码不一致，请输入相同的密码!');window.location.href='changepassword.jsp';</script>");
		}
		else {
			UserDAO userdao = new UserDAO();
			userdao.changePassword(email, password);
			//clear session and log out
			if (request.getSession(false) != null) {
				// used to clear the session
				request.getSession().invalidate();
			}
			out.print("<script language='javascript'>alert('密码已经成功修改!');window.location.href='login.jsp';</script>");			
		}
	}
}
