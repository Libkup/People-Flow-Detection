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
 * Servlet implementation class ChangeCamera
 */
@WebServlet("/ChangeCamera")
public class ChangeCamera extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeCamera() {
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
		int id = cameradao.getId(name);
		if(!name.equals(request.getParameter("cameraname"))&&cameradao.verifyExit(request.getParameter("cameraname"))) {
			out.print("<script language='javascript'>alert('摄像头名字已存在！');window.location.href='changecamera.jsp';</script>"); 
		}else {
		cameradao.updateName(id, request.getParameter("cameraname"));
		cameradao.updatelocation(id, request.getParameter("location"));
		cameradao.updatedescription(id, request.getParameter("description"));
		out.print("<script language='javascript'>alert('用户信息修改成功！');window.location.href='changecamera.jsp';</script>"); 
		}
	}

}
