package com.ShopCart.Verification;




import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.ShopCart.Methods.Methods;


@WebServlet(name="VerifyOrder", urlPatterns={"/VerifyOrder"})
public class VerifyOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user input and session CAPTCHA
        String userCaptcha = request.getParameter("captchaInput");
        HttpSession session = request.getSession();
        String sessionCaptcha = (String) session.getAttribute("captcha");
        Methods am = new Methods(session);

        if (sessionCaptcha == null || userCaptcha == null) {
            // Handle missing CAPTCHA
            request.setAttribute("captchaError", "CAPTCHA is missing or invalid. Please try again.");
            request.getRequestDispatcher("Cart.jsp").forward(request, response);
            return;
        }

        if (sessionCaptcha.equalsIgnoreCase(userCaptcha)) {
        	if(request.getParameter("captcha")!=null) {
        		String userId = (String) session.getAttribute("id");
            	String payMode= request.getParameter("payMode");
            	String address = request.getParameter("deliveryAddress");
            	String name = request.getParameter("userName");
            	String email = request.getParameter("Email");
            	String city = request.getParameter("city");
            	String state = request.getParameter("state");
            	String number = request.getParameter("Phone");
            	String zipcode = request.getParameter("zipCode");
            	
            	Long OrderId = am.createOrder(userId, payMode);
            	
            	if(OrderId != null) {
            		boolean orderItemsSaved = am.saveOrderItems(OrderId,userId);
            		if(orderItemsSaved) {
            			 boolean orderDetailsSaved = am.saveOrderDetails(OrderId, address,city,state,number,zipcode);
            			 if(orderDetailsSaved) {
            				 response.sendRedirect("Orders.jsp");
            			 }else {
            				 response.setContentType("text/html");
            		            PrintWriter out = response.getWriter();
            		            out.println("<script type='text/javascript'>");
            		            out.println("alert('Failed to save order details. Please try again.');");
            		            out.println("window.location.href='Cart.jsp';"); // Redirect back to a form or relevant page
            		            out.println("</script>");
            			 }
            		}else {
            			response.setContentType("text/html");
            	        PrintWriter out = response.getWriter();
            	        out.println("<script type='text/javascript'>");
            	        out.println("alert('Failed to save order items. Please try again.');");
            	        out.println("window.location.href='Cart.jsp';"); // Redirect back to a form or relevant page
            	        out.println("</script>");
            		}
            	}else {
            		response.setContentType("text/html");
            	    PrintWriter out = response.getWriter();
            	    out.println("<script type='text/javascript'>");
            	    out.println("alert('Unable to proceed forward Without Empty Cart');");
            	    out.println("window.location.href='Cart.jsp';"); // Redirect back to a form or relevant page
            	    out.println("</script>");
            	}
                
        	}
        	
        } else {
            // CAPTCHA verification failed
            session.setAttribute("captchaError", "CAPTCHA did not match. Please try again.");
            response.sendRedirect("Cart.jsp#ConfirmOrderModal");
        }
    }
}
