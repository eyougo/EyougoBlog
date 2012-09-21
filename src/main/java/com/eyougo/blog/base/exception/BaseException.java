package com.eyougo.blog.base.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

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

	public String getStackTraceString() {
		StringBuffer sb = new StringBuffer();
		sb.append("详细信息：");
		sb.append("\n");
		StringWriter stringWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(stringWriter);
		this.printStackTrace(printWriter);
		sb.append(stringWriter.getBuffer());
		printWriter.close();
		return sb.toString();
	}

}
