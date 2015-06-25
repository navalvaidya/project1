package com.ideas;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadController
 */
public class FileDownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownloadController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("................");
		try{
			String id =request.getParameter("id");
		Class.forName("com.mysql.jdbc.Driver");
	
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
		PreparedStatement stat1=con.prepareStatement("SELECT * FROM employee WHERE id=?"); 
		stat1.setString(1, id);
		ResultSet result = stat1.executeQuery();
		String resumelink=null;
		while(result.next()){
			resumelink=request.getParameter("resumelink");
		}
		String fileName = "Resume"; //The file that will be saved on your computer
		 URL link = new URL(resumelink); //The file that you want to download
		
    //Code to download
		 InputStream in = new BufferedInputStream(link.openStream());
		 ByteArrayOutputStream out = new ByteArrayOutputStream();
		 byte[] buf = new byte[1024];
		 int n = 0;
		 while (-1!=(n=in.read(buf)))
		 {
		    out.write(buf, 0, n);
		 }
		 out.close();
		 in.close();
		 byte[] DownloadResponse = out.toByteArray();

		 FileOutputStream fos = new FileOutputStream(fileName);
		 fos.write(DownloadResponse);
		 fos.close();
		 System.out.println("download successful......");
    //End download code
		 
		 System.out.println("Finished");
		 
	}catch(Exception e){
		 e.printStackTrace();
	 }
	}
}
