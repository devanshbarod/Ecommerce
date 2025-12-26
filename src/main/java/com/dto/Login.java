package com.dto;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dbs.DataBaseConnection;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private Connection con;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        //super();
        // TODO Auto-generated constructor stub
    	try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic?user=root&password=devansh@64");
        	System.out.println("Connection established");
        }catch(Exception e) {
        	e.printStackTrace();
        }
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
		// TODO Auto-generated method stub
		
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		int userCount = 0;
		int productCount = 0;
		int adminCount = 0;
		
		if(user != null && password != null) {
			
			String query = "SELECT * FROM login where username = '"+user+"'";
	    	try (PreparedStatement ps = con.prepareStatement(query)){
	    		try (ResultSet rs = ps.executeQuery()){
	    			if(rs.next()) {
	    				String user2 = rs.getString(1);
	    				String password2 = rs.getString(3);
	    				String role2 = rs.getString(4);
	    				String email = rs.getString(2);
	    				System.out.println(email);
	    				//System.out.print(role2);
	    				if(user.equals(user2) && password.equals(password2)) {
	    					if(role2.equals("user")) {
	    						
	    						session.setAttribute("user", user2);
	    						session.setAttribute("role", role2);
	    						session.setAttribute("email", email);
		    					response.sendRedirect("Userhome.jsp");
		    				}
	    					
	    					else if(role2.equals("admin")) {
	    						/*//all users count 
	    						try {
	    							
		    						String query2 = "SELECT COUNT('username') AS r FROM registration WHERE role = 'user'";
		    						try (PreparedStatement ps2 = con.prepareStatement(query2)){
		    				    		try (ResultSet rs2 = ps2.executeQuery()){
		    				    			if (rs2.next()) {
		    				                    userCount = rs2.getInt("r"); 
		    				                }
		    				                System.out.println("Total users: " + userCount);
		    				    		}
		    						}
		    					}
		    				  catch(Exception e) 
		    					{
		    						System.out.println("Error all user: "+e);
		    						
		    					}
	    						//all product count
	    						
	    						try {
	    							
		    						String query2 = "SELECT COUNT('product_id') AS p FROM product";
		    						try (PreparedStatement ps2 = con.prepareStatement(query2)){
		    				    		try (ResultSet rs2 = ps2.executeQuery()){
		    				    			if (rs2.next()) {
		    				                    productCount = rs2.getInt("p"); 
		    				                }
		    				                System.out.println("Total product: " + productCount);
		    				    		}
		    						}
		    					}
		    				  catch(Exception e) 
		    					{
		    						System.out.println("Error all product: "+e);
		    						
		    					}
								//all admins count

								try {
									
									String query2 = " SELECT COUNT('username') AS a FROM registration WHERE role = 'admin'";
									try (PreparedStatement ps2 = con.prepareStatement(query2)){
										try (ResultSet rs2 = ps2.executeQuery()){
											if (rs2.next()) {
								                adminCount = rs2.getInt("a"); 
								            }
								            System.out.println("Total admin: " + adminCount);
										}
									}
								}
								catch(Exception e) 
								{
									System.out.println("Error all user: "+e);
									
								}
	    						request.setAttribute("userCount", userCount);
	    						request.setAttribute("productCount", productCount);
	    						request.setAttribute("adminCount", adminCount);
	    						//login forward*/
	    						session.setAttribute("email", email);
		    					RequestDispatcher rd = getServletContext().getRequestDispatcher("/Adminhome.jsp");
		    					rd.forward(request, response);
	    					}
	    					else {
	    						
		    					RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
		    					rd.forward(request, response);
	    					}
	    					
	    				}else {
	    					response.sendError(HttpServletResponse.SC_NOT_FOUND,"User not found");
	    					System.out.println("Wrong User...");
	    				}
	    			}
	    		} catch(SQLException e) {
		    		e.printStackTrace();
		    	}
	    	} catch(SQLException e) {
	    		e.printStackTrace();
	    	}
		}
		else {
			response.sendRedirect("index.jsp");
		}	
		doGet(request, response);
	}
}