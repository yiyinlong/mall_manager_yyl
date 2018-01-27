package com.atguigu.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.bean.T_MALL_PRODUCT;
import com.atguigu.service.SpuService;
import com.atguigu.utils.MyuploadUtil;

@Controller
public class SpuController {
	@Autowired
	SpuService spuService;
	@RequestMapping("goto_spu")
	public String goto_spu() {

		return "manage_spu";
	}	
	
	@RequestMapping("goto_spu_add")
	public String goto_spu_add() {

		return "manage_spu_add";
	}	
	
/*	@RequestMapping("save_spu")//MultipartFile接收上传的文件图片,并不能直接转化表单上传过来的file,
	//需要提醒mvc将表单中的哪一个对象封装给数组,@RequestParam("files")告诉mvc将表单的fiels封装到数组files中
	public String save_spu(T_MALL_PRODUCT spu,@RequestParam("files") MultipartFile[] files) {
		
		//product  传过来的参数和MultipartFile 的文件需要入库的
		//1 上传图片,返回图片名.需要有个上传工具
		List<String> list_img  = MyuploadUtil.upload_imag(files);
		//2 保存spu信息 业务,保存spu,生成主键,批量保存图片信息(这里上传过来的是个文件的数组),需要和业务层交互
		spuService.save_spu(spu, list_img);
		
		return "redirect:/index.do";
	}	
*/	
	@RequestMapping("save_spu")//MultipartFile接收上传的文件图片,并不能直接转化表单上传过来的file,
			//需要提醒mvc将表单中的哪一个对象封装给数组,@RequestParam("files")告诉mvc将表单的fiels封装到数组files中
	public ModelAndView save_spu(T_MALL_PRODUCT spu,@RequestParam("files") MultipartFile[] files) {

		//product  传过来的参数和MultipartFile 的文件需要入库的
		//1 上传图片,返回图片名.需要有个上传工具
		List<String> list_img  = MyuploadUtil.upload_imag(files);
		//2 保存spu信息 业务,保存spu,生成主键,批量保存图片信息(这里上传过来的是个文件的数组),需要和业务层交互
		spuService.save_spu(spu, list_img);
		
		ModelAndView mv = new ModelAndView("redirect:/index.do");
		mv.addObject("url","goto_spu_add.do");
		mv.addObject("title", "商品添加信息");
		return mv;
	}	
}
