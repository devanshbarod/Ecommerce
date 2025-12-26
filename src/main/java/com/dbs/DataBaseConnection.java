package com.dbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletResponse;

import com.dto.AllFeedbackget;
import com.dto.AllOrderget;
import com.dto.Allcategoryget;
import com.dto.Allqueryget;
import com.dto.Allsubcategoryget;
import com.dto.Allusersget;
import com.dto.Cartitemget;
import com.dto.Orderget;
import com.dto.Productget;

public class DataBaseConnection {
	private Connection con;
	public DataBaseConnection() {
     
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic?user=username-here&password=your-password-here");
        	System.out.println("Connection established");
        }catch(Exception e) {
        	e.printStackTrace();
        }
	}
	
	//registration insert data
	
	public boolean registration(String user, String fname, String lname, String password, String email, long mobnumber, String gender, String dob, String address, String state, String city, int pin, String role) 
    {
		String query = "INSERT INTO registration(username,fname,lname,password,email,mobnumber,gender,dob,address,state,city,postal_code,role) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
		
			ps.setString(1, user);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, password);
			ps.setString(5, email);
			ps.setLong(6, mobnumber);
			ps.setString(7, gender);
			ps.setString(8, dob);
			ps.setString(9, address);
			ps.setString(10, state);
			ps.setString(11, city);
			ps.setInt(12, pin);
			ps.setString(13, role);
			int res=ps.executeUpdate();
			return res>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;
    }
	
	//regilogin data insert
	
	public boolean regilogin(String user,String email,String pass,String role) {
		
		String query = "INSERT INTO login(username,email,password,role) values(?,?,?,?)";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, user);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, role);
			int res=ps.executeUpdate();
			return res>0;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	//Contact information form user side
	
	public boolean contactInfo(String email, String msg)
	{
		String query = "INSERT INTO contact(email,message) values(?,?)";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
			
			ps.setString(1, email);
			ps.setString(2, msg);
			int res=ps.executeUpdate();
			return res>0;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	//Insert data into Cart by user
	
		public boolean Addtocart(int productid, String name, double price, String img, int quantity, String email, double total)
		{
			String query="INSERT INTO cart(productid,name, price,image,quantity,email,total) VALUES (?,?,?,?,?,?,?)";
			try(PreparedStatement ps=con.prepareStatement(query))
			{
				ps.setInt(1,productid);
				ps.setString(2,name);
				ps.setDouble(3,price);
				ps.setString(4,img);
				ps.setInt(5, quantity);
				ps.setString(6, email);
				ps.setDouble(7, total);
				int result=ps.executeUpdate();
				return result>0;
			}catch(Exception e)
			{
				e.printStackTrace();
			}
			return false;
		}
		
		
		//Show Cart details
		/*
		public Cartitemget showcart(String newmail) {
	    	String query = "SELECT * from cart where email = ?";
	    	try (PreparedStatement ps = con.prepareStatement(query)){
	    		ps.setString(1, newmail);
	    		try (ResultSet rs = ps.executeQuery()){
	    			if(rs.next()) {
	    				return new Cartitemget(rs.getInt("productid"),rs.getString("name"),rs.getDouble("price"),rs.getInt("quantity"),rs.getString("image"),rs.getString("email"));
	    			}
	    		}
	    	} catch(SQLException e) {
	    		e.printStackTrace();
	    	}
	    	return null;
	    }*/
		
		//Show Cart details 
		
		
		public ArrayList showcart2(String newmail)
		{
			ArrayList<Cartitemget> alist= new ArrayList<>();
			try {
				String query="SELECT * from cart where email = ?";
				PreparedStatement ps=con.prepareStatement(query);
				ps.setString(1, newmail);
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					Cartitemget st = new Cartitemget();
					st.setCartid(rs.getInt("cartid"));
					st.setProductid(rs.getInt("productid"));
					st.setName(rs.getString("name"));
					st.setPrice(rs.getDouble("price"));
					st.setImg(rs.getString("image"));
					st.setQuantity(rs.getInt("quantity"));
					st.setEmail(rs.getString("email"));
					st.setTotal(rs.getDouble("total"));
					alist.add(st);
				}	
			}catch(Exception e)
			{
				System.out.println(alist.size());
				System.out.println("Error ALL user:"+e);
				
			}
			return alist;
			
		}
		
		// Incriment / upate cart price and quantity
		
		public boolean incrimentquantity(int uqty, double incrementprice, int cartid)
		{
			String query = "UPDATE cart SET quantity=?,total=? WHERE cartid=?";
			
			try (PreparedStatement ps = con.prepareStatement(query)){
				
				ps.setInt(1, uqty);
				ps.setDouble(2, incrementprice);
				ps.setInt(3, cartid);
				int res=ps.executeUpdate();
				return res>0;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return false;
		}
		
		// Decriment / upate cart price and quantity
		
				public boolean decrimentquantity(int uqty, double incrementprice, int cartid)
				{
					String query = "UPDATE cart SET quantity=?,total=? WHERE cartid=?";
					
					try (PreparedStatement ps = con.prepareStatement(query)){
						
						ps.setInt(1, uqty);
						ps.setDouble(2, incrementprice);
						ps.setInt(3, cartid);
						int res=ps.executeUpdate();
						return res>0;
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			    	return false;
				}
	// Calculate Grand total from add to cart
				
				
				public Double grandTotal(String newmail) {
				    String query = "SELECT SUM(total) FROM cart WHERE email = ?";

				    try (PreparedStatement ps = con.prepareStatement(query)) {
				        ps.setString(1, newmail);
				        try (ResultSet rs = ps.executeQuery()) {
				            if (rs.next()) {
				                double sum = rs.getDouble(1);
				                return rs.wasNull() ? 0.0 : sum;
				            }
				        }
				    } catch (SQLException e) {
				        e.printStackTrace();
				    }
				    return 0.0;           
				}
				
	// Delete product add to cart 
				
				public boolean DeleteAddtoCart(int cartid)
				{
					String query="DELETE FROM cart WHERE cartid=?";
					try(PreparedStatement ps=con.prepareStatement(query))
					{
						ps.setInt(1,cartid);
						int result=ps.executeUpdate();
						return result>0;
					}catch(Exception e)
					{
						e.printStackTrace();
					}
					return false;
				}	
				
	//Update admin profile admin desk
	
	 public boolean updateadminprofile(String user, String fname, String lname, String password, String email, long mobnumber, String gender, String dob, String address, String state, String city, int pin, String role) 
	    {
			String query = "UPDATE registration SET fname=?,lname=?,password=?,email=?,mobnumber=?,gender=?,dob=?,address=?,state=?,city=?,postal_code=?,role=?  WHERE username=?";
			
			try (PreparedStatement ps = con.prepareStatement(query)){
			
				ps.setString(1, fname);
				ps.setString(2, lname);
				ps.setString(3, password);
				ps.setString(4, email);
				ps.setLong(5, mobnumber);
				ps.setString(6, gender);
				ps.setString(7, dob);
				ps.setString(8, address);
				ps.setString(9, state);
				ps.setString(10, city);
				ps.setInt(11, pin);
				ps.setString(12, role);
				ps.setString(13, user);
				int res=ps.executeUpdate();
				return res>0;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return false;
	    }

	 
	 //update admin profile admin desk
	 
	 
	 public boolean updateadminprofilelogin(String user,String email,String pass,String role) {
			
			String query = "UPDATE login SET email=?,password=?,role=? WHERE username=?";
			
			try (PreparedStatement ps = con.prepareStatement(query)){
				
				ps.setString(1, email);
				ps.setString(2, pass);
				ps.setString(3, role);
				ps.setString(4, user);
				int res=ps.executeUpdate();
				return res>0;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
	 }
	 
	 
 // show all users admin login

	public ArrayList showAll() {
		ArrayList<Allusersget> showusers = new ArrayList<>();
		try {
			String query = "SELECT * FROM registration";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Allusersget st = new Allusersget();
				st.setUsername(rs.getString("username"));
				st.setFname(rs.getString("fname"));
				st.setLname(rs.getString("lname"));
				st.setPassword(rs.getString("password"));
				st.setEmail(rs.getString("email"));
				st.setMobnumber(rs.getLong("mobnumber"));
				st.setGender(rs.getString("gender"));
				st.setDob(rs.getString("dob"));
				st.setAddress(rs.getString("address"));
				st.setState(rs.getString("state"));
				st.setCity(rs.getString("city"));
				st.setPostal_code(rs.getInt("postal_code"));
				showusers.add(st);
			}
		} catch(Exception e) 
		{
			System.out.println(showusers.size());
			System.out.println("Error all user: "+e);
			
		}
		return showusers;
	}
	
	//delete user from admin desk
    
    public boolean delStudent(String user){
    	try {
    		String sql = "Delete from registration where username=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, user);
    		int result = ps.executeUpdate();
    		return result>0;
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
    //delete user admin desk
    
    public boolean delStudent2(String user){
    	try {
    		String sql = "Delete from login where username=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setString(1, user);
    		int result = ps.executeUpdate();
    		return result>0;
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
    //update user admin desk
    
    public boolean updateuseradmin(String user, String fname, String lname, String password, String email, long mobnumber, String gender, String dob, String address, String state, String city, int pin, String role) 
    {
		String query = "UPDATE registration SET fname=?,lname=?,password=?,email=?,mobnumber=?,gender=?,dob=?,address=?,state=?,city=?,postal_code=?,role=?  WHERE username=?";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
		
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, password);
			ps.setString(4, email);
			ps.setLong(5, mobnumber);
			ps.setString(6, gender);
			ps.setString(7, dob);
			ps.setString(8, address);
			ps.setString(9, state);
			ps.setString(10, city);
			ps.setInt(11, pin);
			ps.setString(12, role);
			ps.setString(13, user);
			int res=ps.executeUpdate();
			return res>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;
    }
	
    
    //Adduser from admin desk
    
    
    public boolean addUser(String user, String fname, String lname, String password, String email, long mobnumber, String gender, String dob, String address, String state, String city, int pin, String role) 
    {
		String query = "INSERT INTO registration(username,fname,lname,password,email,mobnumber,gender,dob,address,state,city,postal_code,role) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
		
			ps.setString(1, user);
			ps.setString(2, fname);
			ps.setString(3, lname);
			ps.setString(4, password);
			ps.setString(5, email);
			ps.setLong(6, mobnumber);
			ps.setString(7, gender);
			ps.setString(8, dob);
			ps.setString(9, address);
			ps.setString(10, state);
			ps.setString(11, city);
			ps.setInt(12, pin);
			ps.setString(13, role);
			int res=ps.executeUpdate();
			return res>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;
    }
	
	//Add user login insert from admin desk
    
	public boolean addUserlogin(String user,String email,String pass,String role) {
		
		String query = "INSERT INTO login(username,email,password,role) values(?,?,?,?)";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, user);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, role);
			int res=ps.executeUpdate();
			return res>0;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
    
	//regilogin data insert
	
	public boolean updateuseradminlogin(String user,String email,String pass,String role) {
		
		String query = "UPDATE login SET email=?,password=?,role=? WHERE username=?";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
			
			ps.setString(1, email);
			ps.setString(2, pass);
			ps.setString(3, role);
			ps.setString(4, user);
			int res=ps.executeUpdate();
			return res>0;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	//update user proifle from user side
	
	public boolean updateuserprofile(String user, String fname, String lname, String password, String email, long mobnumber, String gender, String dob, String address, String state, String city, int pin, String role) 
    {
		String query = "UPDATE registration SET fname=?,lname=?,password=?,email=?,mobnumber=?,gender=?,dob=?,address=?,state=?,city=?,postal_code=?,role=?  WHERE username=?";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
		
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, password);
			ps.setString(4, email);
			ps.setLong(5, mobnumber);
			ps.setString(6, gender);
			ps.setString(7, dob);
			ps.setString(8, address);
			ps.setString(9, state);
			ps.setString(10, city);
			ps.setInt(11, pin);
			ps.setString(12, role);
			ps.setString(13, user);
			int res=ps.executeUpdate();
			return res>0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;
    }
    
	// update user profile from user side on login table
	
	//regilogin data insert
	
		public boolean updateuserprofilelogin(String user,String email,String pass,String role) {
			
			String query = "UPDATE login SET email=?,password=?,role=? WHERE username=?";
			
			try (PreparedStatement ps = con.prepareStatement(query)){
				
				ps.setString(1, email);
				ps.setString(2, pass);
				ps.setString(3, role);
				ps.setString(4, user);
				int res=ps.executeUpdate();
				return res>0;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		
    
	//show all category admin desk
	
	public ArrayList showAllcategory() {
		ArrayList<Allcategoryget> showcategory = new ArrayList<>();
		try {
			String query = "SELECT * FROM category";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Allcategoryget st = new Allcategoryget();
				st.setCid(rs.getInt("cid"));
				st.setCategory_name(rs.getString("category_name"));
				showcategory.add(st);
			}
		} catch(Exception e) 
		{
			System.out.println(showcategory.size());
			System.out.println("Error all user: "+e);
			
		}
		return showcategory;
	}
	
	//Add category from admin
	
	public boolean addCategory(String cname) {
			
			String query = "INSERT INTO category(category_name) values(?)";
			
			try (PreparedStatement ps = con.prepareStatement(query)){
				ps.setString(1, cname);
				int res=ps.executeUpdate();
				return res>0;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
	
	//Add sub category from admin
	
	public boolean addSubCategory(String subcname,int cid,String proimage,String cname) {
		
		String query = "INSERT INTO subcategory(subcategory_name,cid,image,categoryname) values(?,?,?,?)";
		
		try (PreparedStatement ps = con.prepareStatement(query)){
			ps.setString(1, subcname);
			ps.setInt(2, cid);
			ps.setString(3, proimage);
			ps.setString(4, cname);
			int res=ps.executeUpdate();
			return res>0;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	// Delete Category from Admin desk
	
	public boolean delcid(int cid){
    	try {
    		String sql = "Delete from category where cid=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, cid);
    		int result = ps.executeUpdate();
    		return result>0;
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
    
    //delete subcategory cid form admin desk
    
    public boolean delScid(int cid){
    	try {
    		String sql = "Delete from subcategory where cid=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, cid);
    		int result = ps.executeUpdate();
    		return result>0;
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
	
    
    //delete subcate from admin desk subid
    
    public boolean delSubcategorySubid(int subid){
    	try {
    		String sql = "Delete from subcategory where subid=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, subid);
    		int result = ps.executeUpdate();
    		return result>0;
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
	
    
    
	//show all subcategory admin desk
	
	public ArrayList showAllsubcategory() {
		ArrayList<Allsubcategoryget> showsubcategory = new ArrayList<>();
		try {
			String query = "SELECT * FROM subcategory";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Allsubcategoryget st = new Allsubcategoryget();
				st.setSubid(rs.getInt("subid"));
				st.setSubcategory_name(rs.getString("subcategory_name"));
				st.setCid(rs.getInt("cid"));
				st.setCategoryname(rs.getString("categoryname"));
				showsubcategory.add(st);
			}
		} catch(Exception e) 
		{
			System.out.println(showsubcategory.size());
			System.out.println("Error all user: "+e);
			
		}
		return showsubcategory;
	}
	
	
	//Admin profile
	
	public Allusersget searchAdmin(String email) {
    	String query = "SELECT * FROM registration where email = ?";
    	try (PreparedStatement ps = con.prepareStatement(query)){
    		ps.setString(1, email);
    		try (ResultSet rs = ps.executeQuery()){
    			if(rs.next()) {
    				return new Allusersget(rs.getString("username"),rs.getString("fname"),rs.getString("lname"),rs.getString("password"),rs.getString("email"),rs.getLong("mobnumber"),rs.getString("gender"),rs.getString("dob"),rs.getString("address"),rs.getString("state"),rs.getString("city"),rs.getInt("postal_code"),rs.getString("role"));
    			}
    		}
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return null;
    }
	
	//show users profile
	
	public Allusersget searchUser(String username) {
    	String query = "SELECT * FROM registration where username = ?";
    	try (PreparedStatement ps = con.prepareStatement(query)){
    		ps.setString(1, username);
    		try (ResultSet rs = ps.executeQuery()){
    			if(rs.next()) {
    				return new Allusersget(rs.getString("username"),rs.getString("fname"),rs.getString("lname"),rs.getString("password"),rs.getString("email"),rs.getLong("mobnumber"),rs.getString("gender"),rs.getString("dob"),rs.getString("address"),rs.getString("state"),rs.getString("city"),rs.getInt("postal_code"),rs.getString("role"));
    			}
    		}
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return null;
    }
	
	// userprofile userdesk
	
	public Allusersget searchuserprofile(String email) {
    	String query = "SELECT * FROM registration where email = ?";
    	try (PreparedStatement ps = con.prepareStatement(query)){
    		ps.setString(1, email);
    		try (ResultSet rs = ps.executeQuery()){
    			if(rs.next()) {
    				return new Allusersget(rs.getString("username"),rs.getString("fname"),rs.getString("lname"),rs.getString("password"),rs.getString("email"),rs.getLong("mobnumber"),rs.getString("gender"),rs.getString("dob"),rs.getString("address"),rs.getString("state"),rs.getString("city"),rs.getInt("postal_code"),rs.getString("role"));
    			}
    		}
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return null;
    }
	
	//Add product from admin desk
	
	public boolean addProduct(String pname,String proimage,double price,String category,String brand,String disc,int qty,double subtotal,double total) {
		
		String query = "insert into product(product_name,image,price,category,brand,description,qty,subtotal,total) values(?,?,?,?,?,?,?,?,?)";
		
		try(PreparedStatement ps = con.prepareStatement(query)){
			
			ps.setString(1, pname);
			ps.setString(2, proimage);
			ps.setDouble(3, price);
			ps.setString(4, category);
			ps.setString(5, brand);
			ps.setString(6, disc);
			ps.setInt(7, qty);
			ps.setDouble(8, subtotal);
			ps.setDouble(9, total);
			int res = ps.executeUpdate();
			return res>0;
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//Show all product from admin desk
	
	public ArrayList showAllproduct() {
		ArrayList<Productget> showproduct = new ArrayList<>();
		try {
			String query = "SELECT * FROM product";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Productget st = new Productget();
				st.setProduct_id(rs.getInt("product_id"));
				st.setProduct_name(rs.getString("product_name"));
				st.setImage(rs.getString("image"));
				st.setPrice(rs.getDouble("price"));
				st.setCategory(rs.getString("category"));
				st.setBrand(rs.getString("brand"));
				st.setDescription(rs.getString("description"));
				st.setQty(rs.getInt("qty"));
				st.setSubtotal(rs.getDouble("subtotal"));
				st.setTotal(rs.getDouble("total"));
				showproduct.add(st);
			}
		} catch(Exception e) 
		{
			System.out.println(showproduct.size());
			System.out.println("Error all product: "+e);
			
		}
		return showproduct;
	}
	
	
	//show all querys admin desk
	
		public ArrayList showAllquery() {
			ArrayList<Allqueryget> showquery = new ArrayList<>();
			try {
				String query = "SELECT * FROM contact";
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					Allqueryget st = new Allqueryget();
					st.setCid(rs.getInt("cid"));
					st.setEmail(rs.getString("email"));
					st.setMessage(rs.getString("message"));
					showquery.add(st);
				}
			} catch(Exception e) 
			{
				System.out.println(showquery.size());
				System.out.println("Error all user: "+e);
				
			}
			return showquery;
		}
		
		
	//Delete Product from admin desk
	
	public boolean delProduct(int pid){
    	try {
    		String sql = "Delete from product where product_id=?";
    		PreparedStatement ps = con.prepareStatement(sql);
    		ps.setInt(1, pid);
    		int result = ps.executeUpdate();
    		return result>0;
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	return false;
    }
	
	
	//Search product from admin side
	
	public Productget searchProduct(int pid) {
    	String query = "SELECT * FROM product where product_id = ?";
    	try (PreparedStatement ps = con.prepareStatement(query)){
    		ps.setInt(1, pid);
    		try (ResultSet rs = ps.executeQuery()){
    			if(rs.next()) {
    				return new Productget(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("image"),rs.getDouble("price"),rs.getString("category"),rs.getString("brand"),rs.getString("description"),rs.getInt("qty"),rs.getDouble("subtotal"),rs.getDouble("total"));
    			}
    		}
    	} catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return null;
    }
	
	//Search product by category userhome
	
	public ArrayList showAllrelatedproduct(String cname) {
		ArrayList<Productget> showproduct = new ArrayList<>();
		try {
			String query = "SELECT * FROM product where category = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, cname);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Productget st = new Productget();
				st.setProduct_id(rs.getInt("product_id"));
				st.setProduct_name(rs.getString("product_name"));
				st.setImage(rs.getString("image"));
				st.setPrice(rs.getDouble("price"));
				st.setCategory(rs.getString("category"));
				st.setBrand(rs.getString("brand"));
				st.setDescription(rs.getString("description"));
				st.setQty(rs.getInt("qty"));
				st.setSubtotal(rs.getDouble("subtotal"));
				st.setTotal(rs.getDouble("total"));
				showproduct.add(st);
			}
		} catch(Exception e) 
		{
			System.out.println(showproduct.size());
			System.out.println("Error all product: "+e);
			
		}
		return showproduct;
	}
	
	//show related subcategory user desk
	
		public ArrayList showAllrelatedsubcategory(int cid) {
			ArrayList<Allsubcategoryget> showsubcategory = new ArrayList<>();
			try {
				String query = "SELECT * FROM subcategory where cid = ?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, cid);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					Allsubcategoryget st = new Allsubcategoryget();
					st.setSubid(rs.getInt("subid"));
					st.setSubcategory_name(rs.getString("subcategory_name"));
					st.setCid(rs.getInt("cid"));
					st.setCategoryname(rs.getString("categoryname"));
					showsubcategory.add(st);
				}
			} catch(Exception e) 
			{
				System.out.println(showsubcategory.size());
				System.out.println("Error all user: "+e);
				
			}
			return showsubcategory;
		}
		
		
	//Search product by Sub Category Userhome
	
	public ArrayList showAllrelatedsubproduct(String pname,String cname) {
		ArrayList<Productget> showproduct = new ArrayList<>();
		try {
			String query = "SELECT * FROM product where brand = ? and category = ?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, pname);
			ps.setString(2, cname);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Productget st = new Productget();
				st.setProduct_id(rs.getInt("product_id"));
				st.setProduct_name(rs.getString("product_name"));
				st.setImage(rs.getString("image"));
				st.setPrice(rs.getDouble("price"));
				st.setCategory(rs.getString("category"));
				st.setBrand(rs.getString("brand"));
				st.setDescription(rs.getString("description"));
				st.setQty(rs.getInt("qty"));
				st.setSubtotal(rs.getDouble("subtotal"));
				st.setTotal(rs.getDouble("total"));
				showproduct.add(st);
			}
		} catch(Exception e) 
		{
			System.out.println(showproduct.size());
			System.out.println("Error all product: "+e);
			
		}
		return showproduct;
	}
	
	
	//Update product from admin desk
	
		public boolean updateProduct(int pid,String pname,String proimage,double price,String subcategory,String brand,String disc,int qty,double subtotal,double total) {
			
			String query = "UPDATE product SET product_name=?,image=?,price=?,category=?,brand=?,description=?,qty=?,subtotal=?,total=? where product_id=?";
			
			try(PreparedStatement ps = con.prepareStatement(query)){
				
				ps.setString(1, pname);
				ps.setString(2, proimage);
				ps.setDouble(3, price);
				ps.setString(4, subcategory);
				ps.setString(5, brand);
				ps.setString(6, disc);
				ps.setInt(7, qty);
				ps.setDouble(8, subtotal);
				ps.setDouble(9, total);
				ps.setInt(10, pid);
				int res = ps.executeUpdate();
				return res>0;
				
			} catch(SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
		
		
		// Change password using email for login table
		
		
		public boolean changePasswordlogin(String newPassword,String email) {
			
			String query = "UPDATE login SET password=? WHERE email=?";
			
			try (PreparedStatement ps = con.prepareStatement(query)){
				
				ps.setString(1, newPassword);
				ps.setString(2, email);
				int res=ps.executeUpdate();
				return res>0;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
		
		// Change password using email for Registration table
		
		
				public boolean changePasswordRegistration(String newPassword,String email) {
					
					String query = "UPDATE registration SET password=? WHERE email=?";
					
					try (PreparedStatement ps = con.prepareStatement(query)){
						
						ps.setString(1, newPassword);
						ps.setString(2, email);
						int res=ps.executeUpdate();
						return res>0;
					}catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return false;
				}
				
				// Change password using Mobile Number for login table
				
				
				public boolean changePasswordloginbyMobile(String newPassword,String mobile) {
					
					String query = "UPDATE login SET password=? WHERE mobile=?";
					
					try (PreparedStatement ps = con.prepareStatement(query)){
						
						ps.setString(1, newPassword);
						ps.setString(2, mobile);
						int res=ps.executeUpdate();
						return res>0;
					}catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return false;
				}
				
				// Change password using Mobile Number for Registration table
				
				
						public boolean changePasswordRegistrationbyMobile(String newPassword,String mobile) {
							
							String query = "UPDATE registration SET password=? WHERE mobnumber=?";
							
							try (PreparedStatement ps = con.prepareStatement(query)){
								
								ps.setString(1, newPassword);
								ps.setString(2, mobile);
								int res=ps.executeUpdate();
								return res>0;
							}catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							return false;
						}
			
	
				// Add Feedback
				
				
				public boolean addFeedback(String name, String email, String experience, int rating, String usability, String design, String performance, String suggestions)
			    {
					String query = "INSERT INTO feedback(name,email,expirence,rating,ease_to_use,design,performance,suggession) values(?,?,?,?,?,?,?,?)";
					
					try (PreparedStatement ps = con.prepareStatement(query)){
					
						ps.setString(1, name);
						ps.setString(2, email);
						ps.setString(3, experience);
						ps.setInt(4, rating);
						ps.setString(5, usability);
						ps.setString(6, design);
						ps.setString(7, performance);
						ps.setString(8, suggestions);
			
						int res=ps.executeUpdate();
						return res>0;
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			    	return false;
			    }
				
				// show all Feedback from admin side

				public ArrayList showAllFeedback() {
					ArrayList<AllFeedbackget> showusers = new ArrayList<>();
					try {
						String query = "SELECT * FROM feedback";
						PreparedStatement ps = con.prepareStatement(query);
						ResultSet rs = ps.executeQuery();
						while(rs.next()) {
							AllFeedbackget st = new AllFeedbackget();
							st.setFid(rs.getInt("fid"));
							st.setName(rs.getString("name"));
							st.setEmail(rs.getString("email"));
							st.setExpirence(rs.getString("expirence"));
							st.setRating(rs.getInt("rating"));
							st.setEase_to_use(rs.getString("ease_to_use"));
							st.setDesign(rs.getString("design"));
							st.setPerformance(rs.getString("performance"));
							st.setSuggesion(rs.getString("suggession"));
							showusers.add(st);
						}
					} catch(Exception e) 
					{
						System.out.println(showusers.size());
						System.out.println("Error all user: "+e);
						
					}
					return showusers;
				}
				
				// Add Orders user side				
				
				public boolean AddOrders(String paymentId, double prices, String emails, int productIds, String names, String images)
			    {
					String query = "INSERT INTO orders(payment_id,price,email,product_id,product_name,image) values(?,?,?,?,?,?)";
					
					try (PreparedStatement ps = con.prepareStatement(query)){
					
						ps.setString(1, paymentId);
						ps.setDouble(2, prices);
						ps.setString(3, emails);
						ps.setInt(4, productIds);
						ps.setString(5, names);
						ps.setString(6, images);
						int res=ps.executeUpdate();
						return res>0;
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			    	return false;
			    }
				
				//show order on user side
				
				public ArrayList showOrder(String newmail)
				{
					ArrayList<Orderget> alist= new ArrayList<>();
					try {
						String query="SELECT * from orders where email = ?";
						PreparedStatement ps=con.prepareStatement(query);
						ps.setString(1, newmail);
						ResultSet rs=ps.executeQuery();
						while(rs.next())
						{
							Orderget st = new Orderget();
							st.setOrder_id(rs.getInt("order_id"));
							st.setPayment_id(rs.getString("payment_id"));
							st.setPrice(rs.getDouble("price"));
							st.setEmail(rs.getString("email"));
							st.setProduct_id(rs.getInt("product_id"));
							st.setProduct_name(rs.getString("product_name"));
							st.setCreatedDate(rs.getString("CreatedDate"));
							st.setImage(rs.getString("image"));
							alist.add(st);
						}	
					}catch(Exception e)
					{
						System.out.println(alist.size());
						System.out.println("Error ALL user:"+e);
						
					}
					return alist;
					
				}
				
				
				//Show all Orders from admin desk
				
				public ArrayList showAllorder() {
					ArrayList<AllOrderget> showorder = new ArrayList<>();
					try {
						String query = "SELECT * FROM orders";
						PreparedStatement ps = con.prepareStatement(query);
						ResultSet rs = ps.executeQuery();
						while(rs.next()) {
							AllOrderget st = new AllOrderget();
							st.setOrder_id(rs.getInt("order_id"));
							st.setPayment_id(rs.getString("payment_id"));
							st.setPrice(rs.getDouble("price"));
							st.setEmail(rs.getString("email"));
							st.setProduct_id(rs.getInt("product_id"));
							st.setProduct_name(rs.getString("product_name"));
							st.setDate(rs.getString("CreatedDate"));
							st.setImage(rs.getString("image"));
							showorder.add(st);
						}
					} catch(Exception e) 
					{
						System.out.println(showorder.size());
						System.out.println("Error all product: "+e);
						
					}
					return showorder;
				}
				
				//Send email on order confirm
				
				public ArrayList sendmailorder(String email, String productid)
				{
					ArrayList<Orderget> list= new ArrayList<>();
					try {
						String query="SELECT * from orders where email = ? amd product_id=?";
						PreparedStatement ps=con.prepareStatement(query);
						ps.setString(1, email);
						ResultSet rs=ps.executeQuery();
						while(rs.next())
						{
							Orderget st = new Orderget();
							st.setOrder_id(rs.getInt("order_id"));
							st.setProduct_id(rs.getInt("product_id"));
							st.setProduct_name(rs.getString("product_name"));
							st.setPrice(rs.getDouble("price"));
							st.setImage(rs.getString("image"));
							st.setEmail(rs.getString("email"));
							st.setCreatedDate(rs.getString("CreatedDate"));
							list.add(st);
						}	
					}catch(Exception e)
					{
						System.out.println(list.size());
						System.out.println("Error ALL user:"+e);
						
					}
					return list;
					
				}
				
				//Delete Product add to cart after payment

				public boolean DeleteOrderAddtoCart(String emails, int productIds) {
					// TODO Auto-generated method stub
					try {
			    		String sql = "Delete from cart where email=? and productid=?";
			    		PreparedStatement ps = con.prepareStatement(sql);
			    		ps.setString(1, emails);
			    		ps.setInt(2, productIds);
			    		int result = ps.executeUpdate();
			    		return result>0;
			    	} catch(Exception e) {
			    		e.printStackTrace();
			    	}
					return false;
				}
				
				
				
}
