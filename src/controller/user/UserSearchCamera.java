package controller.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.login.FailedLoginException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.mail.imap.protocol.ID;

import dao.CameraDAO;
import dao.UserDAO;
import entity.Camera;

/**
 * Servlet implementation class UserSearchCamera
 */
@WebServlet("/UserSearchCamera")
public class UserSearchCamera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSearchCamera() {
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
		String option = request.getParameter("option");
		String input = request.getParameter("input");
		CameraDAO cameraDAO = new CameraDAO();
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		UserDAO userDAO = new UserDAO();
		ArrayList<Integer> addedCamera = userDAO.getadded_camera(email);
		ArrayList<Camera> cameras = new ArrayList<>();
		switch (option) {
		case "摄像头标识":
			cameras = cameraDAO.getCameraByName(input);
			break;
		case "地点":
			cameras = cameraDAO.getCameraByLocation(input);
		default:
			break;
		}
		String result = "";
		for(Camera camera : cameras){
			int flag = 0;
			for(Integer  i : addedCamera){
				if((int)i == camera.getId()){
					break;
				}
				flag ++;
			}
			if(flag == addedCamera.size()){
				result += camera.getName() + "," + camera.getLocation() + "," + camera.getDescription() + ","
						+ camera.getHighestHistory() + "," + camera.getHighestHour() + "," + camera.getThreshold() +"||";
			}
		}
		response.getWriter().print(result);
	}

}
