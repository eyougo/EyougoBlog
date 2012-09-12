package com.eyougo.blog.dao.hbimpl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;

import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.dao.CategoryDao;
import com.eyougo.blog.entity.Category;

public class CategoryDaoImpl implements CategoryDao {
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Category savaCategory(Category category) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(category);
		return category;
	}

	
	public void deleteCategory(Category category) {
		this.getSessionFactory().getCurrentSession().delete(category);
	}

	@SuppressWarnings("unchecked")
	public List<Category> findAllCategory() {
		List<Category> categorys = this.getSessionFactory().getCurrentSession()
			.createQuery("from Category category order by category.orderNum").list();
		return categorys;
	}

	public Category findCategoryById(Integer categoryId) {
		Category category = (Category)this.getSessionFactory().getCurrentSession().get(Category.class,categoryId);
		return category;
	}

	public Category loadCategoryById(Integer categoryId){
		Category category = (Category)this.getSessionFactory().getCurrentSession().load(Category.class, categoryId);
		return category;
	}
	
	/**
	 * 获得所有类别的某些属性构成的List
	 * @param propertyNames
	 * @return
	 */
	//2.0应该重构这个方法，做成泛型Dao方式，并加入搜索条件
	public List getAllCategoryPropertiesList(String[] propertyNames,OrderProperty[] op){
		Criteria criteria = this.getSessionFactory().getCurrentSession().createCriteria(Category.class);
		if (propertyNames!=null&&propertyNames.length>0) {
			ProjectionList projectionList = Projections.projectionList();
			for (int i = 0; i < propertyNames.length; i++) {				
				projectionList.add( Projections.property(propertyNames[i]));
			}
			criteria=criteria.setProjection( projectionList ) ; 
		}
		if (op != null && op.length > 0) {
			for (int i = 0; i < op.length; i++) {
				if (StringUtils.isNotBlank(op[i].getOrderBy())) {
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_ASC) {
						criteria.addOrder(Order.asc(op[i].getOrderBy()));
					}
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_DESC) {
						criteria.addOrder(Order.desc(op[i].getOrderBy()));
					}
				}
			}
		}
		List list=criteria.list();
		return list;
	}
}
