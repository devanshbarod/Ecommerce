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
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProduct() {
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
		
		String pname = request.getParameter("pname");
		double price = Double.parseDouble(request.getParameter("price"));
		String category = request.getParameter("subcategory");
		String disc = request.getParameter("disc");
		String brand = request.getParameter("brand");
		int qty = Integer.parseInt(request.getParameter("qty"));
		double total = Double.parseDouble(request.getParameter("total"));
		double subtotal = Double.parseDouble(request.getParameter("subtotal"));
		String proimage = request.getParameter("proimage");
		
		DataBaseConnection db = new DataBaseConnection();
		boolean result = db.addProduct(pname,proimage,price,category,brand,disc,qty,subtotal,total);
			
		if(result) {
			//request.setAttribute("email", email);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Allproduct.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("Adminhome.jsp");
		}
		doGet(request, response);
	}
}