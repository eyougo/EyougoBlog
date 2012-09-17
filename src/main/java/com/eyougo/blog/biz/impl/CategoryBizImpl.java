package com.eyougo.blog.biz.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.CategoryBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.dao.BlogDao;
import com.eyougo.blog.dao.CategoryDao;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

public class CategoryBizImpl implements CategoryBiz {
	private CategoryDao categoryDao;
	private BlogDao blogDao;

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.CategoryBiz#getCategoryById(java.lang.Integer)
	 */
	@Override
	public Category getCategoryById(Integer categoryId) {
		Category category = this.getCategoryDao().findCategoryById(categoryId);
		return category;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.CategoryBiz#getAllCategorys()
	 */
	@Override
	public List<Category> getAllCategorys() {
		List<Category> categorysList = this.getCategoryDao().findAllCategory();
		return categorysList;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.CategoryBiz#saveCategory(com.eyougo.blog.entity.Category)
	 */
	@Override
	public Category saveCategory(Category category) throws InternalException {
		try {
			category = this.getCategoryDao().savaCategory(category);
			return category;
		} catch (Exception e) {
			throw new InternalException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.CategoryBiz#deleteCategoryById(java.lang.Integer)
	 */
	@Override
	public boolean deleteCategoryById(Integer categoryId) throws InternalException {
		boolean deleteSuccess = false;
		try {
			Category category = this.getCategoryDao().loadCategoryById(categoryId);
			if (category != null) {
				this.getCategoryDao().deleteCategory(category);
				deleteSuccess = true;
			}
			return deleteSuccess;
		} catch (Exception e) {
			throw new InternalException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.CategoryBiz#getAllCategoryNames()
	 */
	@Override
	public List<Category> getAllCategoryNames() {
		List<Category> allCategoryNames = new ArrayList<Category>();
		OrderProperty[] op = { new OrderProperty("orderNum", EyougoConstant.ORDER_ASC) };
		List list = this.getCategoryDao().getAllCategoryPropertiesList(new String[] { "id", "category" }, op);
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] object = (Object[]) iterator.next();
			Category category = new Category();
			category.setId((Integer) object[0]);
			category.setCategory((String) object[1]);
			allCategoryNames.add(category);
		}
		return allCategoryNames;

	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.CategoryBiz#getCategorysAndPublishedBlogNum()
	 */
	@Override
	public Map<Category, Integer> getCategorysAndPublishedBlogNum() {
		Map<Category, Integer> numMap = new LinkedHashMap<Category, Integer>();
		OrderProperty[] op = { new OrderProperty("orderNum", EyougoConstant.ORDER_ASC) };
		List list = categoryDao.getAllCategoryPropertiesList(new String[] { "id", "category" }, op);
		Blog blog = new Blog();
		blog.setIsDraft(false);
		List numList = this.getBlogDao().findLikeBlogNumGroupByProperties(blog, new String[] { "category" });
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			Object[] cobject = (Object[]) iterator.next();
			Integer categoryId = (Integer) cobject[0];
			Category category = new Category();
			category.setId(categoryId);
			category.setCategory((String) cobject[1]);
			numMap.put(category, 0);
			for (Iterator iterator2 = numList.iterator(); iterator2.hasNext();) {
				Object[] object = (Object[]) iterator2.next();
				if (((Category) object[1]).getId().equals(categoryId)) {
					numMap.put(category, (Integer) object[0]);
				}
			}
		}
		return numMap;
	}

	public CategoryDao getCategoryDao() {
		return categoryDao;
	}

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	public BlogDao getBlogDao() {
		return blogDao;
	}

	public void setBlogDao(BlogDao blogDao) {
		this.blogDao = blogDao;
	}

}
