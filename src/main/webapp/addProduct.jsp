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
<%ArrayList<Manufacture> listManufactures = (ArrayList<Manufacture>)request.getAttribute("listManufactures"); %>
<form action="ProductManageServlet?mode=add" method="post">
	Name: <input type="text" name="name" value="">
	NCC: <select name="id_ncc">
			<%for(Manufacture manufacture : listManufactures) {%>
			<option value=<%=manufacture.getId() %>><%=manufacture.getName() %></option>
			<%} %>
		</select> 
	Type: <select name="type">
			<option value="phone">Phone</option>
			<option value="tablet">Tablet</option>
		</select>
	Price: <input type="text" name="price" value="">
	Amount: <input type="text" name="amount" value="">
	<input type="submit" value="Add">
	<input type="reset" value="Reset">
</form>
</body>
</html>