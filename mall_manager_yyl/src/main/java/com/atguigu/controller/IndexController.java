package com.atguigu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("index")//这里不用string这样传值,可拓展性差,可以传json
	public String index(String url,String title,ModelMap map) {

		map.put("url",url);
		map.put("title",title);
		
		return "manage_index";
	}
	
}
