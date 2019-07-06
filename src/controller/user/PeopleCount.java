package controller.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CameraDAO;
import dao.CameralogDAO;
import entity.Cameralog;

/**
 * Servlet implementation class PeopleCount
 */
@WebServlet("/PeopleCount")
public class PeopleCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleCount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String ids = request.getParameter("ids");
		ids = ids.replaceAll(" ", "");
		String[] idsArray = ids.split(",");
		String result = "";
		for(int i = 0; i < idsArray.length; i++){
			CameraDAO cameraDAO = new CameraDAO();
			CameralogDAO cameralogDAO = new CameralogDAO();
			int currentCount = 0; 
			if(session.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i]))) != null)
				currentCount = (int) session.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i])));
			int highestHistory = cameraDAO.getHighest(Integer.valueOf(idsArray[i]));
			int hightestHour = cameraDAO.getHighest_hour(Integer.valueOf(idsArray[i]));
			int predict = cameralogDAO.getPredict(Integer.valueOf(idsArray[i]));
			int threshole = cameraDAO.getthreshold(Integer.valueOf(idsArray[i]));
			result += currentCount + "," + highestHistory + "," + hightestHour + "," + predict + "," + threshole + ",";
		}
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CameraDAO cameraDAO = new CameraDAO();
		String nameFormEdge = request.getParameter("name");
		int count = Integer.valueOf(request.getParameter("count"));
		Timestamp time = new Timestamp(System.currentTimeMillis());
		int id = cameraDAO.getId(nameFormEdge);
//		if(count > cameraDAO.getHighest(id))
//			cameraDAO
		CameralogDAO cameralogDAO = new CameralogDAO();
		Cameralog cameralog = new Cameralog();
		cameralog.setId(id);
		cameralog.setCount(count);
		cameralog.setTime(time);
		cameralogDAO.updateCameralog(cameralog);
		HttpSession session = request.getSession();
		session.setAttribute(nameFormEdge, count);
	}

}
