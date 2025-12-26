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
 * Servlet implementation class ProductsearchbysubcategoryWithoutlogin
 */
@WebServlet("/ProductsearchbysubcategoryWithoutlogin")
public class ProductsearchbysubcategoryWithoutlogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsearchbysubcategoryWithoutlogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pname;
		String cname;
		try {
			pname = request.getParameter("pname");
			cname = request.getParameter("cname");
		} catch(NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Student ID");
			return;
		}
		System.out.println(pname);
		System.out.println(cname);
		DataBaseConnection db = new DataBaseConnection();
		ArrayList<Productget> prosearchbysubcat = db.showAllrelatedsubproduct(pname,cname);
		HttpSession session = request.getSession();
		if(prosearchbysubcat != null) {
			session.setAttribute("prosearchbysubcat", prosearchbysubcat);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/UsersubcategoryWithoutlogin.jsp");
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
