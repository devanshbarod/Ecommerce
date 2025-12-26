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
 * Servlet implementation class ShowRelatedSubCategory
 */
@WebServlet("/ShowRelatedSubCategory")
public class ShowRelatedSubCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowRelatedSubCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int cid;
		try {
			cid = Integer.parseInt(request.getParameter("cid"));
		} catch(NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Student ID");
			return;
		}
		System.out.println(cid);
		
		DataBaseConnection db2 = new DataBaseConnection();
		HttpSession session = request.getSession();
		ArrayList<Allsubcategoryget> showrelatedsubcategory = db2.showAllrelatedsubcategory(cid);
		if(showrelatedsubcategory != null) {
			session.setAttribute("showrelatedsubcategory", showrelatedsubcategory);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/Usersubcategory.jsp");
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
