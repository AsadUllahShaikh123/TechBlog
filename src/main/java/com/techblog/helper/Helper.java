package com.techblog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

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
		try {
			byte [] b= new byte[is.available()];
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			
			fos.flush();
			fos.close();
			save =true ; 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return save;
	}
}

