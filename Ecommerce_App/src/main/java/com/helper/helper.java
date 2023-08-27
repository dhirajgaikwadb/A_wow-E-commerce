package com.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class helper {

	public static String get10Words(String desc) {
		
		String[] strs = desc.split(" ");
		String res="";
		if(strs.length>10) {
			
			for(int i=0;i<10;i++) {
				res=res+strs[i]+" ";
			}
			return (res+".....");
		}
		else {
			return (desc+".....");
		}
		
	}
	
	public static Map<String, Long> getCounts(SessionFactory factory) {
		Session session = factory.openSession();
		String q1="select count(*) from UserEntity";
		String q2="select count(*) from Product";
		
		Query query1 = session.createQuery(q1);
		Query query2 = session.createQuery(q2);
		
		long userCount = (Long)query1.list().get(0);
		long productCount = (Long)query2.list().get(0);
		
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		
		session.close();
		
		return map;
	}
	
}
