package category.dao;

import java.util.List;

import entities.Category;
import entities.CategoryPage;

public interface CategoryDao {
	public List<Category> search(int cateid);
	public Category getById(int id);
	public List<Category> getByName(String name);
	public CategoryPage paging(String name,int pageno, int pagesize);
	public void insert(Category c);
	public void update(Category c);
	public void delete(int id);
}
