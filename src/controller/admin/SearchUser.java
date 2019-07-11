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
 * Servlet implementation class SearchUser
 */
@WebServlet("/SearchUser")
public class SearchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchUser() {
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
		String email = request.getParameter("Email");
		User user = new User();
		UserDAO userdao = new UserDAO();
		String data = "";
		if(userdao.verifyExit(email)) {
			user = userdao.getuser(email);
			data = user.getName()+","+user.getEmail()+","+user.getGender()+","+user.getPhoneNumber()+","
					+user.getPosition()+","+user.getSelfIntroduction();
		}else {
			String path = request.getServletPath();//得到请求的url
			if(path.endsWith("deleteuser.jsp")) {
				out.print("<script language='javascript'>alert('用户不存在！');window.location.href='deleteuser.jsp';</script>"); 
			}else if(path.endsWith("changeuser.jsp")) {
				out.print("<script language='javascript'>alert('用户不存在！');window.location.href='changeuser.jsp';</script>"); 
			}
			
		}
		response.getWriter().print(data);
	}

}
