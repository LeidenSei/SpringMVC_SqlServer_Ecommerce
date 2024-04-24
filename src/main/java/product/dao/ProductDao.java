package product.dao;

import java.util.List;

import entities.Category;
import entities.Product;
import entities.ProductPage;

public interface ProductDao {
	public List<Product> getByCategory(int categoryId);
	public List<Product> search(String productId);
	public Product getById(String id);
	public Product getBySlug(String slug);
	public ProductPage paging(int cateid,float from,float sort,String searchname, int pageno, int pagesize);
	public void insert(Product p);
	public void update(Product p);
	public void delete(String id);
	public List<Product> getNewProduct();
	public List<Product> getSaleProduct();
	public List<Product> getRelatedProduct(int id);
}
