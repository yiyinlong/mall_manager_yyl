package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.MODEL_T_MALL_SKU_VALUE;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.bean.T_MALL_SKU;
import com.atguigu.service.AttrService;
import com.atguigu.service.SkuService;
import com.atguigu.service.SpuService;

@Controller
public class SkuController {
	@Autowired
	 private AttrService attrService;
	@Autowired
	private SpuService spuService;
	@Autowired
	private SkuService skuService;
	
	
	@RequestMapping("get_spu_list")
	@ResponseBody
	public List<T_MALL_PRODUCT> get_spu_list(int class_2_id, int pp_id) {
		List<T_MALL_PRODUCT> list_spu =spuService.get_spu_list(class_2_id,pp_id);
		
		return list_spu;
	}
	@RequestMapping("goto_sku")
	public String goto_sku() {
		
		return "manage_sku";
	}
	@RequestMapping("goto_sku_add")
	public String goto_sku_add() {
		
		return "manage_sku_add";
	}
	
	@RequestMapping("save_sku")
	public String save_sku(T_MALL_SKU sku,MODEL_T_MALL_SKU_VALUE list_sku_av) {
		skuService.save_sku(sku,list_sku_av.getList_sku_av());
		return "redirect:/goto_sku_add.do";
	};
	
	
	@RequestMapping("sku_get_attr")
	public String sku_get_attr(int class_2_id,ModelMap map) {
		
		List<OBJECT_T_MALL_ATTR> list_attr =  attrService.get_attr_byClas2Id(class_2_id);
		map.put("list_attr", list_attr);
		return "manage_attr_list_inner";
	}
}
