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

import com.dao.userDao;
import com.entity.UserEntity;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class UserUpdate
 */
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserUpdate() {
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
			int id = Integer.parseInt(request.getParameter("user_id"));
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String phone = request.getParameter("user_phone");
			String address = request.getParameter("user_address");
			
			UserEntity user = new UserEntity(id, name, email, password, phone, "default.jpg", address,"normal");
			user.setUserId(id);
			user.setUserName(name);
			user.setUserEmail(email);
			user.setUserPasswords(password);
			user.setUserPhones(phone);
			user.setUserAddress(address);
			
			userDao dao = new userDao(FactoryProvider.getFactory());
			int uid = dao.updateUser(user);
			System.out.println(user);
		//	System.out.println(uid);
			
			
			Session hibernateSession = FactoryProvider.getFactory().openSession();

			Transaction tx = hibernateSession.beginTransaction();
			tx.commit();
			response.sendRedirect("index.jsp");
			hibernateSession.close();
			HttpSession http = request.getSession();
			http.setAttribute("message", "Updation Succesfull !!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
