package com.ShopCartController;

import java.io.IOException;
import java.sql.SQLException;

import com.ShopCart.Methods.Methods;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddCartCont", urlPatterns = { "/AddCartCont" })
public class AddCartController extends HttpServlet {
	
	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		Methods Am = new Methods(session);
		
		if (request.getParameter("Delete") != null) {
			String c_id = request.getParameter("crtd");
			String Custd = request.getParameter("Cutd");
			int status = Am.deletecart(c_id,Custd);
			if (status > 0) {
				RequestDispatcher rd1 = request.getRequestDispatcher("Cart.jsp");
				rd1.forward(request, response);
			}
		}else if (request.getParameter("PCart") != null) {
			String Quid = request.getParameter("quantity");
			String pid = request.getParameter("productID");
			String status = Am.addtocart(pid,Quid);
			if (status.equals("success")) {
				request.setAttribute("status", "Add Sucessfull");
				RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
				rd.forward(request, response);
			} else if (status.equals("Failure")) {
				request.setAttribute("status", "Add UnSucessfull");
				RequestDispatcher rd = request.getRequestDispatcher("Products.jsp");
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
