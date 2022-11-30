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
</head>
<body>
<%ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("listProducts"); %>

<p>
    <a href="ProductServlet">
        Back to home page
    </a>
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