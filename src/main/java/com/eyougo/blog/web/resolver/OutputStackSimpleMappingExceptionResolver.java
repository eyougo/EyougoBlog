package com.eyougo.blog.web.resolver;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

public class OutputStackSimpleMappingExceptionResolver extends SimpleMappingExceptionResolver {
	/** The default name of the exception attribute: "exceptionstack". */
	public static final String DEFAULT_EXCEPTION_STACK_ATTRIBUTE = "exceptionStack";
	
	private String exceptionStackAttribute = DEFAULT_EXCEPTION_STACK_ATTRIBUTE;
	
	public void setExceptionStackAttribute(String exceptionStackAttribute) {
		this.exceptionStackAttribute = exceptionStackAttribute;
	}
	
	@Override
	protected ModelAndView getModelAndView(String viewName, Exception ex) {
		ModelAndView mv = super.getModelAndView(viewName, ex);
		if (this.exceptionStackAttribute != null) {
			mv.addObject(this.exceptionStackAttribute, getStackTraceString(ex));
		}
		return mv;
	}
	
	protected String getStackTraceString(Exception ex) {
		StringBuffer sb = new StringBuffer();
		sb.append("详细信息：");
		sb.append("\n");
		StringWriter stringWriter = new StringWriter();
		PrintWriter printWriter = new PrintWriter(stringWriter);
		ex.printStackTrace(printWriter);
		sb.append(stringWriter.getBuffer());
		printWriter.close();
		return sb.toString();
	}
	
}
