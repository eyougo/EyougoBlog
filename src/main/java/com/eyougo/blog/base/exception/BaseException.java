package com.eyougo.blog.base.exception;

import java.io.PrintStream;
import java.io.PrintWriter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class BaseException extends Exception{
	private static final Log LOG = LogFactory.getLog(BaseException.class);
	/** 
	 * @Fields serialVersionUID : 
	 */ 
	private static final long serialVersionUID = 1L;
	protected String errorCode = null;
	protected Throwable cause;
	protected String[] stubArgs;
	
	public BaseException(String message) {
		super(message);
	}
	
	public BaseException(String message, String errorCode) {
		this(message, errorCode, null, null);
	}
	
	public BaseException(String message, String errorCode, String[] stubArgs) {
		this(message, errorCode, null, stubArgs);
	}
	/**
	 * 获取异常并记录异常信息ID和记录异常日志
	 * 
	 * @param message
	 * @param errorCode
	 * @param ex
	 */
	public BaseException(String message, String errorCode, Throwable ex) {
		super(message);
		this.errorCode = errorCode;
		if (ex != null) {
			this.cause = ex;
			ex.printStackTrace();
			LOG.error(message, ex);
		}
	}

	public BaseException(String message, String errorCode, Throwable ex, String[] stubArgs) {
		super(message);
		this.errorCode = errorCode;
		this.stubArgs = stubArgs;
		if (ex != null) {
			this.cause = ex;
			ex.printStackTrace();
			LOG.error(message, ex);
		}
	}
	
	public String[] getStubArgs() {
		return stubArgs;
	}

	public void setStubArgs(String[] stubArgs) {
		this.stubArgs = stubArgs;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public Throwable getCause() {
		return (this.cause == null ? null : this.cause);
	}

	public String getMessage() {
		String message = super.getMessage();
		Throwable cause = getCause();
		if (cause != null && cause instanceof Exception) {
			Exception e = (Exception) cause;
			message = message + "\n nested Exception is " + e.getMessage();
		}
		return message;
	}

	public void printStackTrace(PrintStream ps) {
		if (getCause() == null) {
			super.printStackTrace(ps);
		} else {
			ps.println(this);
			getCause().printStackTrace(ps);
		}
	}

	public void printStackTrace(PrintWriter pw) {
		if (getCause() == null) {
			super.printStackTrace(pw);
		} else {
			pw.println(this);
			getCause().printStackTrace(pw);
		}
	}

}
