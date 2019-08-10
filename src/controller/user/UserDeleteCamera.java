package controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CameraDAO;
import dao.UserDAO;
import entity.Camera;

/**
 * Servlet implementation class UserDeleteCamera
 */
@WebServlet("/UserDeleteCamera")
public class UserDeleteCamera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteCamera() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cameraName = request.getParameter("cameraName");
		UserDAO userDAO = new UserDAO();
		String email = (String) request.getSession().getAttribute("email");
		ArrayList<Integer> addedCamera = userDAO.getadded_camera(email);
		CameraDAO cameraDAO = new CameraDAO();
		for(int i = 0;i < addedCamera.size(); i ++){
			if(addedCamera.get(i) == cameraDAO.getId(cameraName))
				addedCamera.remove(i);
		}
//		addedCamera.remove(cameraDAO.getId(cameraName));
		String temp = "";
		for(int i = 0;i < addedCamera.size()-1; i ++){
			temp += addedCamera.get(i) + "-";
		}
		if(addedCamera.size() == 0)
			temp = "";
		else
			temp += addedCamera.get(addedCamera.size()-1);
		System.out.println(temp);
		userDAO.upadateAddedCamera(email, temp);
	}

}
