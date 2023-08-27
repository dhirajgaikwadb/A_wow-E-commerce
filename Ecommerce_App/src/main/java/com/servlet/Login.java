package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userDao;
import com.entity.UserEntity;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
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
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			// authincate user
			userDao userdao = new userDao(FactoryProvider.getFactory());
			UserEntity user = userdao.getUserByEmailAndPassword(email, password);
			if (user == null) {
				HttpSession http = request.getSession();
				http.setAttribute("message1", "Invalid details !! try again");
				response.sendRedirect("Login.jsp");
			} else {
				out.print("welcome " + user.getUserName());
				HttpSession http = request.getSession();
				if (user.getUserType().equals("admin")) {
					// admin parts
					http.setAttribute("auth", user);
					http.setAttribute("message", "Login Succesfull !!");
					response.sendRedirect("admin.jsp");
				} else if (user.getUserType().equals("normal")) {
					http.setAttribute("message", "Login Succesfull !!");
					http.setAttribute("auth", user);
					response.sendRedirect("index.jsp");
				} else {
					out.print("we have not usertype");
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
		}

	}

}
