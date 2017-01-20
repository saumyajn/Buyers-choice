package com.buyerschoice.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.buyerschoice.model.AddCart;
import com.google.gson.Gson;

@Repository
public class AddCartDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	public String showCardDetails(AddCart acart) {
		Session session =sessionFactory.openSession();
	
		System.out.println("Insert Method Called for Addcart");
		Transaction tx=session.getTransaction();
		tx.begin();
		session.save(acart);
		tx.commit();
	Gson okk=new Gson();
	String cartDe=okk.toJson(acart);
	session.close();
return cartDe;

}
	public void Delete(Integer cartid)
	{
		Session session= sessionFactory.openSession();
		
		session.beginTransaction();
		
		AddCart cd=(AddCart)session.get(AddCart.class,cartid);
		session.delete(cd);
		session.getTransaction().commit();
		session.close();
	
	}
	
}