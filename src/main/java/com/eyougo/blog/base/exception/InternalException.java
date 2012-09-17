package com.eyougo.blog.base.exception;

public class InternalException extends BaseException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6209642518495365637L;

	public InternalException() {
		super();
	}

	public InternalException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public InternalException(String message, Throwable cause) {
		super(message, cause);
	}

	public InternalException(String message) {
		super(message);
	}

	public InternalException(Throwable cause) {
		super(cause);
	}


}
