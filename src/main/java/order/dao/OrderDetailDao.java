package order.dao;

import java.util.List;

import entities.Order;
import entities.OrderDetail;

public interface OrderDetailDao {
	public List<OrderDetail> getAllByOrderId(String id);
	public void deleteDetailByOrderId(String id);
}
