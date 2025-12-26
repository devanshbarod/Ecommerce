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
 * Servlet implementation class Productupdate
 */
@WebServlet("/Productupdate")
public class Productupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Productupdate() {
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
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		String pname = request.getParameter("pname");
		double price = Double.parseDouble(request.getParameter("price"));
		String subcategory = request.getParameter("subcategory");
		String disc = request.getParameter("disc");
		String brand = request.getParameter("brand");
		int qty = Integer.parseInt(request.getParameter("qty"));
		double total = Double.parseDouble(request.getParameter("total"));
		double subtotal = Double.parseDouble(request.getParameter("subtotal"));
		String proimage = request.getParameter("proimage");
		
		DataBaseConnection db = new DataBaseConnection();
		boolean result = db.updateProduct(pid,pname,proimage,price,subcategory,brand,disc,qty,subtotal,total);
			
		if(result) {
			//request.setAttribute("email", email);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Allproduct.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("#");
		}
		
		
		doGet(request, response);
	}

}
