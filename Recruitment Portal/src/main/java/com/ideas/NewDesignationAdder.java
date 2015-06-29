package com.ideas;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class NewDesignationAdder
 */
public class NewDesignationAdder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewDesignationAdder() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoadConfigFile config=new LoadConfigFile();
	    String DBUrl=config.DBUrl();
	    String DBPasswd=config.DBPasswd();
	    String DBUser=config.DBUser();
	    String designation=request.getParameter("newdesignation");
	    System.out.println(designation);
	    try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection(DBUrl,DBUser,DBPasswd);
			PreparedStatement stat2=con.prepareStatement("INSERT INTO `test`.`designation` (`designation`) VALUES (?)");
			stat2.setString(1, designation);
			stat2.executeUpdate();
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/NewEntryForm.jsp");  
	        rd.forward(request, response); 
	    } catch (InstantiationException e) {
			
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}

}
