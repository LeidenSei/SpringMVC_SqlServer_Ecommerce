package com.admin.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import category.dao.CategoryDao;
import entities.CategoryPage;
import entities.Order;
import entities.OrderPage;
import order.dao.OrderDao;
import order.dao.OrderDetailDao;
import product.dao.ProductDao;

@Controller
@RequestMapping("admin")
@Repository
public class OrderAdminController {
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;
	@Autowired
	OrderDetailDao orderDetailDao;
	@Autowired
	OrderDao orderDao;
	@RequestMapping(value = {"listorder"})
	public String listorder(String orderId, Integer pageno, Model model) {
		pageno = pageno == null ? 1 : pageno;
		orderId = orderId == null ? "" : orderId;
		System.out.println(orderId);

		OrderPage orderPage = orderDao.getAll(orderId, pageno, 5);
		model.addAttribute("orderId",orderId);
		
		model.addAttribute("orders", orderPage.getOrder());
		model.addAttribute("totalpage", orderPage.getTotalPages());
		model.addAttribute("currentpage", pageno);
		model.addAttribute("page", "order/listorder");
		return "admin";
	}
	
	@RequestMapping(value = { "editOrder/{id}" })
	public String editOrder(@PathVariable("id") String id, Model model) {
		model.addAttribute("order", orderDao.getOrderById(id));
		model.addAttribute("page", "order/editorder");
		return "admin";
	}
	
	@RequestMapping(value = { "updateOrderStatus/{id}"}, method = RequestMethod.POST)
	public String updateOrderStatus(@PathVariable("id") String orderId,Integer orderStatus, Model model,HttpServletRequest req) {
		Order o = orderDao.getOrderById(orderId);
		o.setOrderStatus(orderStatus);
		orderDao.update(o);
		
		return "redirect:/admin/listorder";
	}
	@RequestMapping(value = { "showOrderDetailAdmin/{id}" })
	public String showOrderDetailAdmin(@PathVariable("id") String id, Model model) {
		model.addAttribute("orderDetails", orderDetailDao.getAllByOrderId(id));
		model.addAttribute("page", "order/orderdetail");
		return "admin";
	}
}
