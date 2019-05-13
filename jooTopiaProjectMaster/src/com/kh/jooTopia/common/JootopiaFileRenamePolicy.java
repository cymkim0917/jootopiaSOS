package com.kh.jooTopia.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class JootopiaFileRenamePolicy implements FileRenamePolicy {
 
	@Override
	public File rename(File oldFile) {
		
		String site = "jootopia";
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMdd");
		
		String name = oldFile.getName();
		String body = null;
		String ext = null;
		int dot = name.lastIndexOf(".");
		if(dot != -1) {
			body = name.substring(0, dot);
			ext = name.substring(dot);
		}else {
			body = name;
			ext = "";
		}
		
		String fileName = site + "_" + ft.format(new Date()) + "_" + currentTime + ext;
		
		// 경로에 있는 파일을, 해당이름으로 새로 만들어준다.
		// 내가 만드려고 하는 파일 객체의 경로
		File newFile = new File(oldFile.getParent(), fileName); // oldFile.getParent() : path경로 리턴
		
		return newFile;
	}

}
