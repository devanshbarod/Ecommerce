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
 * Servlet implementation class PriceDecrimentaddcart
 */
@WebServlet("/PriceDecrimentaddcart")
public class PriceDecrimentaddcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PriceDecrimentaddcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int qty = Integer.parseInt(request.getParameter("qty"));
		double price = Double.parseDouble(request.getParameter("price"));
		int cartid = Integer.parseInt(request.getParameter("cartid"));
		
		int uqty = qty-1;
		double decrimentprice = uqty*price;
		HttpSession session = request.getSession();
		
		System.out.println(qty);
		System.out.println(decrimentprice);
		
		DataBaseConnection db=new DataBaseConnection();
		boolean result=db.decrimentquantity(uqty, decrimentprice, cartid);
		if(result) {
			session.setAttribute("decrimentprice", decrimentprice);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/ShowCart.jsp");
			rd.forward(request, response);
		}
		else {
			response.sendRedirect("Userhome.jsp");
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
