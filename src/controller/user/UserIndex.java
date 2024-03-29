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
 * Servlet implementation class UserIndex
 */
@WebServlet("/UserIndex")
public class UserIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserIndex() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		UserDAO userDAO = new UserDAO();
		ArrayList<Integer> addedCameras = new ArrayList<>();
		addedCameras = userDAO.getadded_camera(email);
		CameraDAO cameraDAO = new CameraDAO();
		ArrayList<String> charts = new ArrayList<>();
		ArrayList<ArrayList<String>> datas = new ArrayList<ArrayList<String>>();
		ArrayList<Integer> ids = new ArrayList<>();
		ArrayList<String> cgids = new ArrayList<>();
		for(int id: addedCameras){
			ArrayList<String> cameraInformation = new ArrayList<>();
			cameraInformation.add(cameraDAO.getName(id));
			cameraInformation.add(cameraDAO.getLocation(id));
			cameraInformation.add(cameraDAO.getRtmpAddress(id));
			cameraInformation.add("cameraChart" + id);
			cameraInformation.add(String.valueOf(id));
			cgids.add("cg" + id);
			ids.add(id);
			charts.add("cameraChart" + id);
			session.setAttribute("camera" + id + "Threshold", cameraDAO.getthreshold(id));
			datas.add(cameraInformation);
		}
		request.setAttribute("datas", datas);
		request.setAttribute("cgids", cgids);
		request.setAttribute("ids", ids);
		request.setAttribute("charts", charts);
//		for(ArrayList<String> list: datas){
//			for(String str: list){
//				System.out.println(str);
//			}
//		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
