package com.atguigu.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyPropertyUtil {
	//通过配置文件获取上传的路径 的工具类

	public static String getMyProperty(String property,String key) {
		//创建一个配置文件对象(key,value形式)
		Properties properties = new Properties();
		//获取流,通过类加载器的解析流作用,括号里添加的是文件
		InputStream resourceAsStream = MyPropertyUtil.class.getClassLoader().getResourceAsStream(property);
		
		
		try {//将获取的资源流健在到配置文件对象
			properties.load(resourceAsStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//获取到配置文件中储存好的流中的key值(这里就是一般是配置文件的url),这就是需要的路径
		String path = properties.getProperty(key);
		
		return path;
		
	}
}
