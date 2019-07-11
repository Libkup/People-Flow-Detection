package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CameraDAO;

/**
 * Servlet implementation class SearchCamera
 */
@WebServlet("/SearchCamera")
public class SearchCamera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchCamera() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();     //初始化out对象
		String name = request.getParameter("name");
		CameraDAO cameradao = new CameraDAO();
		String data = "";
		if(cameradao.verifyExit(name)) {
			int id = cameradao.getId(name);
			data = name+","+cameradao.getLocation(id)+","+cameradao.getDescription(id)+","+cameradao.getHighest(id)+","+cameradao.getHighest_hour(id)+","+cameradao.getthreshold(id);
		}else {
			String path = request.getServletPath();//得到请求的url
			if(path.endsWith("deletecamera.jsp")) {
				out.print("<script language='javascript'>alert('摄像头不存在！');window.location.href='deletecamera.jsp';</script>"); 
			}else if(path.endsWith("changecamera.jsp")) {
				out.print("<script language='javascript'>alert('用户不存在！');window.location.href='changecamera.jsp';</script>"); 
			}
		}
		response.getWriter().print(data);
	}

}
