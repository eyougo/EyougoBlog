package com.eyougo.blog.base.exception;

public class CustomException extends BaseException {

	public CustomException(String message) {
		super(message);
	}

	public CustomException(String message, String errorCode, String[] stubArgs) {
		super(message, errorCode, stubArgs);
		// TODO Auto-generated constructor stub
	}

	public CustomException(String message, String errorCode, Throwable ex,
			String[] stubArgs) {
		super(message, errorCode, ex, stubArgs);
		// TODO Auto-generated constructor stub
	}

	public CustomException(String message, String errorCode, Throwable ex) {
		super(message, errorCode, ex);
		// TODO Auto-generated constructor stub
	}

	public CustomException(String message, String errorCode) {
		super(message, errorCode);
		// TODO Auto-generated constructor stub
	}
}
