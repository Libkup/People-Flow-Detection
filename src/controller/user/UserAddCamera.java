package controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CameraDAO;
import dao.UserDAO;

/**
 * Servlet implementation class UserAddCamera
 */
@WebServlet("/UserAddCamera")
public class UserAddCamera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddCamera() {
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
		String cameraName = request.getParameter("cameraName");
		UserDAO userDAO = new UserDAO();
		String email = (String) request.getSession().getAttribute("email");
		ArrayList<Integer> addedCamera = userDAO.getadded_camera(email);
		CameraDAO cameraDAO = new CameraDAO();
		addedCamera.add(cameraDAO.getId(cameraName));
		String temp = "";
		for(int i = 0;i < addedCamera.size()-1; i ++){
			temp += addedCamera.get(i) + "-";
		}
		temp += addedCamera.get(addedCamera.size()-1);
//		System.out.println(temp);
		userDAO.upadateAddedCamera(email, temp);
//		response.getWriter().print("success");
	}

}
