package com.eyougo.blog.base.exception;


public class BaseException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 562110916630941666L;

	public BaseException() {
		super();
	}

	public BaseException(String message, Throwable cause) {
		super(message, cause);
	}

	public BaseException(String message) {
		super(message);
	}

	public BaseException(Throwable cause) {
		super(cause);
	}

}
