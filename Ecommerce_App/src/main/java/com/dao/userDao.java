package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entity.UserEntity;

public class userDao {

	private SessionFactory factory;

	public userDao(SessionFactory factory) {
		this.factory = factory;
	}

	// get user by mail and password

	public UserEntity getUserByEmailAndPassword(String email, String password) {

		UserEntity user = null;
		try {

			String query = "from UserEntity where userEmail=: e and userPasswords=: p";
			Session session = this.factory.openSession();

			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);
			user = (UserEntity) q.uniqueResult();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	// update user value
	public int updateUser(UserEntity entity) {
		int result=0;
		int id=0;
		Transaction transaction = null;
		try {
			Session session = this.factory.openSession();
			transaction = session.beginTransaction();
			id = entity.getUserId();
			String query1 = "UPDATE UserEntity Set userName=: uname,userEmail=: uemail,"+
			"userPasswords=: upassword, userPhones=:uphone, userPic=: upic,"+
					"userAddress=:uaddress where userId=: uid";
			Query query = session.createQuery(query1);
			query.setParameter("uname", entity.getUserName());
			query.setParameter("uemail", entity.getUserEmail());
			query.setParameter("upassword", entity.getUserPasswords());
			query.setParameter("uphone", entity.getUserPhones());
			query.setParameter("upic",entity.getUserPic());
			query.setParameter("uaddress", entity.getUserAddress());
			query.setParameter("uid", entity.getUserId());
			result += query.executeUpdate();
			transaction.commit();
			session.close();
			System.out.println(1);
			

		} catch (Exception e) {
			if(transaction!=null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return result;
	}

}
