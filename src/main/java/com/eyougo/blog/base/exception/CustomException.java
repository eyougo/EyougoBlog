package com.eyougo.blog.base.exception;

public class CustomException extends BaseException {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2300604897682818872L;
	
	private String errorCode;
	private String[] errorParams;
	public CustomException(String message) {
		super(message);
	}

	public CustomException(String message, String errorCode, String[] errorParams) {
		super(message);
		this.errorCode = errorCode;
		this.errorParams = errorParams;
	}

	public CustomException(String message, Throwable ex, String errorCode, 
			String[] errorParams) {
		super(message, ex);
		this.errorCode = errorCode;
		this.errorParams = errorParams;
	}

	public CustomException(String message, Throwable ex, String errorCode) {
		super(message, ex);
		this.errorCode = errorCode;
	}

	public CustomException(String message, String errorCode) {
		super(message);
		this.errorCode = errorCode;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public String[] getErrorParams() {
		return errorParams;
	}
	
}
