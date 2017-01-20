package com.buyerschoice.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.buyerschoice.model.OrderDetails;
import com.google.gson.Gson;


@Repository
public class OrderDetailsDao {
	
	@Autowired
	 SessionFactory sessionFactory;
	public void addOrderDetails(OrderDetails od)
	{
		Session session= sessionFactory.openSession();
		
		session.beginTransaction();
		session.save(od);
		session.getTransaction().commit();

		session.close();

	}
	public String getOrderDetail(int oId)
	{
		Session session = sessionFactory.openSession();
		session.beginTransaction();
	    OrderDetails ru=( OrderDetails)session.get(OrderDetails.class,oId);
		session.getTransaction().commit();
		Gson g = new Gson();
	    String data = g.toJson(ru);
		session.close();
	   return data;

	
}}
