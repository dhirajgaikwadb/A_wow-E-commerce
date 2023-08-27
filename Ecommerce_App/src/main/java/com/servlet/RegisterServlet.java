package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entity.UserEntity;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public RegisterServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			// getting data form register jsp page
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String phone = request.getParameter("user_phone");
			String address = request.getParameter("user_address");

			// creating user object to store data

			UserEntity user = new UserEntity(name, email, password, phone, "default.jpg", address, "normal");

			Session hibernateSession = FactoryProvider.getFactory().openSession();

			Transaction tx = hibernateSession.beginTransaction();

			int userId = (Integer) hibernateSession.save(user);
			tx.commit();

			hibernateSession.close();
			HttpSession http = request.getSession();
			http.setAttribute("message", "Registration Succesfull !!");
			response.sendRedirect("Login.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			HttpSession http = request.getSession();
			http.setAttribute("error_message", "unable to register-" + e.getMessage());
			response.sendRedirect("Register.jsp");
		}

	}

}
