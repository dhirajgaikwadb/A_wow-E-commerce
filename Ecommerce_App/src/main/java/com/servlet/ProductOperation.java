package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entity.Category;
import com.entity.Product;
import com.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperation
 */
@MultipartConfig
public class ProductOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperation() {
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession http = request.getSession();
		String op = request.getParameter("operation");
		if (op.trim().equals("addcategory")) {
			// fetching category data
			String title = request.getParameter("title");
			String desc = request.getParameter("desc");

			Category category = new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(desc);

			// category save database
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			int cateId = categoryDao.saveCategory(category);
			response.sendRedirect("admin.jsp");

		} else if (op.trim().equals("addproduct")) {
			String Product_Name = request.getParameter("Product_Name");
			String product_desc = request.getParameter("product_desc");
			int Product_price = Integer.parseInt(request.getParameter("Product_price"));
			int Product_discount = Integer.parseInt(request.getParameter("Product_discount"));
			int Product_quantity = Integer.parseInt(request.getParameter("Product_quantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));

			Part part = request.getPart("pic");

			Product p = new Product();
			p.setProductName(Product_Name);
			p.setProductDesc(product_desc);
			p.setProductPrice(Product_price);
			p.setProductDiscount(Product_discount);
			p.setProductQuantity(Product_quantity);
			p.setProductPhoto(part.getSubmittedFileName());
			// get category by id;
			CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
			Category cate = cDao.getCategoryById(catId);
			p.setCategory(cate);

			// product save
			ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
			pDao.saveproduct(p);

			// photo upload
			// find out photo path

			String path = request.getRealPath("img") + File.separator + "products" + File.separator
					+ part.getSubmittedFileName();
			System.out.println();
			System.out.println(path);

			try {
				// uploading code
				FileOutputStream fos = new FileOutputStream(path);
				InputStream fis = part.getInputStream();

				// reading data

				byte[] data = new byte[fis.available()];
				fis.read(data);

				// writing the data
				fos.write(data);
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

			response.sendRedirect("admin.jsp");

		} else {

		}

	}

}
