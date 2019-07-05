package controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.SendEmail;

/**
 * Servlet implementation class SendVerificationCode
 */
@WebServlet("/SendVerificationCode")
public class SendVerificationCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendVerificationCode() {
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
		//doGet(request, response);
		try {
			sendVerificationCode(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/*
	 * used to deal send verification code operation
	 */
	private void sendVerificationCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String email = request.getParameter("emaliAddress");
		String verification = SendEmail.getVerificationCode();
		session.setAttribute("verificationCode", verification);
		session.setAttribute("emailAddress",email);
		String message = "修改密码验证码：" + verification +"。 守住验证码，打死也不要告诉别人哦！" + '\n' + "如非本人操作，请忽略";
		SendEmail.sendEmail(email, message);
		System.out.println(email + " "+ message);
		
		String url = "/changepassword.jsp";
		RequestDispatcher requestDispatcher=request.getRequestDispatcher(url);//通过request获取转发器
		requestDispatcher.forward(request, response);
	}

}
