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
 * Servlet implementation class Subcategorydelete
 */
@WebServlet("/Subcategorydelete")
public class Subcategorydelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Subcategorydelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int subid = Integer.parseInt(request.getParameter("subid"));
		DataBaseConnection db = new DataBaseConnection();
		boolean result = db.delSubcategorySubid(subid);
		System.out.println(subid);
		
		if(result) {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Allsubcategory.jsp");
			rd.forward(request, response);
		}else {
			response.sendRedirect("Adminhome.jsp");
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
