<%@page import="model.Bean.Manufacture"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bean.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%ArrayList<Manufacture> listManufactures = (ArrayList<Manufacture>)request.getAttribute("listManufactures");
Product product = (Product)request.getAttribute("product"); %>
<form action="ProductManageServlet?mode=update&id=<%=product.getId() %>" method="post">
	Name: <input type="text" name="name" value="<%=product.getName()%>">
	NCC: <select name="id_ncc">
			<%for(Manufacture manufacture : listManufactures) {%>
				<option value=<%=manufacture.getId() %> <%if(manufacture.getId()==product.getId_ncc()){ %>selected<%} %>><%=manufacture.getName() %></option>
			<% } %>
		</select> 
	Type: <select name="type">
			<option value="phone" <%if(product.getType().equals("phone")){ %>selected<%} %>>Phone</option>
			<option value="tablet" <%if(product.getType().equals("tablet")){ %>selected<%} %>>Tablet</option>
		</select>
	Price: <input type="text" name="price" value="<%=product.getPrice()%>">
	Amount: <input type="text" name="amount" value="<%=product.getAmount()%>">
	<input type="submit" value="Update">
	<input type="reset" value="Reset">
</form>
</body>
</html>