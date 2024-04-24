package com.home.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.user.util.Cipher;

import account.dao.AccountDao;
import category.dao.CategoryDao;
import entities.Account;
import entities.ProductPage;
import product.dao.ProductDao;

@Controller
@Repository
public class HomeController {
	@Autowired
	ProductDao productDao;

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	AccountDao accountDao;
	
	@RequestMapping(value={"/","home"})
	public String index(Model model) {
		model.addAttribute("page","index");
		model.addAttribute("newProducts",productDao.getNewProduct());
		model.addAttribute("saleProducts",productDao.getSaleProduct());
		return "home";
	}
	@RequestMapping(value={"about"})
	public String about(Model model) {
		model.addAttribute("page","about");
		return "home";
	}
	
	@RequestMapping(value={"contact"})
	public String service(Model model) {
		model.addAttribute("page","contact");
		return "home";
	}
	@RequestMapping(value={"blog-detail"})
	public String blogDetail(Model model) {
		model.addAttribute("page","blog-details");
		return "home";
	}
	@RequestMapping(value={"blog"})
	public String blogs(Model model) {
		model.addAttribute("page","blogs");
		return "home";
	}
	@RequestMapping(value={"shop"})
	public String shop(Integer cateid,String searchname,String fromprice,String sort, Integer pageno, Model model) {
		pageno = pageno == null ? 1 : pageno;
		cateid = cateid == null ? 0 : cateid;
		searchname = searchname == null ? "" : searchname;
		model.addAttribute("cateid",cateid);
		
		model.addAttribute("searchname", searchname);
		float  from = fromprice == null || fromprice.equals("") ? 0 : Float.parseFloat(fromprice);
		float  sortby = sort == null || sort.equals("") ? 0 : Float.parseFloat(sort);
		if (cateid!=0) {
			model.addAttribute("description", categoryDao.getById(cateid).getDescription());
	
		}
		if (from!=0) {
			model.addAttribute("fromprice",fromprice);
		}
		if (sortby!=0) {
			model.addAttribute("sort",sort);
		}

		
		model.addAttribute("page", "shop");
		model.addAttribute("category", categoryDao.search(0));
		
		ProductPage productPage= productDao.paging(cateid,from,sortby, searchname, pageno, 9);
		
		model.addAttribute("products", productPage.getProduct());
		model.addAttribute("totalpage", productPage.getTotalPages());
		model.addAttribute("currentpage", pageno);
		return "home";
	}

	@RequestMapping(value={"detail/{slug}"})
	public String detail(@PathVariable("slug")String slug,Model model) {
		model.addAttribute("product",productDao.getBySlug(slug));
		model.addAttribute("relatedProduct",productDao.getRelatedProduct(productDao.getBySlug(slug).getCategoryId()));
		model.addAttribute("page","productdetail");
		return "home";
	}
	@RequestMapping(value={"login"})
	public String loginUser(Model model) {
		model.addAttribute("page","loginuser");
		model.addAttribute("msg", "");
		return "home";
	}
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String username, String password, Model model, HttpServletRequest req) {
		Account acc = accountDao.getAccount(username);
		String passMd5 = Cipher.GenerateMD5(password);
		if (acc == null || !acc.getPassword().equals(passMd5)) {
			model.addAttribute("msg", "Thông tin đăng nhập sai");
			model.addAttribute("page", "loginuser");
			return "home";
		}
		HttpSession session = req.getSession();
		session.setMaxInactiveInterval(3600);
		session.setAttribute("accountid", acc.getAccountId());
		session.setAttribute("picture", acc.getPicture());
		session.setAttribute("address", acc.getAddress());
		session.setAttribute("phone", acc.getPhone());
		session.setAttribute("email", acc.getEmail());
		session.setAttribute("username", acc.getUserName());
		session.setAttribute("fullname", acc.getFullName());
		return "redirect:/home";
	}
	@RequestMapping(value = "exit")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/home";
	}
	
	
	
}
