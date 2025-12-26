package com.dto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DataBaseConnection;

/**
 * Servlet implementation class ChangePasswordbyMobile
 */
@WebServlet("/ChangePasswordbyMobile")
public class ChangePasswordbyMobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePasswordbyMobile() {
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
		
		
		HttpSession session = request.getSession();
		 
		String newPassword = request.getParameter("password");
		String mobile = (String) session.getAttribute("mobile");

		DataBaseConnection data= new DataBaseConnection();
		boolean result = data.changePasswordloginbyMobile(newPassword,mobile);
		boolean result2 = data.changePasswordRegistrationbyMobile(newPassword,mobile);
		
		if(result && result2) {
			request.getSession().setAttribute("mobile", mobile);
			response.sendRedirect("login.jsp");
		}
		else {
			response.sendRedirect("ChangePasswordbyMobile.jsp");
		}
		
		
		doGet(request, response);
	}

}
