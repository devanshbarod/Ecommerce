package com.dto;
import com.razorpay.Utils;
import org.json.JSONObject;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class VerifyPaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String secret = "MAFIXeAQ4tI4e7QlJwQI8lYg";  // same as in CreateOrderServlet

        try {
            String razorpayPaymentId = request.getParameter("razorpay_payment_id");
            String razorpayOrderId = request.getParameter("razorpay_order_id");
            String razorpaySignature = request.getParameter("razorpay_signature");

            // Create a JSON object for verification
            JSONObject options = new JSONObject();
            options.put("razorpay_order_id", razorpayOrderId);
            options.put("razorpay_payment_id", razorpayPaymentId);
            options.put("razorpay_signature", razorpaySignature);

            boolean isEqual = Utils.verifyPaymentSignature(options, secret);

            if (isEqual) {
                response.getWriter().write("✅ Payment verified successfully!");
                // TODO: Save to database
            } else {
                response.getWriter().write("❌ Payment verification failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}
