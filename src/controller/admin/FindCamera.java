package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CameraDAO;
import entity.Camera;

/**
 * Servlet implementation class FindCamera
 */
@WebServlet("/FindCamera")
public class FindCamera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindCamera() {
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
		String option = request.getParameter("option");
		String input = request.getParameter("input");
		CameraDAO cameraDAO = new CameraDAO();
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
			result += camera.getName() + "," + camera.getLocation() + "," + camera.getDescription() + ","
			+ camera.getHighestHistory() + "," + camera.getHighestHour() + "," + camera.getThreshold() +"||";
		}
		response.getWriter().print(result);
	}

}
