<%@page import="model.Bean.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/layout.css" />
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
<%Product product = (Product)request.getAttribute("product"); %>

<p>
	<button> 
		<a href="ProductManageServlet">
        	Back to product list
   		</a>	
	</button>
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