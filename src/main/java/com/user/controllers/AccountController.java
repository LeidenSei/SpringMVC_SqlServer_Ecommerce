package com.user.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.user.util.Cipher;

import account.dao.AccountDao;
import entities.Account;

@Controller
@Repository
@RequestMapping("admin")
public class AccountController {
	@Autowired
	AccountDao accountDao;
	
	//Đăng nhập
	@RequestMapping(value = "dang-nhap", method = RequestMethod.GET)
	public String login(Model model) {
		return "login";
	}
	//POST: dang-nhap "xử lý đăng nhập
		@RequestMapping(value = "dang-nhap", method = RequestMethod.POST)
		public String login(String username, String password, Model model, HttpServletRequest req) {
			Account acc = accountDao.getAccount(username);
			System.out.println(acc.isAdmin());
			String passMd5 = Cipher.GenerateMD5(password);
			if (acc == null || !acc.getPassword().equals(passMd5)||acc.isAdmin()!=false) {
				model.addAttribute("msg", "Thông tin đăng nhập sai");
				return "login";
			}
			HttpSession session = req.getSession();
			session.setMaxInactiveInterval(3600);
			session.setAttribute("accountid", acc.getAccountId());
			session.setAttribute("picture", acc.getPicture());
			session.setAttribute("address", acc.getAddress());
			session.setAttribute("phone", acc.getPhone());
			session.setAttribute("email", acc.getEmail());
			session.setAttribute("fullname", acc.getFullName());
			return "redirect:/admin/";
		}
		//GET: thoat "logout"
		@RequestMapping(value = "thoat")
		public String logout(Model model, HttpServletRequest req) {
			HttpSession session = req.getSession();
			session.invalidate();
			return "redirect:/admin/dang-nhap";
		}
}
