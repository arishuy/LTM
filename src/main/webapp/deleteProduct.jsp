<%@page import="model.Bean.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/layout.css" />
</head>
<body>
<%Product product = (Product)request.getAttribute("product"); %>
<p>
    <a href="ProductManageServlet">
        Back to product list
    </a>
</p>

<div id="form">
    <form action="ProductManageServlet?mode=delete&id=<%=product.getId() %>" method="post" >
        <div>
            <label>Product ID</label>
            <input type="number" value="<%=product.getId() %>" readonly/>
        </div>
        <div>
            <label>Manufacture ID</label>
            <input type="number" value="<%=product.getId_ncc() %>" readonly/>
        </div>
        <div>
            <label>Product name</label>
            <input type="text" value="<%=product.getName() %>" readonly/>
        </div>
        <div>
            <label>Product type</label>
            <input type="text" value="<%=product.getType()%>" readonly/>
        </div>
        <div>
            <label>Price</label>
            <input type="number" value="<%=product.getPrice()%>" readonly/>
        </div>
        <div>
            <label>Amount</label>
            <input type="number" value="<%=product.getAmount() %>" readonly/>
        </div>
        <input type="submit" value="Delete product"/>
    </form>
</div>
</body>
</html>