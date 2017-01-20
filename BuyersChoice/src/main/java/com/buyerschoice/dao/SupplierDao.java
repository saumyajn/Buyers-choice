package com.buyerschoice.dao;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.buyerschoice.model.Supplier;
import com.google.gson.Gson;

@Repository
public class SupplierDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public SupplierDao()
	{}
	
	public void insert(Supplier supplier) {
		Session session =sessionFactory.openSession();
		//session.save(supplier);
		System.out.println("Insert Method Called for Supplier");
		Transaction tx=session.getTransaction();
		tx.begin();
		session.save(supplier);
		tx.commit();
		session.close();
}
	public String Retrive()
	{
		Session connection=sessionFactory.openSession();
		Transaction tx=connection.getTransaction();
		tx.begin();

		List listdata = connection.createQuery("FROM Supplier").list();
		//System.out.println(listdata.getClass().getP);
		Gson gson = new Gson();
		String jsonNames = gson.toJson(listdata);
		tx.commit();
		connection.close();
	    return jsonNames;
	}
	
	public void Delete(int cid) {
		Session session =sessionFactory.openSession();
		Transaction tx=session.getTransaction();
		tx.begin();
		Supplier ob=(Supplier)session.get(Supplier.class, cid);
		session.delete(ob);
		tx.commit();
		session.close();
		System.out.println("Delete Method Called");
}
	
	public Supplier UpdateSupplier(Integer cid) {
		Session session =sessionFactory.openSession();
		Transaction tx=session.getTransaction();
		tx.begin();
		Supplier ob=(Supplier)session.get(Supplier.class, cid);
		tx.commit();
		session.close();
		return ob;
	}

	public void NowUpdateCSupplier(int cid,String cname,String cdesc) {
		Session session =sessionFactory.openSession();
		Transaction tx=session.getTransaction();
		tx.begin();
		Supplier ob=(Supplier)session.get(Supplier.class, cid);
		ob.setSuppliername(cname);
		ob.setSupplierdesc(cdesc);
		
                
		session.update(ob);
		tx.commit();
		session.close();
		System.out.println("Update Method Called");
	
	}
}
