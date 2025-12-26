package com.dto;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DataBaseConnection;

/**
 * Servlet implementation class Adminprofile
 */
@WebServlet("/Adminprofile")
public class Adminprofile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adminprofile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email;
		try {
			email = request.getParameter("email");
		} catch(NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Student ID");
			return;
		}
		System.out.println(email);
		DataBaseConnection db = new DataBaseConnection();
		Allusersget user = db.searchAdmin(email);
		HttpSession session = request.getSession();
		if(user != null) {
			session.setAttribute("userprofile", user);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Adminprofile.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND,"User not found");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
