package com.ideas;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.commons.fileupload.FileItemStream;

public class fileupload {
	
	static String rqPath;
	public static boolean processFile(String path, FileItemStream item ,int Uniqueid){
		try{
			
			File f=new File("/Recruitment Portal/FileUploads/Resume"); 
		
			File savedFile = new File(f.getPath()+File.separator+Uniqueid+item.getName());
			rqPath=f.getPath()+File.separator+Uniqueid+item.getName();
			
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x=0;
			byte[] b= new byte[1024];
			while((x=is.read(b))!=-1){
				fos.write(b, 0, x);
			}
			fos.flush();
			fos.close();
			return true;
			
		}
		catch(Exception e)
		{
			rqPath=null;
		}
		return false;
	}
}
