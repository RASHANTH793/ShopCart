package com.ShopCartController;

import java.io.IOException;

import com.ShopCart.Methods.Methods;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "ManangeOrders", urlPatterns = { "/ManangeOrders" })
public class AdminManageOrder extends HttpServlet {
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		Methods Am = new Methods(session);
		
		if (request.getParameter("accept") != null) {
			int oid = Integer.parseInt(request.getParameter("orderId"));
			int status = Am.AcceptOrder(oid);
			if (status > 0) {
				RequestDispatcher rd1 = request.getRequestDispatcher("adManageOrders.jsp");
				rd1.forward(request, response);
			}
		}else if (request.getParameter("cancel") != null) {
			int oid = Integer.parseInt(request.getParameter("orderId"));
			int status = Am.cancelOrder(oid);
			if (status > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("adManageOrders.jsp");
				rd.forward(request, response);
			} 
		}	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

}

