package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_PRODUCT;

public interface SpuService {

	public void save_spu(T_MALL_PRODUCT spu, List<String> list_img) ;

	public List<T_MALL_PRODUCT> get_spu_list(int class_2_id, int pp_id);

	
}
