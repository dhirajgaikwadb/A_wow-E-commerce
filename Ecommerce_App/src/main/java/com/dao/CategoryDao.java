package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}

	public int saveCategory(Category cate) {

		Session session = this.factory.openSession();

		Transaction tx = session.beginTransaction();
		int categId = (Integer) session.save(cate);
		tx.commit();

		session.close();

		return categId;
	}

	public List<Category> getCategories() {

		Session session = this.factory.openSession();

		Query query = session.createQuery("from Category");
		List<Category> categories = query.list();
		session.close();
		return categories;

	}

	public Category getCategoryById(int id) {
		Category cat = null;
		try {

			Session session = this.factory.openSession();
			
			
			cat = session.get(Category.class, id);
			
			
			
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
	}

}
