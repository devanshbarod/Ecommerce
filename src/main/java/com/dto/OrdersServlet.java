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
 * Servlet implementation class OrdersServlet
 */
@WebServlet("/OrdersServlet")
public class OrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersServlet() {
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
		
		String paymentid = request.getParameter("paymentid");
		int productid = Integer.parseInt(request.getParameter("productid"));
		String name = request.getParameter("name");
		double price = Double.parseDouble(request.getParameter("price"));
		String image = request.getParameter("image");
		String email=request.getParameter("email");
//		String image = request.getParameter("image");)
		System.out.print(paymentid); 
		HttpSession session= request.getSession();
		
		DataBaseConnection db=new DataBaseConnection();
		boolean result=db.AddOrders(paymentid, price, email, productid, name, image);
		if(result) {
			session.setAttribute("productid", productid);
			session.setAttribute("email", email);
			request.getSession().setAttribute("name",name);
			RequestDispatcher rd = request.getRequestDispatcher("OrderConfirmationbyemail");
		    rd.forward(request, response);
		}
		else {
			response.sendRedirect("#");
		}
		doGet(request, response);
	}
}
