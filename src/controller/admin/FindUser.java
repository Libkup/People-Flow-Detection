package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import entity.User;

/**
 * Servlet implementation class findUser
 */
@WebServlet("/FindUser")
public class FindUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();     //初始化out对象
		String option = request.getParameter("option");
		String input = request.getParameter("input");
//		if(input.equals("")){
//			out.print("<script language='javascript'>alert('输入不能为空');window.location.href='finduser.jsp';</script>");
//		}
		
		UserDAO userDAO = new UserDAO();
//		User user = new User();
		ArrayList<User> users = new ArrayList<>();
		switch (option) {
		case "用户名":
			users = userDAO.getUserByName(input);
			break;
		case "邮箱":
			users = userDAO.getUserByEmai(input);
			break;
		case "性别":
			users = userDAO.getUserByGender(input);
			break;
		case "电话号码":
			users = userDAO.getUserByPhonenumber(input);
			break;
		case "职位":
			users = userDAO.getUserByPosition(input);
			break;
		default:
			out.print("<script language='javascript'>alert('请选择正确的选项');window.location.href='finduser.jsp';</script>");
			break;
		}
		String result = "";
		for(User user : users){
			result += user.getName() + "," + user.getEmail() + "," + user.getPhoneNumber() + "," + user.getPosition() + "," + user.getSelfIntroduction() + "||";
			
		}
		response.getWriter().print(result);
	}

}
