package com.dto;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchProduct
 */
@WebServlet("/SearchProduct")
public class SearchProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchProduct() {
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
		PrintWriter out = response.getWriter();

        String query = request.getParameter("q");

        if (query == null || query.trim().isEmpty()) {
            out.print(""); // No input, no suggestions
            return;
        }

        List<String> suggestions = getSuggestionsFromDB(query);

        if (suggestions.isEmpty()) {
            out.print("No suggestions");
        } else {
        	out.println("<ul style='list-style: none; margin: 0; padding: 0;'>");
        	for (int i = 0; i < suggestions.size(); i++) {
        	    String name = suggestions.get(i);
        	    out.println("<li class='suggestion-item' onclick=\"selectSuggestion('" + escapeJS(name) + "')\">" 
        	                + escapeHTML(name) + "</li>");
        	}
        	 out.println("</ul>");
        }
    }

    private List<String> getSuggestionsFromDB(String query) {
        List<String> results = new ArrayList<>();

        try {
            
            PreparedStatement stmt = con.prepareStatement("SELECT product_name FROM product WHERE product_name LIKE ?");
            stmt.setString(1, query + "%");

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                results.add(rs.getString("product_name"));
            }

            

        } catch (Exception e) {
            e.printStackTrace(); // Log error
        }

        return results;
    }
    private String escapeHTML(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
                .replace("\"", "&quot;").replace("'", "&#x27;");
    }

    // Escape for JavaScript usage inside onclick
    private String escapeJS(String s) {
        if (s == null) return "";
        return s.replace("'", "\\'").replace("\"", "\\\"");
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
