package com.buyerschoice.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.buyerschoice.model.Destination;
import com.buyerschoice.model.Package;
import com.buyerschoice.model.Supplier;
import com.google.gson.Gson;

@Repository
public class DestinationDao {


	@Autowired
	private SessionFactory sessionFactory;
	
	

	public DestinationDao() {

	}
	public void insert(Destination dest) {
		Session session = sessionFactory.openSession();
		System.out.println("Insert Method Called for Destination");
		Transaction tx = session.getTransaction();
		tx.begin();
		// int k=supplier.getPrice();
		// dest.setPrice(k);
		session.save(dest);
		System.out.println("Price:"+dest.getPrice());
		tx.commit();
		session.close();
	}

	public String Retrive() {
		Session connection = sessionFactory.openSession();
		Transaction tx = connection.getTransaction();
		tx.begin();
		List listdata = connection.createQuery("FROM Destination").list();
		System.out.println("listdata"+listdata);
		Gson gson = new Gson();
		String jsonNames = gson.toJson(listdata);
		tx.commit();
		connection.close();
		return jsonNames;
	}

	public void Delete(Integer cid) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction();
		tx.begin();
		Destination ob = (Destination) session.get(Destination.class, cid);
		System.out.println("This is ID" + " " + ob.getDestname());
		session.delete(ob);
		session.flush();
		tx.commit();
		session.close();
		System.out.println("Delete Method Called");
	}

	public Destination Updatedest(Integer cid) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction();
		tx.begin();
		Destination ob = (Destination) session.get(Destination.class, cid);
		tx.commit();
		session.close();
		return ob;
	}

	public void NowUpdatedest(int cid, String cname, String cdesc,int price,int stock, String cpackname, String csuppname) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.getTransaction();
		tx.begin();
		Destination ob = (Destination) session.get(Destination.class, cid);
		ob.setDestname(cname);
		ob.setDestdesc(cdesc);
		ob.setPrice(price);
		ob.setStock(stock);
		ob.setPackagename(cpackname);
		
		ob.setSuppliername(csuppname);
		session.update(ob);
		tx.commit();
		session.close();
		System.out.println("Update Method Called");

	}

	public Destination DisplayImage(int ccid) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Destination ok = (Destination) session.get(Destination.class, ccid);
		session.close();
		return ok;

	}
}
