package com.atguigu.bean;

import java.util.List;
//用来关联这些参数,和封装.而数据库的映射类不能随便动.所以想要改变某个类就拓展它,继承这个类
public class OBJECT_T_MALL_ATTR extends T_MALL_ATTR {

	private List<T_MALL_VALUE> list_value;

	public List<T_MALL_VALUE> getList_value() {
		return list_value;
	}

	public void setList_value(List<T_MALL_VALUE> list_value) {
		this.list_value = list_value;
	}

}
