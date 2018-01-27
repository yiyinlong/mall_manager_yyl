package com.atguigu.mapper;

import java.util.HashMap;
import java.util.List;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuMapper {

	void insert_spu(T_MALL_PRODUCT spu);
	

	void insert_img(HashMap<Object, Object> hashMap);


	List<T_MALL_PRODUCT> select_spu_list(HashMap<Object, Object> map);

}
