package order.dao;


import java.util.List;
import entities.Order;
import entities.OrderDetail;
import entities.OrderPage;
import entities.Product;


public interface OrderDao  {
	public OrderPage getAll(String name,int pageno, int pagesize);
	public boolean insertOrder(Order obj);
	public boolean insertOrderDetail(Order order, List<OrderDetail> details);
	public List<Order> getAllByAccountId(String id);
	public Order getOrderById(String id);
	public void update(Order o);
	public void deleteOrder(String id);
}
