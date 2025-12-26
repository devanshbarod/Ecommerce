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
 * Servlet implementation class Addsubcategory
 */
@WebServlet("/Addsubcategory")
public class Addsubcategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addsubcategory() {
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
		
		String subcname = request.getParameter("subcname");
		int cid = Integer.parseInt(request.getParameter("cid"));
		String proimage = request.getParameter("proimage");
		String cname = request.getParameter("cname");
		
		DataBaseConnection data= new DataBaseConnection();
		boolean result = data.addSubCategory(subcname,cid,proimage,cname);
		
		if(result) {
			//request.setAttribute("email", email);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Allsubcategory.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("Adminhome.jsp");
		}
		
		doGet(request, response);
	}

}
