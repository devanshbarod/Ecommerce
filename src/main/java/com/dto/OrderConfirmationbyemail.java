package com.dto;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DataBaseConnection;

/**
 * Servlet implementation class OrderConfirmationbyemail
 */
@WebServlet("/OrderConfirmationbyemail")
public class OrderConfirmationbyemail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirmationbyemail() {
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
		
		HttpSession session = request.getSession();
		
    	String email = request.getParameter("email");
    	String productid = request.getParameter("productid");
    	String name = request.getParameter("name");
    	
		String subject = "Your Order "+ name +" is Confirmed! Thank You for Shopping at E-Cart";
        String body = "Your Order Has Been Confirmed Successfully! \n\n"
        		+ "Dear "+ email +",\n\nThank you for your order! We are happy to confirm that your order has been successfully placed and is now being processed."
        		+ "You can review your complete order details below."
        		+ "Order Summary & Details"
        		+ "Order Name ["+name+"]"
        		+ " For Any Help please call Customer Care Number [1800180098]";

        EmailUtil.sendEmail(email, subject, body);
        response.sendRedirect("Userhome.jsp");
	
		doGet(request, response);
	}		
}
