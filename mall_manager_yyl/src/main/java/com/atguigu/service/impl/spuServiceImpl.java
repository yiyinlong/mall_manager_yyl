package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.mapper.SpuMapper;
import com.atguigu.service.SpuService;
@Service
public class spuServiceImpl implements SpuService {
	@Autowired
	SpuMapper spuMapper;
	
	@Override
	public void save_spu(T_MALL_PRODUCT spu, List<String> list_image) {
			//这里先设置一个第一张的封面图片,以后在修改
			spu.setShp_tp(list_image.get(0));
		
		//插入spu信息
		spuMapper.insert_spu(spu);
		
		//向库中插入图片,和主键 (所以需要一个hashMap 接收)
		HashMap<Object,Object> hashMap = new HashMap<>();
		hashMap.put("spu_id", spu.getId());
		hashMap.put("list_image", list_image);
		spuMapper.insert_img(hashMap);
			
	}

	@Override
	public List<T_MALL_PRODUCT> get_spu_list(int class_2_id, int pp_id) {
		
		HashMap<Object,Object> map = new  HashMap<Object,Object>();
		map.put("class_2_id", class_2_id);
		map.put("pp_id",pp_id);
		return spuMapper.select_spu_list(map);
	}


	
}
