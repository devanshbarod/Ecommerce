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
 * Servlet implementation class Addcart 
 */
@WebServlet("/Addcart")
public class Addcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addcart() {
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
		
		int productid=Integer.parseInt(request.getParameter("productid"));
		String name=request.getParameter("name");
		double price=Double.parseDouble(request.getParameter("price"));
		double total=Double.parseDouble(request.getParameter("price"));
		String img=request.getParameter("img");
		int quantity = 1;
		String email=request.getParameter("email");
		System.out.print(productid); 
		HttpSession session= request.getSession();

		DataBaseConnection db=new DataBaseConnection();
		boolean result=db.Addtocart(productid, name, price, img, quantity,email,total);
		if(result) {
			request.getSession().setAttribute("name",name);
			response.sendRedirect("ShowCart.jsp");
		}
		else {
			response.sendRedirect("Userhome.jsp");
		}

		
		/*
		 * int productid=Integer.parseInt(request.getParameter("productid")); String
		 * name=request.getParameter("name"); double
		 * price=Double.parseDouble(request.getParameter("price")); String
		 * img=request.getParameter("img"); System.out.print(productid); HttpSession
		 * session= request.getSession(); ArrayList<Cartitemget> cart=
		 * (ArrayList<Cartitemget>) session.getAttribute("cart");
		 * 
		 * if(cart == null) { cart = new ArrayList<>(); } boolean found=false;
		 * for(Cartitemget item:cart) { if(item.getProductid() == productid) {
		 * item.setQuantity(item.getQuantity() + 1); found=true; break; } } if(!found) {
		 * cart.add(new Cartitemget(productid, name, price, 1, img)); }
		 * System.out.println(cart); session.setAttribute("cart", cart);
		 * response.sendRedirect("ShowCart.jsp");
		 */
		doGet(request, response);
	}
}