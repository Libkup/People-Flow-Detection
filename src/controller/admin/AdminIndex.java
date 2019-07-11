package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CameraDAO;
import dao.UserDAO;

/**
 * Servlet implementation class AdminIndex
 */
@WebServlet("/AdminIndex")
public class AdminIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		CameraDAO cameradao = new CameraDAO();
		UserDAO userdao = new UserDAO();
		int camera_count = cameradao.getNameList().size();
		int user_count = userdao.getAllUser().size();
		int online_user = 0;
		int highest_history = 0;
		System.out.println(online_user);
		for(int i=0;i<userdao.getAllUser().size();i++) {
			if(userdao.getAllUser().get(i).getStatus()==1) {
				online_user++;
			}
		}
		for(int i=0;i<cameradao.getHistory_Hour_List().size();i++) {
			if(cameradao.getHistory_Hour_List().get(i)>=highest_history) highest_history=cameradao.getHistory_Hour_List().get(i);
		}
		session.setAttribute("online_user", online_user);
		session.setAttribute("camera_count", camera_count);
		session.setAttribute("user_count", user_count);
		session.setAttribute("highest_history", highest_history);
		request.getRequestDispatcher("adminindex.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
