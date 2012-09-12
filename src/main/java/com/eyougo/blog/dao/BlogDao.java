package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

/**
 * 日志持久层
 * @author MeiHongyuan
 *
 */
public interface BlogDao {
	/**
	 * 保存日志
	 * @param blog
	 * 					Blog
	 * @return Blog
	 */
	Blog saveBlog(Blog blog);
	/**
	 * 根据日志Id查询出日志信息
	 * @param blogId
	 * 					Integer
	 * @return Blog
	 */
	Blog findBlogById(Integer blogId);
	/**
	 * 根据排序和分页条件查询日志信息
	 * @param op
	 * @param firstResult
	 * @param maxResults
	 */
	List<Blog> findAllBlogList(OrderProperty[] op,
			int firstResult, int maxResults);
	
	/**
	 * 根据所属类别，排序和分页条件查询日志信息
	 * @param category
	 * @param op
	 * @param firstResult
	 * @param maxResults
	 * @return List<Blog>
	 */
	List<Blog> findBlogListByCategory(Category category, OrderProperty[] op, 
			int firstResult, int maxResults);
	/**
	 * 取得所有日志的数量
	 * @return long
	 */
	long getAllBlogNum();
	
	/**
	 * 
	 * @param category
	 * @return
	 */
	long getBlogNumByCategory(Category category);
	
	/**
	 * 
	 * @param blog
	 * @return
	 */
	long findBlogNumLikeBlog(Blog blog);
	
	/**
	 * 
	 * @param blog
	 * @param op
	 * @param firstResult
	 * @param maxResults
	 * @return
	 */
	List<Blog> findBlogListLikeBlog(Blog blog, OrderProperty[] op, 
			int firstResult, int maxResults); 
	/**
	 * 
	 * @param blog
	 */
	void deleteBlog(Blog blog);
	
	/**
	 * 获得所有与给定blog类似的Blog，然后按propertyNames进行分组统计数量
	 * @param blog
	 * @param propertyNames
	 * @return
	 */
	////2.0应该重构这个方法，做成泛型Dao方式，并加入搜索条件
	public List findLikeBlogNumGroupByProperties(Blog blog,String[] propertyNames );
	
	/**
	 * 根据指定的排序顺序获得给定Blog添加时间之前的第一个Blog对象，不考虑类别
	 * @param blog
	 * @param op
	 * @return
	 */
	public Blog findBlogBeforeThisBlog(Blog blog,OrderProperty[] op);
	
	/**
	 * 根据指定的排序顺序获得给定Blog添加时间之后的第一个Blog对象，不考虑类别
	 * @param blog
	 * @param op
	 * @return
	 */
	public Blog findBlogAfterThisBlog(Blog blog,OrderProperty[] op);
	
}
