package com.dto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dbs.DataBaseConnection;

/**
 * Servlet implementation class Adduser
 */
@WebServlet("/Adduser")
public class Adduser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adduser() {
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
		
		String user = request.getParameter("username");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		long mobnumber = Long.parseLong(request.getParameter("mobnumber"));
		String gender = request.getParameter("gender");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		int pin = Integer.parseInt(request.getParameter("pin"));
		String role = request.getParameter("role");
		System.out.println("***************************"+fname);
		
		DataBaseConnection data= new DataBaseConnection();
		boolean result = data.addUser(user,fname, lname, password, email, mobnumber, gender, dob, address, state, city, pin, role);
		boolean result2 = data.addUserlogin(user,email,password,role);
		
		if(result && result2) {
			request.setAttribute("email", email);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/allusers.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("Adminhome.jsp");
		}
		
		
		doGet(request, response);
	}

}
