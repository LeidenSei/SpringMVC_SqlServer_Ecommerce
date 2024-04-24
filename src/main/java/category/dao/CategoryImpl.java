package category.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Category;
import entities.CategoryPage;

@Repository
public class CategoryImpl implements CategoryDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Category> search(int cateid) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = null;
		if (cateid == 0) {
			query = session.createQuery("from Category");
		} else {
			query = session.createQuery("from Category where categoryId =:id");
			query.setParameter("id", cateid);
		}
		List result = query.getResultList();
		session.close();
		return result;
	}


	@Override
	public CategoryPage paging(String name,int pageno, int pagesize) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		int records = 0;
		Query query = null;
		
		if (name=="") {
			query = session.createQuery("from Category");
			records = query.getResultList().size();
			query.setFirstResult((pageno - 1) * pagesize).setMaxResults(pagesize).getResultList();
		}else {
			query=session.createQuery("from Category where categoryName like :name").setParameter("name", "%"+name+"%");
			records=query.getResultList().size();
			query.setFirstResult((pageno-1)*pagesize).setMaxResults(pagesize);
		}
		List result = query.getResultList();
		CategoryPage cp = new CategoryPage();
		cp.setCate(result);
		cp.setCurrentPage(pageno);
		cp.setPageSize(pagesize);
		int totalpage = records % pagesize == 0 ? records / pagesize : (records / pagesize) + 1;
		cp.setTotalPages(totalpage);
		session.close();
		return cp;
	}

	@Override
	public void insert(Category c) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(c);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void update(Category c) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(c);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void delete(int fkey) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Category category = session.find(Category.class, fkey);
		session.remove(category);
		session.getTransaction().commit();
		session.close();

	}


	@Override
	public Category getById(int id) {
		Session session = sessionFactory.getCurrentSession();

		session.beginTransaction();

		Category cate = session.get(Category.class, id);

		session.getTransaction().commit();

		return cate;
	
	}


	@Override
	public List<Category> getByName(String name) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query=null;
		query=session.createQuery("from Category where categoryName like :name").setParameter("name", "%"+name+"%");
		List result=query.getResultList();
		session.close();
		return result;
	}




}
