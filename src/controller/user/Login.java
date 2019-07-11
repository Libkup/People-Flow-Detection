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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		login(request, response);
	}
	
	/**
	 * This function : 1 (account not exited)  2 (password not correct) 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();     //初始化out对象
		String email = request.getParameter("loginUsername");
		String pswd = request.getParameter("loginPassword");
		HttpSession session = request.getSession();
		UserDAO userdao = new UserDAO();
		if(!(userdao.verifyExit(email))) {
			out.print("<script language='javascript'>alert('用户不存在！');window.location.href='login.jsp';</script>");     
		}else {
		boolean match = userdao.verifyPswd(email,pswd);
		if (match) {
			User user = userdao.getuser(email);
			userdao.upadateStatus(email, 1);
            session.setAttribute("loginUsername",userdao.getname(email));
            session.setAttribute("email", email);
            session.setAttribute("User", user);
            response.sendRedirect("UserIndex");
//            request.getRequestDispatcher("UserIndex");
		} else{
			out.print("<script language='javascript'>alert('用户名和密码不匹配！');window.location.href='login.jsp';</script>"); 
			}
				
		}
	}

}
