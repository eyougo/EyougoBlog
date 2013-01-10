package com.eyougo.blog.comm;

import com.eyougo.blog.base.cache.CacheList;

public class ServerInfo {
	private static ServerInfo instance;
	private ServerInfo() {
		runtimeName = System.getProperty("java.runtime.name");
		vmVersion = System.getProperty("java.vm.version");
		runtimeVersion = System.getProperty("java.runtime.version");
		vmVendor = System.getProperty("java.vm.vendor");
		vmInfo = System.getProperty("java.vm.info");
		javaCompiler = System.getProperty("java.compiler");
		appEnviromentRoot = System.getProperty("user.dir");
		osArch = System.getProperty("os.arch");
		osName = System.getProperty("os.name");
		libraryPath = System.getProperty("java.library.path");
		classPath = System.getProperty("java.class.path");
		timeZone = System.getProperty("user.timezone");
		fileEncoding = System.getProperty("file.encoding");
		lang = System.getProperty("user.language");
	}
	public static ServerInfo getInstance(){
		if (instance == null)
        {
            synchronized (ServerInfo.class)
            {
				if (instance == null)
                {
                    instance = new ServerInfo();
                }
            }
        }
        return instance;
	}
	private String runtimeName;
	private String vmVersion;
	private String runtimeVersion;
	private String vmVendor;
	private String vmInfo;
	private String javaCompiler;
	private String appEnviromentRoot;
	private String osArch;
	private String osName;
	private String libraryPath;
	private String classPath;
	private String timeZone;
	private String fileEncoding;
	private String lang;
	public String getRuntimeName() {
		return runtimeName;
	}
	public String getVmVersion() {
		return vmVersion;
	}
	public String getRuntimeVersion() {
		return runtimeVersion;
	}
	public String getVmVendor() {
		return vmVendor;
	}
	public String getVmInfo() {
		return vmInfo;
	}
	public String getJavaCompiler() {
		return javaCompiler;
	}
	public String getAppEnviromentRoot() {
		return appEnviromentRoot;
	}
	public String getOsArch() {
		return osArch;
	}
	public String getOsName() {
		return osName;
	}
	public String getLibraryPath() {
		return libraryPath;
	}
	public String getClassPath() {
		return classPath;
	}
	public String getTimeZone() {
		return timeZone;
	}
	public String getFileEncoding() {
		return fileEncoding;
	}
	public String getLang() {
		return lang;
	}
}
