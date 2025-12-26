package com.dto;

    import java.io.IOException;
    import javax.servlet.*;
    import javax.servlet.http.*;
    import com.razorpay.*;
    import org.json.JSONObject;

    public class CreateOrderServlet extends HttpServlet {
        private static final long serialVersionUID = 1L;

        // Replace with your Razorpay test keys from https://dashboard.razorpay.com/app/keys
        private static final String RAZORPAY_KEY_ID = "rzp_test_Rd8cnewTjhB38q";
        private static final String RAZORPAY_SECRET = "MAFIXeAQ4tI4e7QlJwQI8lYg";

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            response.setContentType("application/json");

            try {
                String amountParam = request.getParameter("amount");
                
                String productid= request.getParameter("productid");
        		
        		System.out.print(productid); 
        		HttpSession session= request.getSession();

                if (amountParam == null || amountParam.trim().isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing 'amount' parameter");
                    return;
                }

                double amount = Double.parseDouble(amountParam) * 100; // convert to paise (₹1 = 100 paise)

                RazorpayClient razorpay = new RazorpayClient(RAZORPAY_KEY_ID, RAZORPAY_SECRET);

                JSONObject orderRequest = new JSONObject();
                orderRequest.put("amount", amount);
                orderRequest.put("currency", "INR");
                orderRequest.put("receipt", "order_rcptid_" + System.currentTimeMillis());
                orderRequest.put("payment_capture", 1);

                Order order = razorpay.orders.create(orderRequest);

                response.getWriter().write(order.toString());

            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, e.getMessage());
            }
        }
    }