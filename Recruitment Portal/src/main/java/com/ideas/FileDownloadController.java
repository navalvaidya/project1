package com.ideas;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadController
 */
public class FileDownloadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int BYTES_DOWNLOAD = 1024;
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
		LoadConfigFile config=new LoadConfigFile();
	    String DBUrl=config.DBUrl();
	    String DBPasswd=config.DBPasswd();
	    String DBUser=config.DBUser();
		System.out.println("test1");
		try{
			System.out.println("test4");
			String id =request.getParameter("id");
			System.out.println(id);
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("test5");
		Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPasswd);
		PreparedStatement stat1=con.prepareStatement("SELECT * FROM employee WHERE id=?"); 
		stat1.setString(1, id);
		System.out.println("test6");
		ResultSet result = stat1.executeQuery();
		String resumelink=null;
		while(result.next()){
			resumelink=request.getParameter("resumelink");
			System.out.println("resumelink"+resumelink);
		}
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition",
		                     "attachment;filename=downloadname.txt");
			ServletContext ctx = getServletContext();
			InputStream is = ctx.getResourceAsStream(resumelink);
		 
			int read=0;
			byte[] bytes = new byte[BYTES_DOWNLOAD];
			ServletOutputStream os = response.getOutputStream();
		 
			while((read = is.read(bytes))!= -1){
				os.write(bytes, 0, read);
			}
			os.flush();
			os.close();
		
	}catch(Exception e){
		
	}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
