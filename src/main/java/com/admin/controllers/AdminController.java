package com.admin.controllers;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import category.dao.CategoryDao;
import entities.Category;
import entities.CategoryPage;
import entities.Product;
import entities.ProductPage;
import product.dao.ProductDao;

@Controller
@RequestMapping("admin")
@Repository
public class AdminController {

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	ProductDao productDao;

	@RequestMapping(value = { "/", "dashboard" })
	public String admin(Model model) {
		model.addAttribute("page", "index");
		return "admin";
	}

	@RequestMapping(value = "category")
	public String paging(String searchname, Integer pageno, Model model) {
		pageno = pageno == null ? 1 : pageno;
		searchname = searchname == null ? "" : searchname;
		model.addAttribute("page", "category");
		CategoryPage catePage = categoryDao.paging(searchname, pageno, 5);
		model.addAttribute("cates", catePage.getCate());
		model.addAttribute("totalpage", catePage.getTotalPages());
		model.addAttribute("currentpage", pageno);
		return "admin";
	}

	@RequestMapping(value = { "addcategory" })
	public String addcategory(Model model) {
		model.addAttribute("cate", new Category());
		model.addAttribute("page", "addcategory");
		return "admin";
	}

	@RequestMapping(value = { "insertCate" })
	public String insert(@Valid @ModelAttribute("cate") Category cate, BindingResult result, Model model,HttpServletRequest req) {
		if (result.hasErrors()) {
			model.addAttribute("cate", cate);
			model.addAttribute("page","addcategory");
			return "admin";
		} else {
			categoryDao.insert(cate);
			HttpSession session = req.getSession();
			session.setAttribute("msg", "Thêm mới thành công");
			return "redirect:/admin/category";
		}

	}

	@RequestMapping(value = { "deleteCate/{id}" })
	public String deleteCate(@PathVariable("id") int id, Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		
		if (productDao.getByCategory(id).isEmpty()) {
			categoryDao.delete(id);
			session.setAttribute("msg", "Xóa thành công");
			
		}
		else {
			session.setAttribute("msgDeleteCate", "Không được xóa do đang có sản phẩm");
		}

		return "redirect:/admin/category";
	}

	@RequestMapping(value = { "editCate/{id}" })
	public String editCate(@PathVariable("id") int id, Model model) {
		model.addAttribute("cate", categoryDao.getById(id));

		model.addAttribute("page", "editcategory");
		return "admin";
	}

	@RequestMapping(value = "updateCate", method = RequestMethod.POST)
	public String updateCate(@Valid @ModelAttribute("cate") Category cate, BindingResult result, Model model,HttpServletRequest req) {
		if (result.hasErrors()) {
			model.addAttribute("cate", cate);

			model.addAttribute("page","editcategory");
			return "admin";
		} else {
			categoryDao.update(cate);
			HttpSession session = req.getSession();
			session.setAttribute("msg", "Cập nhật thành công");
			return "redirect:/admin/category";
		}
	}

//	Product
	@RequestMapping(value = { "listPro" })
	public String product(Integer cateid, String searchname, Integer pageno, Model model) {
		pageno = pageno == null ? 1 : pageno;
		cateid = cateid == null ? 0 : cateid;

		searchname = searchname == null ? "" : searchname;
		model.addAttribute("page", "product/product");
		model.addAttribute("category", categoryDao.search(0));
		model.addAttribute("cateid", cateid);
		model.addAttribute("searchname", searchname);
		ProductPage productPage = productDao.paging(cateid,0,0, searchname, pageno, 5);

		model.addAttribute("products", productPage.getProduct());
		model.addAttribute("totalpage", productPage.getTotalPages());
		model.addAttribute("currentpage", pageno);

		return "admin";
	}

	@RequestMapping(value = { "addproduct" })
	public String addproduct(Model model) {
		model.addAttribute("cates", categoryDao.search(0));
		model.addAttribute("product", new Product());
		model.addAttribute("image", "");
		model.addAttribute("pricefail", "");
		model.addAttribute("page", "product/addproduct");
		return "admin";
	}

	@RequestMapping(value = { "insertProduct" })
	public String insertProduct(@Valid @ModelAttribute("product") Product product, BindingResult result,
			@RequestParam("file") MultipartFile file, Model model, HttpServletRequest req) {
		if (result.hasErrors()) {
			if (file != null && !file.isEmpty()) {
				model.addAttribute("image", "");
			} else {
				model.addAttribute("image", "Ảnh ko được để trống");
			}
			if (product.getPrice()<product.getSale_price()) {
				model.addAttribute("pricefail", "giá khuyến mãi phải bé hơn giá gốc");
			}else {
				model.addAttribute("pricefail", "");
				
			}
			model.addAttribute("cates", categoryDao.search(0));
			model.addAttribute("product", product);
			model.addAttribute("page","product/addproduct");
			return "admin";

		} else {
			if (file != null && !file.isEmpty()) {
				String uploadRootPath = req.getServletContext().getRealPath("/resources/images");
				File destination = new File(uploadRootPath + "/" + file.getOriginalFilename());
				try {
					file.transferTo(destination);
				} catch (Exception e) {
					e.printStackTrace();
				}
				product.setImage("images/" + file.getOriginalFilename());
			}
			product.setCreateDate(Date.valueOf(LocalDate.now()));
			productDao.insert(product);
			HttpSession session = req.getSession();
			session.setAttribute("msg", "Thêm mới thành công");
			return "redirect:/admin/listPro";
		}

	}

	@RequestMapping(value = { "editProduct/{id}" })
	public String editProduct(@PathVariable("id") String id, Model model) {
		model.addAttribute("product", productDao.getById(id));
		model.addAttribute("cates", categoryDao.search(0));
		model.addAttribute("pricefail", "");
		model.addAttribute("page", "product/editproduct");
		return "admin";
	}

	@RequestMapping(value = { "deleteProduct/{id}" })
	public String deleteProduct(@PathVariable("id") String id, Model model,HttpServletRequest req) {
		productDao.delete(id);
		HttpSession session = req.getSession();
		session.setAttribute("msg", "Xóa thành công");
		return "redirect:/admin/listPro";
	}

	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(@Valid @ModelAttribute("product") Product product, BindingResult result, String pictureOld,
			@RequestParam("file") MultipartFile file, Model model, HttpServletRequest req) {
		if (result.hasErrors()) {
			model.addAttribute("product", product);
			if (product.getPrice()<product.getSale_price()) {
				model.addAttribute("pricefail", "giá khuyến mãi phải bé hơn giá gốc");
			}else {
				model.addAttribute("pricefail", "");
				
			}
			model.addAttribute("cates", categoryDao.search(0));
			model.addAttribute("page","product/editproduct");
			return "admin";
		} else {
			if (file != null && !file.isEmpty()) {
				String uploadRootPath = req.getServletContext().getRealPath("/resources/images");
				File destination = new File(uploadRootPath + "/" + file.getOriginalFilename());
				try {
					file.transferTo(destination);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				product.setImage("images/" + file.getOriginalFilename());
			} else {
				product.setImage(pictureOld);
			}
			productDao.update(product);
			HttpSession session = req.getSession();
			session.setAttribute("msg", "Cập nhật thành công");
			return "redirect:/admin/listPro";
		}

	}

}
