package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Product;
import com.entity.UserEntity;

public class ProductDao {

	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveproduct(Product p) {
		boolean f = false;
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			session.save(p);
			tx.commit();
			session.close();
			f = true;
		} catch (Exception e) {
			f = false;
		}
		return f;
	}

	// get all products
	public List<Product> getAllProducts() {
		Session session = this.factory.openSession();

		Query query = session.createQuery("from Product");
		List<Product> list = query.list();
		return list;
	}

	public List<Product> getAllProductsbyId(int cid) {
		Session session = this.factory.openSession();

		Query query = session.createQuery("from Product as p where p.category.categoryId=: pid");
		query.setParameter("pid", cid);
		List<Product> list = query.list();
		return list;
	}

	public Product getProductById(int prid) {
		Product p = null;
		try {
			String query = "from Product where productId=: pid";
			Session session = this.factory.openSession();
			p=session.get(Product.class, prid);
			Query q = session.createQuery(query);
			q.setParameter("pid", prid);
			p = (Product) q.getResultList();
			System.out.println(p);
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

}
