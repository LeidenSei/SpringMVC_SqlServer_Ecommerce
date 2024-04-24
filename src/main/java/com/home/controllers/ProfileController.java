package com.home.controllers;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import account.dao.AccountDao;
import category.dao.CategoryDao;
import entities.Account;
import entities.Order;
import entities.Product;
import order.dao.OrderDao;
import order.dao.OrderDetailDao;
import product.dao.ProductDao;

@Controller
@Repository
public class ProfileController {
	@Autowired
	ProductDao productDao;

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	AccountDao accountDao;
	@Autowired
	OrderDao orderDao;
	@Autowired
	OrderDetailDao orderDetailDao;
	@RequestMapping(value={"profile"})
	public String profile(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("accountid") == null) {
			return "redirect:/login";
		}else {
			String id = (String) session.getAttribute("accountid");
			
			model.addAttribute("orders",orderDao.getAllByAccountId(id));
			model.addAttribute("acc",accountDao.getAccountById(id));
			model.addAttribute("page","profile");
			return "home";
		}
		
	}
	@RequestMapping(value = { "detailOrder/{id}" })
	public String detailOrder(@PathVariable("id") String id, Model model) {
		model.addAttribute("acc", accountDao.getAccountById(id));
		model.addAttribute("page", "editprofile");
		return "home";
	}
	@RequestMapping(value = { "changStatusOrder/{id}" })
	public String changStatusOrder(@PathVariable("id") String id, Model model) {
		Order o = orderDao.getOrderById(id);
		o.setOrderStatus(3);
		orderDao.update(o);
		return "redirect:/profile";
	}
	@RequestMapping(value = { "changStatusOrder2/{id}" })
	public String changStatusOrder2(@PathVariable("id") String id, Model model) {
		Order o = orderDao.getOrderById(id);
		o.setOrderStatus(0);
		orderDao.update(o);
		
		return "redirect:/profile";
	}
	@RequestMapping(value = { "editAccount/{id}" })
	public String editProduct(@PathVariable("id") String id, Model model) {
		model.addAttribute("acc", accountDao.getAccountById(id));
		model.addAttribute("page", "editprofile");
		return "home";
	}
	
	
	@RequestMapping(value = { "showOrderDetail/{id}" })
	public String showOrderDetail(@PathVariable("id") String id, Model model) {
		model.addAttribute("orderDetails", orderDetailDao.getAllByOrderId(id));
		model.addAttribute("page", "orderdetail");
		return "home";
	}
	
	
	@RequestMapping(value = "updateAccount", method = RequestMethod.POST)
	public String updateProduct(@Valid @ModelAttribute("acc") Account acc, BindingResult result, String pictureOld,
			@RequestParam("file") MultipartFile file, Model model, HttpServletRequest req) {
		if (result.hasErrors()) {
			model.addAttribute("acc", acc);
			model.addAttribute("page","editprofile");
			return "home";
		} else {
			if (file != null && !file.isEmpty()) {
				String uploadRootPath = req.getServletContext().getRealPath("/resources/images");
				File destination = new File(uploadRootPath + "/" + file.getOriginalFilename());
				try {
					file.transferTo(destination);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				acc.setPicture("images/" + file.getOriginalFilename());
			} else {
				acc.setPicture(pictureOld);
			}
			accountDao.updateAcc(acc);
			return "redirect:/profile";
		}
	}
	
	
}
