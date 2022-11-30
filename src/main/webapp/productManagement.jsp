<%@page import="model.Bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("listProducts"); %>
<table>
<%for(Product product : products) {%>
	<tr><td><%=product.getName() %></td><td><a href="UpdateProductServlet?id=<%=product.getId() %>">Update</a></td></tr>
<%} %>
	<tr><td><a href="AddProductServlet">Add</a></td></tr>
</table>
</body>
</html>