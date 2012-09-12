package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.entity.Category;

public interface CategoryDao {
	
	Category savaCategory(Category category);
	void deleteCategory(Category category);
	Category findCategoryById(Integer categoryId);
	Category loadCategoryById(Integer categoryId);
	List<Category> findAllCategory();
	
	/**
	 * 获得所有类别的某些属性构成的List
	 * @param propertyNames
	 * @return
	 */
	//2.0应该重构这个方法，做成泛型Dao方式，并加入搜索条件
	List getAllCategoryPropertiesList(String[] propertyNames,OrderProperty[] op);
}
