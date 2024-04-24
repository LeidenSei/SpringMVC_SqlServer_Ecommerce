package order.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.OrderDetail;
@Repository
public class OrderDetailImpl implements OrderDetailDao {
	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public List<OrderDetail> getAllByOrderId(String id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from OrderDetail where"
				+ " orderId =:orderId").setParameter("orderId", id);
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public void deleteDetailByOrderId(String id) {
	}

}
