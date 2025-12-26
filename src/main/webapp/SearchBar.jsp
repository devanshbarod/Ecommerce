<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.ResultSet" %>
<%@page import="com.dto.*" %>
<%@page import="com.dbs.*" %>
<%@page import="java.util.ArrayList" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: 'Segoe UI', sans-serif;
      background: #f4f6f8;
    }

    /* Top Bar */
    .search-bar-container {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      background: #ffffff;
      padding: 15px 20px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
      z-index: 1000;
    }

    .search-input {
      width: 100%;
      max-width: 600px;
      padding: 12px 40px 12px 20px;
      font-size: 16px;
      border: 2px solid #ddd;
      border-radius: 25px;
      outline: none;
      transition: 0.3s ease;
    }

    .search-input:focus {
      border-color: #007BFF;
      box-shadow: 0 0 6px rgba(0, 123, 255, 0.2);
    }

    /* Suggestions box */
    .suggestions-box {
      position: absolute;
      top: 60px;
      left: 20px;
      width: 100%;
      max-width: 600px;
      background: white;
      border: 1px solid #ddd;
      border-top: none;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      max-height: 200px;
      overflow-y: auto;
      z-index: 1000;
      padding: 1%;
    }

    .suggestion-item {
      padding: 12px 20px;
      cursor: pointer;
    }

    .suggestion-item:hover {
      background-color: #f0f0f0;
    }

    /* Body padding to avoid overlap */
    .page-content {
      padding-top: 100px;
      text-align: center;
    }
    
    .suggestions-box a{
    	text-decoration: none;
    	color: black;
    }

    @media (max-width: 600px) {
      .search-input {
        font-size: 14px;
      }

      .suggestions-box {
        left: 10px;
        right: 10px;
        width: auto;
      }
    }
    .con2{
  	margin-left: 20%;
  }
  		.product-info-container {
  display: flex;
  flex-direction: row;  /* Places image and text side-by-side */
  align-items: flex-start;
  gap: 20px;
  padding: 20px;
  border: 1px solid #ddd;
}

.product-image img {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
}

.product-details {
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.product-name {
  font-size: 1.5rem;
  font-weight: bold;
  color: #333;
  text-decoration: none;
  margin-bottom: 10px;
}

.product-price {
  font-size: 1.2rem;
  color: #444;
  margin-bottom: 10px;
}

.product-description {
  font-size: 1rem;
  color: #666;
}

.link-list {
  display: flex;
  flex-direction: column; /* Use row if you want them horizontal */
  width: 200px;
  margin: 0px 20px;
}

.link-list a {
  text-decoration: none;
  color: #333;
  padding: 10px;
  border: 1px solid #ccc;
  margin-bottom: 5px;
  border-radius: 5px;
  transition: background-color 0.3s ease;
}

.link-list a:hover {
  background-color: #f0f0f0;
  color: #007bff;
}
    
  </style>
</head>
<script>
function showHint(str) {
  if (str.length == 0) {
    document.getElementById("suggestions").innerHTML = "";
    return;
  } else {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("suggestions").innerHTML = this.responseText;
      }
    };
    xmlhttp.open("GET", "SearchProduct?q=" + encodeURIComponent(str), true);
    xmlhttp.send();
  }
}
</script>

  
<body>

  <!-- Search Bar -->
  <div class="search-bar-container">
    <input type="text" id="searchInput" class="search-input" placeholder="Search names..." onkeyup="showHint(this.value)">
    <div  class="suggestions-box"><a href="#" id="suggestions"></a></div><br>
  </div>

  <!-- Page Content -->
  <div class="page-content">
    <h2>Welcome to the Search Page</h2>
    <p>Start typing in the search bar to see suggestions...</p>
  </div>
	<%
		DataBaseConnection db = new DataBaseConnection();
		ArrayList showcategory = db.showAllcategory();
		session.setAttribute("showcategory", showcategory);
	%>
	
	<%
	        	ArrayList al = (ArrayList)session.getAttribute("showcategory");
	        	if(al!=null){
        		for(int i=0;i<al.size();i++){
        			Allcategoryget st = (Allcategoryget)al.get(i);
        		
        	%>
        	
    <div>
    	<nav class="link-list">
	    <a href="ShowRelatedSubCategory?cid=<%= st.getCid()%>"><%= st.getCategory_name()%></a>
	  </nav>
    	
    </div>
    
     <%
        		}
        	}
        %>
        

</body>
</html>
