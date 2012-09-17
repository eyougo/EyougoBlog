package com.eyougo.blog.biz;

import javax.jws.WebParam;
import javax.jws.WebService;

/**
 * 计数器业务接口，来自WebService接口
 * @author Meihongyuan(BLOG:http://blog.eyougo.com;QQ:84952576)
 *
 */
//JAX-WS必需的标注
@WebService
public interface CounterBiz {
	/**
	 * 将计数器加1
	 * @param username
	 * @param password
	 * @return boolean 操作是否成功
	 */
	//使用的WebService接口定义了@WebParam的name属性，这里也要定义，name值要相同
	boolean counter(@WebParam(name="username")String username,@WebParam(name="password")String password);
	/**
	 * 获取计数器的信息
	 * @param username
	 * @param password
	 * @return String 格式为"日计数:周计数:月计数:总计数:最后登记时间或者出错信息"
	 */	
	String getCounterInfo(@WebParam(name="username")String username, @WebParam(name="password")String password);
}