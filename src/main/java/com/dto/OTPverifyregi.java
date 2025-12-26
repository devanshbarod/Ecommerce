package com.dto;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OTPverifyregi
 */
@WebServlet("/OTPverifyregi")
public class OTPverifyregi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OTPverifyregi() {
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
		
		String n1 = request.getParameter("otp1");
		String n2 = request.getParameter("otp2");
		String n3 = request.getParameter("otp3");
		String n4 = request.getParameter("otp4");
		String n5 = request.getParameter("otp5");
		String n6 = request.getParameter("otp6");
		
		String newOtp = n1+n2+n3+n4+n5+n6;
		
		System.out.println(newOtp);
		
        HttpSession session = request.getSession();
        int oldOtp = (int) session.getAttribute("otp");
        
        int newOtp2 = Integer.parseInt(newOtp);
        
        if (newOtp2 == oldOtp) {
            response.sendRedirect("Registration.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.println("Invalid OTP, try again.");
        }
		doGet(request, response);
	}
}