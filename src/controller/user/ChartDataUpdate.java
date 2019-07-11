package controller.user;

import java.io.IOException;

import javax.print.attribute.standard.MediaSize.NA;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CameraDAO;
import dao.CameralogDAO;

/**
 * Servlet implementation class ChartDataUpdate
 */
@WebServlet("/ChartDataUpdate")
public class ChartDataUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChartDataUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String charts = request.getParameter("charts");
		charts = charts.replace(" ","");
		String[] witchChart = charts.split(",");
		CameralogDAO cameralogDAO = new CameralogDAO();
		String datas = "";
		if(!charts.equals("")){
			for(int i = 0; i < witchChart.length; i ++){
				datas = datas + cameralogDAO.getValues(Integer.valueOf((String) witchChart[i].subSequence(11, witchChart[i].length())))+",";
			}
		}
		response.getWriter().print(datas);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
