package com.atguigu.service;

import java.util.List;

import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;

public interface SkuService {

	public void save_sku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> list_av) ;

}
