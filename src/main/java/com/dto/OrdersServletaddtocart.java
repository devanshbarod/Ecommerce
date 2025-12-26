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
 * Servlet implementation class OrdersServletaddtocart
 */
@WebServlet("/OrdersServletaddtocart")
public class OrdersServletaddtocart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrdersServletaddtocart() {
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

	    // Receive multiple values from JSP form
	    String[] productIdArray = request.getParameterValues("productid");
	    String[] nameArray = request.getParameterValues("name");
	    String[] priceArray = request.getParameterValues("price");
	    String[] emailArray = request.getParameterValues("email");
	    String[] imageArray = request.getParameterValues("image");

	    // Convert to ArrayList
	    ArrayList<Integer> productIds = new ArrayList<>();
	    ArrayList<String> names = new ArrayList<>();
	    ArrayList<Double> prices = new ArrayList<>();
	    ArrayList<String> emails = new ArrayList<>();
	    ArrayList<String> images = new ArrayList<>();

	    for (int i = 0; i < productIdArray.length; i++) {
	        productIds.add(Integer.parseInt(productIdArray[i]));
	        names.add(nameArray[i]);
	        prices.add(Double.parseDouble(priceArray[i]));
	        emails.add(emailArray[i]);
	        images.add(imageArray[i]);
	    }

	    // Insert all items
	    DataBaseConnection db = new DataBaseConnection();

	    for (int i = 0; i < productIds.size(); i++) {
	        db.AddOrders(paymentid, prices.get(i), emails.get(i), productIds.get(i), names.get(i), images.get(i));
	        db.DeleteOrderAddtoCart(emails.get(i), productIds.get(i));
	    }

	    // Redirect after completing all orders
	    RequestDispatcher rd = request.getRequestDispatcher("OrderConfirmationbyemail");
	    rd.forward(request, response);
	    
		doGet(request, response);
	}

}
