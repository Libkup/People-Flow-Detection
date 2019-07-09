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
 * Servlet implementation class UserAddedCamera
 */
@WebServlet("/UserAddedCamera")
public class UserAddedCamera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAddedCamera() {
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
		String email = (String) request.getSession().getAttribute("email");
		UserDAO userDAO = new UserDAO();
		ArrayList<Camera> addedCamera = userDAO.getAddedCamera(email);
		String result = "";
		CameraDAO cameraDAO = new CameraDAO();
		for(Camera  camera : addedCamera){
			result += camera.getName() + "," + camera.getLocation() + "," + camera.getDescription() + ","
					+ camera.getHighestHistory() + "," + camera.getHighestHour() + "," + camera.getThreshold() +"||";
		}
		response.getWriter().print(result);
	}

}
