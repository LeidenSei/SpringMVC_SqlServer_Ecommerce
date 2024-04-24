package product.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import entities.Category;
import entities.Product;
import entities.ProductPage;

@Repository
public class ProductImpl implements ProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> search(String productId) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = null;
		if (productId == "") {
			query = session.createQuery("from Product");
		} else {
			query = session.createQuery("from Product where id =:cateid");
			query.setParameter("productId", productId);
		}
		List result = query.getResultList();
		session.close();
		return result;
	}

	@Override
	public ProductPage paging(int cateid, float from, float sort, String searchname, int pageno, int pagesize) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		int records = 0;
		Query query = null;
		if (from == 0) {
			if (cateid == 0 && searchname == "") {
				query = session.createQuery("from Product ");

				if (cateid == 0 && searchname == "" && sort == 1) {
					query = session.createQuery("from Product order by createDate desc");

				}
				if (cateid == 0 && searchname == "" && sort == 2) {
					query = session.createQuery("from Product order by sale_price asc");

				}
				if (cateid == 0 && searchname == "" && sort == 3) {
					query = session.createQuery("from Product order by sale_price desc");

				}
				if (cateid == 0 && searchname == "" && sort == 4) {
					query = session.createQuery("from Product order by name asc");

				}
				if (cateid == 0 && searchname == "" && sort == 5) {
					query = session.createQuery("from Product order by name desc");

				}
			} else if (cateid != 0 && searchname == "") {
				query = session.createQuery("from Product where categoryId=:cateid").setParameter("cateid", cateid);

				if (cateid != 0 && searchname == "" && sort == 1) {
					query = session.createQuery("from Product where categoryId=:cateid order by createDate desc")
							.setParameter("cateid", cateid);

				}
				if (cateid != 0 && searchname == "" && sort == 2) {
					query = session.createQuery("from Product where categoryId=:cateid order by sale_price asc")
							.setParameter("cateid", cateid);

				}
				if (cateid != 0 && searchname == "" && sort == 3) {
					query = session.createQuery("from Product where categoryId=:cateid order by sale_price desc")
							.setParameter("cateid", cateid);
		
				}
				if (cateid != 0 && searchname == "" && sort == 4) {
					query = session.createQuery("from Product where categoryId=:cateid order by name asc")
							.setParameter("cateid", cateid);

				}
				if (cateid != 0 && searchname == "" && sort == 5) {
					query = session.createQuery("from Product where categoryId=:cateid order by name desc")
							.setParameter("cateid", cateid);
		
				}
			} else if (cateid == 0 && searchname != "") {
				query = session.createQuery("from Product where name like :searchname").setParameter("searchname",
						"%" + searchname + "%");
	
				if (cateid == 0 && searchname != "" && sort == 1) {
					query = session.createQuery("from Product where name like :searchname order by createDate desc")
							.setParameter("searchname",
									"%" + searchname + "%");
					
				}
				if (cateid == 0 && searchname != "" && sort == 2) {
					query = session.createQuery("from Product where name like :searchname order by sale_price asc")
							.setParameter("searchname",
									"%" + searchname + "%");
			
				}
				if (cateid == 0 && searchname != "" && sort == 3) {
					query = session.createQuery("from Product where name like :searchname order by sale_price desc")
							.setParameter("searchname",
									"%" + searchname + "%");
				
				}
				if (cateid == 0 && searchname != "" && sort == 4) {
					query = session.createQuery("from Product where name like :searchname order by name asc")
							.setParameter("searchname",
									"%" + searchname + "%");
			
				}
				if (cateid == 0 && searchname != "" && sort == 5) {
					query = session.createQuery("from Product where name like :searchname order by name desc")
							.setParameter("searchname",
									"%" + searchname + "%");
	
				}
			} else if (cateid != 0 && searchname != "") {
				query = session.createQuery("from Product where categoryId=:cateid and name like :searchname");
				query.setParameter("cateid", cateid);
				query.setParameter("searchname", "%" + searchname + "%");
				if (cateid != 0 && searchname != "" && sort == 1) {
					query = session.createQuery("from Product where categoryId=:cateid and name like :searchname order by createDate desc");
					query.setParameter("cateid", cateid);
					query.setParameter("searchname", "%" + searchname + "%");
					
				}
				if (cateid != 0 && searchname != "" && sort == 2) {
					query = session.createQuery("from Product where categoryId=:cateid and name like :searchname order by sale_price asc");
					query.setParameter("cateid", cateid);
					query.setParameter("searchname", "%" + searchname + "%");
			
				}
				if (cateid != 0 && searchname != "" && sort == 3) {
					query = session.createQuery("from Product where categoryId=:cateid and name like :searchname order by sale_price desc");
					query.setParameter("cateid", cateid);
					query.setParameter("searchname", "%" + searchname + "%");
				
				}
				if (cateid != 0 && searchname != "" && sort == 4) {
					query = session.createQuery("from Product where categoryId=:cateid and name like :searchname order by name asc");
					query.setParameter("cateid", cateid);
					query.setParameter("searchname", "%" + searchname + "%");
			
				}
				if (cateid != 0 && searchname != "" && sort == 5) {
					query = session.createQuery("from Product where categoryId=:cateid and name like :searchname order by name desc");
					query.setParameter("cateid", cateid);
					query.setParameter("searchname", "%" + searchname + "%");
	
				}
		
			}
		} else {
			if (from == 1) {
				query = session.createQuery("from Product where sale_price<:price").setParameter("price",
						(float) 200000);
				
				if (from == 1 && sort == 1) {
					query = session.createQuery("from Product where sale_price<:price order by createDate desc")
							.setParameter("price", (float) 200000);
				
				}
				if (from == 1 && sort == 2) {
					query = session.createQuery("from Product where sale_price<:price order by sale_price asc")
							.setParameter("price", (float) 200000);
					
				}
				if (from == 1 && sort == 3) {
					query = session.createQuery("from Product where sale_price<:price order by sale_price desc")
							.setParameter("price", (float) 200000);
				
				}
				if (from == 1 && sort == 4) {
					query = session.createQuery("from Product where sale_price<:price order by name asc ")
							.setParameter("price", (float) 200000);
					
				}
				if (from == 1 && sort == 5) {
					query = session.createQuery("from Product where sale_price<:price order by name desc ")
							.setParameter("price", (float) 200000);
		
				}
			}
			if (from == 2) {
				query = session.createQuery("from Product where sale_price BETWEEN :minPrice AND :maxPrice");
				query.setParameter("minPrice", (float) 200000);
				query.setParameter("maxPrice", (float) 500000);
				records = query.getResultList().size();
				query.setFirstResult((pageno - 1) * pagesize).setMaxResults(pagesize);
				if (from == 2 && sort == 1) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by createDate desc");
					query.setParameter("minPrice", (float) 200000);
					query.setParameter("maxPrice", (float) 500000);
					
				}
				if (from == 2 && sort == 2) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by sale_price asc");
					query.setParameter("minPrice", (float) 200000);
					query.setParameter("maxPrice", (float) 500000);
					
				}
				if (from == 2 && sort == 3) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by sale_price desc");
					query.setParameter("minPrice", (float) 200000);
					query.setParameter("maxPrice", (float) 500000);
					
				}
				if (from == 2 && sort == 4) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by name asc");
					query.setParameter("minPrice", (float) 200000);
					query.setParameter("maxPrice", (float) 500000);
					

				}
				if (from == 2 && sort == 5) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by name desc");
					query.setParameter("minPrice", (float) 200000);
					query.setParameter("maxPrice", (float) 500000);
					
				}
			}
			if (from == 3) {
				query = session.createQuery("from Product where sale_price BETWEEN :minPrice AND :maxPrice");
				query.setParameter("minPrice", (float) 500000);
				query.setParameter("maxPrice", (float) 1000000);
				
				if (from == 3 && sort == 1) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by createDate desc");
					query.setParameter("minPrice", (float) 500000);
					query.setParameter("maxPrice", (float) 1000000);
					
				}
				if (from == 3 && sort == 2) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by sale_price asc");
					query.setParameter("minPrice", (float) 500000);
					query.setParameter("maxPrice", (float) 1000000);
					
					
				}
				if (from == 3 && sort == 3) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by sale_price desc");
					query.setParameter("minPrice", (float) 500000);
					query.setParameter("maxPrice", (float) 1000000);
					
				}
				if (from == 3 && sort == 4) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by name asc");
					query.setParameter("minPrice", (float) 500000);
					query.setParameter("maxPrice", (float) 1000000);
					

				}
				if (from == 3 && sort == 5) {
					query = session.createQuery(
							"from Product where sale_price BETWEEN :minPrice AND :maxPrice order by name desc");
					query.setParameter("minPrice", (float) 500000);
					query.setParameter("maxPrice", (float) 1000000);
					
				}
			}
			if (from == 4) {
				query = session.createQuery("from Product where sale_price>:price").setParameter("price",
						(float) 1000000);
				records = query.getResultList().size();
				query.setFirstResult((pageno - 1) * pagesize).setMaxResults(pagesize);
				if (from == 4 && sort == 1) {
					query = session.createQuery("from Product where sale_price>:price order by createDate desc")
							.setParameter("price", (float) 1000000);
					
				}
				if (from == 4 && sort == 2) {
					query = session.createQuery("from Product where sale_price>:price order by sale_price asc")
							.setParameter("price", (float) 1000000);
					
				}
				if (from == 4 && sort == 3) {
					query = session.createQuery("from Product where sale_price>:price order by sale_price desc")
							.setParameter("price", (float) 1000000);
					
				}
				if (from == 4 && sort == 4) {
					query = session.createQuery("from Product where sale_price>:price order by name asc ")
							.setParameter("price", (float) 1000000);
					
				}
				if (from == 4 && sort == 5) {
					query = session.createQuery("from Product where sale_price>:price order by name desc ")
							.setParameter("price", (float) 1000000);
					
				}
			}
		}
		records = query.getResultList().size();
		query.setFirstResult((pageno - 1) * pagesize).setMaxResults(pagesize);
		List result = query.getResultList();
		ProductPage pp = new ProductPage();
		pp.setProduct(result);
		pp.setCurrentPage(pageno);
		pp.setPageSize(pagesize);
		int totalpage = records % pagesize == 0 ? records / pagesize : (records / pagesize) + 1;
		pp.setTotalPages(totalpage);
		session.close();
		return pp;
	}

	@Override
	public void insert(Product p) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(p);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void update(Product p) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.update(p);
		session.getTransaction().commit();
		session.close();

	}

	@Override
	public void delete(String fkey) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Product product = session.find(Product.class, fkey);
		session.remove(product);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public Product getById(String id) {
		Session session = sessionFactory.getCurrentSession();

		session.beginTransaction();

		Product product = session.get(Product.class, id);

		session.getTransaction().commit();

		return product;

	}

	@Override
	public List<Product> getNewProduct() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = null;
		query = session.createQuery("from Product where hightlight = true order by createDate desc").setMaxResults(4);
		List result = query.getResultList();
		session.close();
		return result;
	}

	@Override
	public List<Product> getSaleProduct() {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = null;
		query = session.createQuery("from Product where hightlight = true order by (price - sale_price) desc")
				.setMaxResults(4);
		List result = query.getResultList();
		session.close();
		return result;
	}

	@Override
	public List<Product> getByCategory(int categoryId) {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product where categoryId=:id");
		query.setParameter("id", categoryId);
		List result = query.getResultList();
		session.close();
		return result;
	}

	@Override
	public Product getBySlug(String slug) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.createQuery("from Product where slug = :slug");
		query.setParameter("slug", slug);

		Product product = (Product) ((org.hibernate.query.Query) query).uniqueResult();
		session.getTransaction().commit();
		session.close();
		return product;
	}

	@Override
	public List<Product> getRelatedProduct(int id) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Query query = null;
		query = session.createQuery("from Product where categoryId =:cateid").setMaxResults(4);
		query.setParameter("cateid", id);
		List result = query.getResultList();
		session.close();
		return result;
	}

}
