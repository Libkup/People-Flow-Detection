package controller.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.generic.NEW;

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
//		System.out.println(ids);
		ids = ids.replaceAll(" ", "");
		String[] idsArray = ids.split(",");
		String result = "";
//		System.out.println(idsArray.length);
		if(!ids.equals("")){
			for(int i = 0; i < idsArray.length; i++){
				CameraDAO cameraDAO = new CameraDAO();
				CameralogDAO cameralogDAO = new CameralogDAO();
				int currentCount = 0; 
				ServletContext app01 = this.getServletContext();
				ServletContext time1 = this.getServletContext();
				
				if(app01.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i]))) != null ||
						app01.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i])) + "time") != null)
					currentCount = (int) app01.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i])));
				if(app01.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i])) + "time") != null){
					String time = (String) time1.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i])) + "time");
					Date now = new Date();
					Date formPost = new Date(time);
					if(formPost.before(new Date(now.getTime() -2000)))
						app01.setAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i])), 0);
				}
				
//				System.out.println("get " + app01.getAttribute(cameraDAO.getName(Integer.valueOf(idsArray[i]))));
				int highestHistory = cameraDAO.getHighest(Integer.valueOf(idsArray[i]));
				int hightestHour = cameraDAO.getHighest_hour(Integer.valueOf(idsArray[i]));
				int predict = cameralogDAO.getPredict(Integer.valueOf(idsArray[i]));
				int threshole = cameraDAO.getthreshold(Integer.valueOf(idsArray[i]));
				result += currentCount + "," + highestHistory + "," + hightestHour + "," + predict + "," + threshole + ",";
			}
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
		if(count > cameraDAO.getHighest(id)){
//			System.out.println(cameraDAO.getHighest(id));
			cameraDAO.updateHighestHistory(id, count);
		}
			
		if(count > cameraDAO.getHighest_hour(id))
			cameraDAO.updateHighestHour(id, count);
		CameralogDAO cameralogDAO = new CameralogDAO();
		Cameralog cameralog = new Cameralog();
		cameralog.setId(id);
		cameralog.setCount(count);
		cameralog.setTime(time);
		cameralogDAO.updateCameralog(cameralog);
		HttpSession session = request.getSession();
//		System.out.println("post " + count);
		session.setAttribute(nameFormEdge, count);
		ServletContext app01 = this.getServletContext();
		ServletContext time1 = this.getServletContext();
		Date now = new Date();
        app01.setAttribute(nameFormEdge, count); 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        time1.setAttribute(nameFormEdge + "time", sdf.format(now));
	}

}
