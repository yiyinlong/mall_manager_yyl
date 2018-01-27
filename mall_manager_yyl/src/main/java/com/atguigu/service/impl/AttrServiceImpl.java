package com.atguigu.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.bean.MODEL_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.mapper.AttrMapper;
import com.atguigu.service.AttrService;

@Service
public class AttrServiceImpl implements AttrService {

	@Autowired
	private AttrMapper attrMapper;

	@Override
	public void save_attr(int flbh2, List<OBJECT_T_MALL_ATTR> list_attr) {

		for (int i = 0; i < list_attr.size(); i++) {
			OBJECT_T_MALL_ATTR attr = list_attr.get(i);
			HashMap<Object, Object> map = new HashMap<Object, Object>();

			map.put("flbh2", flbh2);
			map.put("attr", attr);
			//插入属性,并返回主键
			attrMapper.insert_attr(map);
			//根据属性主键,批量插入属性值
			
			HashMap<Object, Object> map2 = new HashMap<Object, Object>();
			map2.put("attr_id",attr.getId());
			map2.put("list_value",attr.getList_value());
			
			attrMapper.insert_values(map2);
			
		}
		

	}

	@Override
	public List<OBJECT_T_MALL_ATTR> get_attr_byClas2Id(int class_2_id) {
		List<OBJECT_T_MALL_ATTR> iist_attr = attrMapper.select_attr_byClas2Id(class_2_id);
		return iist_attr;
	}

}
