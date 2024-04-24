package order.dao;




import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.CategoryPage;
import entities.Order;
import entities.OrderDetail;
import entities.OrderPage;
import entities.Product;


@Repository
public class OrderImpl implements OrderDao {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public OrderPage getAll(String orderId,int pageno, int pagesize) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		int records = 0;
		Query query = null;
		
		if (orderId=="") {
			query = session.createQuery("from Order order by orderDate desc");
		}else {
			query=session.createQuery("from Order where orderId like :orderId order by orderDate desc").setParameter("orderId", "%"+orderId+"%");
			
		}
		records=query.getResultList().size();
		query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize);
		List result = query.getResultList();
		OrderPage cp = new OrderPage();
		cp.setOrder(result);
		cp.setCurrentPage(pageno);
		cp.setPageSize(pagesize);
		int totalpage = records % pagesize == 0 ? records / pagesize : (records / pagesize) + 1;
		cp.setTotalPages(totalpage);
		session.close();
		return cp;
	}

	@Override
	public boolean insertOrder(Order obj) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(obj);
		session.getTransaction().commit();
		session.close();
		return true;
	}

	@Override
	public boolean insertOrderDetail(Order order, List<OrderDetail> details) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(order);
			for (OrderDetail orderDetail : details) {
				session.save(orderDetail);
			}
			session.getTransaction().commit();
			session.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<Order> getAllByAccountId(String id) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Order where"
				+ " accountId =:id order by orderDate desc").setParameter("id", id);
		List data = query.getResultList();
		session.close();
		return data;
	}

	@Override
	public void update(Order o) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(o);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Order getOrderById(String id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.createQuery("from Order where orderId = :orderId");
		query.setParameter("orderId", id);

		Order order = (Order) ((org.hibernate.query.Query) query).uniqueResult();
		session.getTransaction().commit();
		session.close();
		return order;
	}

	@Override
	public void deleteOrder(String id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Order order = session.find(Order.class, id);
		session.remove(order);
		session.getTransaction().commit();
		session.close();
		
	}


}

