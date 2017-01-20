package com.buyerschoice.dao;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.buyerschoice.model.User;
import com.buyerschoice.model.UserCredentials;

@Repository
public class UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void insert(User user) {
		Session session = sessionFactory.openSession();

		System.out.println("Insert Method Called for User");
		Transaction tx = session.getTransaction();
		tx.begin();
		session.save(user);
		session.flush();
		tx.commit();
		session.close();
	}

	public void insertCred(UserCredentials userCreden) {

		Session session = sessionFactory.openSession();

		System.out.println("Insert Method Called for UserCredentaials");
		Transaction tx = session.getTransaction();
		tx.begin();
		session.save(userCreden);
		session.flush();
		tx.commit();
		session.close();
	}
	public String address(String uname) {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		String addr = ((User) cr.add(Restrictions.like("username", uname)).list().get(0)).getAddress();
		session.close();
		return addr;

	}
	public String emailid(String uname) {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		String email = ((User) cr.add(Restrictions.like("username", uname)).list().get(0)).getEmailid();
		session.close();
		return email;

	}
	public String mobile(String uname) {
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(User.class);
		String mobile = ((User) cr.add(Restrictions.like("username", uname)).list().get(0)).getMobile();
		session.close();
		return mobile;

	}
	public User display(String uname)
	{
		Session session = sessionFactory.openSession();
		System.out.println(uname);
		Criteria cr=session.createCriteria(User.class);
		User ru=(User)cr.add(Restrictions.like("username",uname)).list().get(0);
		session.close();
		return ru;

}

}