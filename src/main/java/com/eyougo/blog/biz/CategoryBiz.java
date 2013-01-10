package com.eyougo.blog.biz;

import java.util.List;
import java.util.Map;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.entity.Category;

public interface CategoryBiz {

	Category getCategoryById(Integer categoryId);

	List<Category> getAllCategorys();

	Category saveCategory(Category category) throws InternalException;

	boolean deleteCategoryById(Integer categoryId) throws InternalException;

	List<Category> getAllCategoryNames();

	Map<Category, Integer> getCategorysAndPublishedBlogNum();

}