package com.dto;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class GenerateMobileOTPafter
 */
@WebServlet("/GenerateMobileOTPafter")
public class GenerateMobileOTPafter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateMobileOTPafter() {
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
		
		
		String action = request.getParameter("action");
        HttpSession session = request.getSession();
        
        if ("register".equals(action)) {
        	String n1 = request.getParameter("otp1");
    		String n2 = request.getParameter("otp2");
    		String n3 = request.getParameter("otp3");
    		String n4 = request.getParameter("otp4");
    		String n5 = request.getParameter("otp5");
    		String n6 = request.getParameter("otp6");
    		
    		
    		String enteredOTP = n1+n2+n3+n4+n5+n6;
    		
            
            String storedOTP = (String) session.getAttribute("otp");
            String storedMobile = (String) session.getAttribute("mobile");
            Long otpTime = (Long) session.getAttribute("otpTime");
            
            // Validate OTP
            if (storedOTP == null || otpTime == null) {
                response.sendRedirect("MobileNumVerify.jsp?error=OTP not requested");
                return;
            }
            
            // Check if OTP is expired (5 minutes)
            if (System.currentTimeMillis() - otpTime > 5 * 60 * 1000) {
                response.sendRedirect("MobileNumVerify.jsp?error=OTP expired");
                return;
            }
            
            
            
            // Verify OTP
            if (!storedOTP.equals(enteredOTP)) {
                response.sendRedirect("OTPverifyMobile.jsp?error=Invalid OTP");
                return;
            }
            
            // OTP verified successfully - Save user to database
            // Add your database logic here
            
            // Clear OTP from session
            session.removeAttribute("otp");
            session.removeAttribute("mobile");
            session.removeAttribute("otpTime");
            
            // Redirect to success page
            
        } else if ("verifyOTP".equals(action)) {
            // Alternative flow: Verify OTP on separate page
        	String n1 = request.getParameter("otp1");
    		String n2 = request.getParameter("otp2");
    		String n3 = request.getParameter("otp3");
    		String n4 = request.getParameter("otp4");
    		String n5 = request.getParameter("otp5");
    		String n6 = request.getParameter("otp6");
    		
    		String enteredOTP = n1+n2+n3+n4+n5+n6;
            String storedOTP = (String) session.getAttribute("otp");
            
            if (storedOTP != null && storedOTP.equals(enteredOTP)) {
                // OTP verified - Save user
                
                // Clear session
                session.removeAttribute("otp");
                session.removeAttribute("mobile");
                
                response.sendRedirect("ChangePasswordbyMobile.jsp");
            } else {
                response.sendRedirect("OTPverifyMobile.jsp");
            }
        }
		
		doGet(request, response);
	}

}
