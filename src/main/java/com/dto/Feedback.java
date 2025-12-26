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
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String experience = request.getParameter("experience");
		int rating = Integer.parseInt(request.getParameter("rating"));
		String usability = request.getParameter("usability");
		String design = request.getParameter("design");
		String performance = request.getParameter("performance");
		String suggestions = request.getParameter("suggestions");
		
		DataBaseConnection data= new DataBaseConnection();
		boolean result = data.addFeedback(name, email, experience, rating, usability, design, performance, suggestions);
		
		if(result) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/#");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("#");
		}
		doGet(request, response);
	}

}
