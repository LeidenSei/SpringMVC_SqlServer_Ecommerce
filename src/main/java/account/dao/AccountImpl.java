package account.dao;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.SessionFactory;
import entities.Account;
import entities.Product;

import javax.persistence.Query;
@Repository
public class AccountImpl implements AccountDao {
	@Autowired
    SessionFactory sessionFactory;
	@Override
	public Account getAccount(String username) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Account where UserName=:name");
		query.setParameter("name", username);
		Account data=null;
		try {
			data=(Account)query.getSingleResult();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return data;
		
	}
	@Override
	public void insertAccoutn(Account a) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(a);
		session.getTransaction().commit();
		session.close();
		
	}
	@Override
	public void updateAccount(Account a) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(a);
		session.getTransaction().commit();
		session.close();
	}
	@Override
	public Account getAccountById(String id) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Account where accountId=:accountId");
		query.setParameter("accountId", id);
		Account data=null;
		try {
			data=(Account)query.getSingleResult();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return data;
		
	}
	@Override
	public void updateAcc(Account a) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(a);
		session.getTransaction().commit();
		session.close();

	}


}
