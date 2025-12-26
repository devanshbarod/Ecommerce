package com.dto;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DataBaseConnection;

/**
 * Servlet implementation class Productsearchbycategorywithoutlogin
 */
@WebServlet("/Productsearchbycategorywithoutlogin")
public class Productsearchbycategorywithoutlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Productsearchbycategorywithoutlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String cname;
		String subname;
		try {
			cname = request.getParameter("cname");
			subname = request.getParameter("subname");
		} catch(NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Student ID");
			return;
		}
		System.out.println(cname);
		System.out.println(subname);
		DataBaseConnection db = new DataBaseConnection();
		ArrayList<Productget> prosearch = db.showAllrelatedproduct(cname);
		HttpSession session = request.getSession();
		if(prosearch != null) {
			session.setAttribute("prosearch", prosearch);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Showrelatedproductwithoutlogin.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendError(HttpServletResponse.SC_NOT_FOUND,"Student not found");
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
