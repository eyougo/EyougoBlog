package com.eyougo.blog.base.exception;

public class InternalException extends BaseException {

	public InternalException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public InternalException(String message, String errorCode) {
		super(message, errorCode);
		// TODO Auto-generated constructor stub
	}

	public InternalException(String message, String errorCode, String[] stubArgs) {
		super(message, errorCode, stubArgs);
		// TODO Auto-generated constructor stub
	}

	public InternalException(String message, String errorCode, Throwable ex) {
		super(message, errorCode, ex);
		// TODO Auto-generated constructor stub
	}

	public InternalException(String message, String errorCode, Throwable ex,
			String[] stubArgs) {
		super(message, errorCode, ex, stubArgs);
		// TODO Auto-generated constructor stub
	}

}
