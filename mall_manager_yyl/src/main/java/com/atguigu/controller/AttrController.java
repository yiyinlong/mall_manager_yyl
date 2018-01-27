package com.atguigu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.bean.MODEL_T_MALL_ATTR;
import com.atguigu.bean.OBJECT_T_MALL_ATTR;
import com.atguigu.service.AttrService;

@Controller
public class AttrController {
	@Autowired
	private AttrService attrService;
	
	
	@RequestMapping("get_attr_list_json")
	@ResponseBody
	public List<OBJECT_T_MALL_ATTR> get_attr_list_json(int class_2_id,ModelMap map) {
		List<OBJECT_T_MALL_ATTR> list_attr =  attrService.get_attr_byClas2Id(class_2_id);
		return list_attr;
	}
	@RequestMapping("get_attr_list")
	public String get_attr_list(int class_2_id,ModelMap map) {
		List<OBJECT_T_MALL_ATTR> list_attr =  attrService.get_attr_byClas2Id(class_2_id);
		map.put("list_attr", list_attr);
		return "manage_attr_list_inner_2";
	}
	
	@RequestMapping("goto_attr_list")
	public String goto_attr_list() {
		
		return "manage_attr_list";
	}
	@RequestMapping("save_attr")
	public String save_attr(int flbh2,MODEL_T_MALL_ATTR list_attr) {
		//属性添加业务
		attrService.save_attr(flbh2,list_attr.getList_attr());
		
		return "redirect:/goto_attr_add.do";
	}
	@RequestMapping("goto_attr")
	public String goto_attr() {
		
		return "manage_attr";
	}
	
	@RequestMapping("goto_attr_add")
	public String goto_attr_add() {
		
		return "manage_attr_add";
	}
}
