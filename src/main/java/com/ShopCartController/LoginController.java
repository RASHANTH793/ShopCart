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

@WebServlet(name = "home", urlPatterns = { "/home" })
public class LoginController extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		response.setContentType("text/html;charset=ISO-8859-1");
		HttpSession session = request.getSession();
		Methods Am = new Methods(session);

		if (request.getParameter("Signup") != null) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pw = request.getParameter("password");
			String cp = request.getParameter("ConfirmPassword");

			if (pw.equals(cp)) {
				String status = Am.Registration(name, email, pw);

				if (status.equals("existed")) {
					RequestDispatcher rd1 = request.getRequestDispatcher("Signup.jsp");
					rd1.forward(request, response);

				} else if (status.equals("success")) {
					RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
					rd1.forward(request, response);

				} else if (status.equals("failure")) {
					RequestDispatcher rd1 = request.getRequestDispatcher("Signup.jsp");
					rd1.forward(request, response);

				}
			}
		} else if (request.getParameter("Login") != null) {
			String email = request.getParameter("Email");
			String pass = request.getParameter("Password");
			String status = Am.login(email, pass);
			if (status.equals("success")) {
				RequestDispatcher rd1 = request.getRequestDispatcher("Home.jsp");
				rd1.forward(request, response);

			} else if (status.equals("failure")) {
				RequestDispatcher rd1 = request.getRequestDispatcher("Login.jsp");
				rd1.forward(request, response);

			} else if (status.equals("adm success")) {
				RequestDispatcher rd1 = request.getRequestDispatcher("adHome.jsp");
				rd1.forward(request, response);
			}
		} else if (request.getParameter("logout") != null) {
			session.invalidate();
			RequestDispatcher rd1 = request.getRequestDispatcher("Home.jsp");
			rd1.forward(request, response);

		} else if (request.getParameter("adProduct") != null) {
			String name = request.getParameter("pname");
			String desc = request.getParameter("pdescription");
			String cost = request.getParameter("pcost");
			String image = request.getParameter("pimage");
			String status = Am.addProduct(name, desc, cost, image);
			if (status.equals("Submitted")) {
				request.setAttribute("status", "New Event Added");
				RequestDispatcher rd = request.getRequestDispatcher("adHome.jsp");
				rd.forward(request, response);
			} else if (status.equals("Already Added")) {
				request.setAttribute("status", "Already Added");
				RequestDispatcher rd = request.getRequestDispatcher("adHome.jsp");
				rd.forward(request, response);
			} else if (status.equals("Failed")) {
				request.setAttribute("status", "Failed To Add Event");
				RequestDispatcher rd = request.getRequestDispatcher("adHome.jsp");
				rd.forward(request, response);
			}
		} else if (request.getParameter("pdelete") != null) {
			String category = request.getParameter("pdname");
			String status = Am.deleteproduct(category);
			if (status.equals("success")) {
				request.setAttribute("status", "Event Deleted");
				RequestDispatcher rd = request.getRequestDispatcher("adHome.jsp");
				rd.forward(request, response);
			} else if (status.equals("not available")) {
				request.setAttribute("status", "Event Category doesn't exist");
				RequestDispatcher rd = request.getRequestDispatcher("adHome.jsp");
				rd.forward(request, response);
			} else if (status.equals("failed")) {
				request.setAttribute("status", "Failed to Delete Event");
				RequestDispatcher rd = request.getRequestDispatcher("adHome.jsp");
				rd.forward(request, response);
			}
		}else if(request.getParameter("UpdateProfile")!=null) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String city = request.getParameter("city");
			String Address = request.getParameter("address");
			String status = Am.updateProfile(name,email,phone,city,Address);
			if(status.equals("sucess")) {
				RequestDispatcher rd = request.getRequestDispatcher("ProfileUpdate.jsp");
				rd.forward(request, response);
			}else {
				RequestDispatcher rd = request.getRequestDispatcher("ProfileUpdate.jsp");
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
		} catch (ClassNotFoundException | ServletException | IOException | SQLException e) {

			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
