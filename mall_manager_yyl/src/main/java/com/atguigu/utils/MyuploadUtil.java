package com.atguigu.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MyuploadUtil {

	public static List<String> upload_imag(MultipartFile[] files) {

		List<String> list_image = new ArrayList<String>();
		// 获取路径
		String path = MyPropertyUtil.getMyProperty("upload.properties", "windows_path");

		for (int i = 0; i < files.length; i++) {
			if (!files[i].isEmpty()) {// 校验表单传来的文件是否有内容
				// String strUUID = UUID.randomUUID().toString();
				// 这就是用户上传的文件名与时间戳的组合,以防重复会覆盖
				String file_name = System.currentTimeMillis() + files[i].getOriginalFilename();

				try {// 在括号里填写文件的指向,另存
					files[i].transferTo(new File(path + "/" + file_name));

					list_image.add(file_name);// 返回用的
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		return list_image;
	}

}
