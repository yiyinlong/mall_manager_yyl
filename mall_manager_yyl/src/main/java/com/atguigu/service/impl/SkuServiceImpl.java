package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.bean.T_MALL_SKU_ATTR_VALUE;
import com.atguigu.mapper.SkuMapper;
import com.atguigu.service.SkuService;
@Service
public class SkuServiceImpl implements SkuService {

	@Autowired
	SkuMapper skuMapper; 
	@Override
	public void save_sku(T_MALL_SKU sku, List<T_MALL_SKU_ATTR_VALUE> list_av) {
		// TODO Auto-generated method stub
		skuMapper.insert_sku(sku);
		
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("sku_id", sku.getId());
		map.put("shp_id", sku.getShp_id());
		map.put("list_av", list_av);
		skuMapper.insert_sku_av(map);
	}

}
