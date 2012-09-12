package com.eyougo.blog.base.cache.exception;

import com.eyougo.blog.base.exception.BaseException;


public class CacheException extends BaseException {
	public CacheException(String message, String errorCode, Throwable ex) {
		super(message, errorCode, ex);
	}
}
