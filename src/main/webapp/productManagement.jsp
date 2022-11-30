<%@page import="model.Bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/layout.css" />
<title>Insert title here</title>
<style>
	button {
	 padding: 15px 25px;
	 border: unset;
	 border-radius: 15px;
	 color: #4CAF50;
	 z-index: 1;
	 background: #e8e8e8;
	 position: relative;
     font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	 font-weight: 1000;
	 font-size: 17px;
	 -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
	 box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
	 transition: all 250ms;
	 overflow: hidden;
	}
	
	button::before {
	 content: "";
	 position: absolute;
	 top: 0;
	 left: 0;
	 height: 100%;
	 width: 0;
	 border-radius: 15px;
	 background-color: #4CAF50;
	 z-index: -1;
	 -webkit-box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
	 box-shadow: 4px 8px 19px -3px rgba(0,0,0,0.27);
	 transition: all 250ms
	}
	
	button:hover {
	 color: #e8e8e8;
	 
	}
	
	button:hover::before {
	 width: 100%;
	}
</style>
</head>
<body>
<%ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("listProducts"); %>

<p>
	<button>
	    <a href="ProductServlet">
	        Back to home page
	    </a>
    </button>
</p>

<table id = "products">
    <thead>
    <tr>
        <th>Product ID</th>
        <th>Manufacture ID</th>
        <th>Product name</th>
        <th>Product type</th>
        <th>Price</th>
        <th>Amount</th>
        <th>Update</th>
        <th>Delete</th>
        <th>View</th>
    </tr>
    </thead>
    <tbody>
		<%for(Product product : products) {%>
			<tr>
				<td><%=product.getId() %></td>
				<td><%=product.getId_ncc() %></td>
				<td><%=product.getName() %></td>
				<td><%=product.getType() %></td>
				<td><%=product.getPrice() %></td>
				<td><%=product.getAmount() %></td>
				<td><a href="ProductManageServlet?mode=updateform&id=<%=product.getId() %>">Update</a></td>
				<td><a href="ProductManageServlet?mode=deleteform&id=<%=product.getId() %>">Delete</a></td>
				<td><a href="ProductManageServlet?mode=view&id=<%=product.getId() %>">View</a></td>	
			</tr>
		<%} %>
			<tr>
				<td><a href="ProductManageServlet?mode=addform">Add</a></td>
			</tr>
	</tbody>
</table>
</body>
</html>