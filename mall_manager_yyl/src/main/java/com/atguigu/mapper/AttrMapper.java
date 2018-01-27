package com.atguigu.mapper;

import java.util.HashMap;
import java.util.List;

import com.atguigu.bean.OBJECT_T_MALL_ATTR;

public interface AttrMapper {

	void insert_attr(HashMap<Object, Object> map);

	void insert_values(HashMap<Object, Object> map2);

	List<OBJECT_T_MALL_ATTR> select_attr_byClas2Id(int class_2_id);

}
