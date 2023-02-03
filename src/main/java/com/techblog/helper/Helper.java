package com.techblog.helper;

import java.io.File;

public class Helper {
	
	public static  boolean deleteFile(String path) {
		
		boolean delete = false;
		try {
			File file = new File(path);
			delete = file.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return delete;
	}
	public static boolean saveFile(InputStream is , String path) {
		boolean save = false; 
		
		return save;
	}
}

