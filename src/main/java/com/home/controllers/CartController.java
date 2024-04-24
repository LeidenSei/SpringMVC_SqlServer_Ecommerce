package com.home.controllers;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import account.dao.AccountDao;
import category.dao.CategoryDao;
import entities.Basket;
import entities.Order;
import entities.OrderDetail;
import entities.Product;
import order.dao.OrderDao;
import product.dao.ProductDao;

@Controller
@Repository
public class CartController {
	@Autowired
	ProductDao productDao;

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	AccountDao accountDao;
	@Autowired
	OrderDao orderDao;

	@RequestMapping(value = "countItems")
	public @ResponseBody String getItems(Model model, HttpServletRequest req) {
		List<Basket> baskets = new ArrayList();
		HttpSession session = req.getSession();
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
		}

		return String.valueOf(baskets.size());
	}

	// GET: addItem "thêm sách vào giỏ hàng và trả về tổng số sách trong giỏ"
	@RequestMapping(value = "addItem/{slug}")
	public @ResponseBody String addItem(@PathVariable("slug") String slug, HttpServletRequest req) {
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		Product p = productDao.getBySlug(slug);
		if (session.getAttribute("basket") == null) {
			Basket basket = new Basket(p.getId(), p.getImage(), p.getName(), p.getSlug(), p.getPrice(), 1);
			if (p.getSale_price() > 0) {

				basket = new Basket(p.getId(), p.getImage(), p.getName(), p.getSlug(), p.getSale_price(), 1);
			}

			baskets.add(basket);
			session.setAttribute("basket", baskets);
			
		} else {
			baskets = (List<Basket>) session.getAttribute("basket");
			boolean duplicate = false;
			for (int i = 0; i < baskets.size(); i++) {
				Basket bs = baskets.get(i);
				if (bs.getSlug().equals(slug)) {
					bs.setQuantity(bs.getQuantity() + 1);
					duplicate = true;
					break;
				}
			}
			if (duplicate)
				session.setAttribute("basket", baskets);
			else {
				Basket basket = new Basket(p.getId(),p.getImage(), p.getName(), p.getSlug(), p.getPrice(), 1);
				baskets.add(basket);
			}
		}
		session.setAttribute("msg", "Thêm sản phẩm thành công");
		session.setAttribute("basket", baskets);
		return String.valueOf(baskets.size());
	}

	// GET: gio-hang "trả về sách trong giỏ hàng và hiển thị trên view home/basket"
	@RequestMapping(value = "cart")
	public String showBasket(Model model, HttpServletRequest req) {
		model.addAttribute("page", "shopping-cart");
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
		}
		model.addAttribute("baskets", baskets);
		return "home";
	}

	// GET: updateBasket/{id}/{value} "cập nhật lại số lượng đặt trong giỏ hang"
	@RequestMapping(value = "updateBasket/{slug}/{value}")
	public @ResponseBody String updateBasket(@PathVariable("slug") String slug, @PathVariable("value") Integer quantity,
			Model model, HttpServletRequest req) {
		System.out.println(slug);
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
			for (int i = 0; i < baskets.size(); i++) {
				Basket bs = baskets.get(i);
				if (bs.getSlug().equals(slug)) {
					bs.setQuantity(quantity);
					break;
				}
			}
		}
		return "";
	}

	@RequestMapping(value = "removeItem/{slug}")
	public @ResponseBody String removeItem(@PathVariable("slug") String slug, HttpServletRequest req) {
		List<Basket> baskets = new ArrayList<>();
		HttpSession session = req.getSession();
		boolean find = false;
		if (session.getAttribute("basket") != null) {
			int i;
			baskets = (List<Basket>) session.getAttribute("basket");
			for (i = 0; i < baskets.size(); i++) {
				Basket bs = baskets.get(i);
				if (bs.getSlug().equals(slug)) {
					find = true;
					break;
				}
			}
			if (find) {
				baskets.remove(i);
			}
			session.setAttribute("basket", baskets);
		}

		return "";
	}
	@RequestMapping(value={"checkout"})
	public String about(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("accountid") == null) {

			session.setAttribute("msg", "Bạn phải đăng nhập trước");
			return "redirect:/login";
		}else {
			List<Basket> baskets = new ArrayList<>();
			session = req.getSession();
			if (session.getAttribute("basket") != null) {
				baskets = (List<Basket>) session.getAttribute("basket");
			}
			model.addAttribute("baskets", baskets);
			model.addAttribute("page","checkout");
			return "home";
		}

	}
	
	
	// POST: dat-hang "xử lý đặt hang"
	@RequestMapping(value = "Order")
	public String addOrder(String address, String phone,String email,Integer payment, String note, Model model, HttpServletRequest req) {

		List<Basket> baskets = null;
		HttpSession session = req.getSession();
		if (session.getAttribute("accountid") == null) {
			session.setAttribute("msg", "Bạn phải đăng nhập trước");
			return "redirect:/login";
		}
		if (session.getAttribute("basket") != null) {
			baskets = (List<Basket>) session.getAttribute("basket");
			String timeStamp = new SimpleDateFormat("yyMMdd-HHmmss").format(Calendar.getInstance().getTime());
			Order order = new Order();
			order.setOrderId("HD" + timeStamp);
			order.setAccountId(session.getAttribute("accountid").toString());
			order.setOrderDate(Date.valueOf(LocalDate.now()));
			order.setReceiveAddress(address);
			order.setReceiveEmail(email);
			order.setMethodPayment(payment);
			order.setReceiveDate(null);
			order.setReceivePhone(phone);
			order.setNote(note);
			List<OrderDetail> orderdetails = new ArrayList<OrderDetail>();
			for (Basket basket : baskets) {
				orderdetails.add(new OrderDetail("HD" + timeStamp, basket.getProductId(), basket.getQuantity(),
						basket.getPrice()));
			}
			System.out.println(orderdetails);
			orderDao.insertOrderDetail(order, orderdetails);
			model.addAttribute("msg", "Đặt hàng thành công");
		} else {
			model.addAttribute("msg", "Giỏ hàng trống");
		}
		model.addAttribute("page", "successorder");
		baskets = new ArrayList<Basket>();
		session.setAttribute("basket", null);
		model.addAttribute("baskets", baskets);
		return "home";
	}

}
