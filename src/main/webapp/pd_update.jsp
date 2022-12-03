<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.NumberFormat"%>
    <%@page import="model.Bean.Product"%>
    <%@page import="model.Bean.Manufacture"%>
<%@page import="java.util.ArrayList"%>
    <%@page import="model.Bean.Account"%>
    <%Account account = (Account)request.getSession().getAttribute("account");
    	if(account==null) response.sendRedirect("ProductServlet"); %>
    <%ArrayList<Manufacture> listManufactures = (ArrayList<Manufacture>)request.getAttribute("listManufactures");
Product product = (Product)request.getAttribute("product");
String error = (String)request.getAttribute("error"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật sản phẩm</title>
</head>
<link rel="stylesheet" href="style.css" />
    <style>
        .body-content {
            margin-top: 20px;
            width: 100%;
            height: calc(100vh-7vh);
        }
        .body-content h1 {
            text-align: center;
        }
        .avatar {
            text-align: center;
        }
        .avatar img {
            width: 200px;
            height: 200px;
        }
        table {
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
        }
        .table-data {
            margin: 50px 0 0 100px;
        }
        .table-data .btn,.btn1 {
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 20px;
            padding: 0 20px 0 20px;
            position: absolute;
        }
        .btn {
        left: 40%;
        }
        .btn1 {
        left: 50%;
        }
        .table-data .btn:hover, .btn1:hover {
            border: 1px solid #000;
            background-color: black;
            color: white;
        }
        
        .1 {
        	left: 40% !important;
        }
    </style>
<body>
 <header class="header">
        <h1 class="logo"><a href="#">ITPhone</a></h1>
        <ul class="main-nav">
          <li><a href="ProductServlet">Trang chủ</a></li>
          <%if (account!=null) {%>
        <li><a href="info.jsp"><%=account.getName() %></a></li>
        <%} else {%>
        <li><a href="login.jsp">Đăng nhập</a></li>
        <%} %>
          <li><a href="#">Giỏ hàng</a></li>
          <%if (account!=null) {%>
        	<li><a href="LogoutServlet">Đăng xuất</a></li>
        	<%} else {%>
       	 <li><a href="#">Liên hệ</a></li>
        	<%} %>
        </ul>
      </header>
      <div class="body-content">
        <h1>Cập nhật sản phẩm</h1>
        <div class="account-content">
          <div class="account-info">
            <div class="avatar">
                <img src=<%if(!product.getUrl().equals("")) {%>
                            	"<%=product.getUrl() %>"
                            <%}else{ %>
                            	"https://cdn.tgdd.vn/Products/Images/42/258047/TimerThumb/samsung-galaxy-z-flip4.jpg" 
                            <%} %> alt="avatar">
            </div>
            <div class="table-data">
            <form action="ProductManageServlet?mode=update&id=<%=product.getId() %>" method="post">
                <table border="0">
                    <tr>
                        <td>
                            Tên sản phẩm:
                        </td>
                        <td>
                            <input type="text" name="name" value="<%=product.getName() %>" />
                        </td>
                    </tr>
                    <tr>
                    <td>
                    	Nhà cung cấp:
                    </td>
                    <td> <select name="id_ncc">
			<%for(Manufacture manufacture : listManufactures) {%>
				<option value=<%=manufacture.getId() %> <%if(manufacture.getId()==product.getId_ncc()){ %>selected<%} %>><%=manufacture.getName() %></option>
			<% } %>
			</select>
			</td>
                    </tr>
                    <tr>
                    <td>
                    Type:
                    </td>
                    <td>
                    <select name="type">
			<option value="phone" <%if(product.getType().equals("phone")){ %>selected<%} %>>Phone</option>
			<option value="tablet" <%if(product.getType().equals("tablet")){ %>selected<%} %>>Tablet</option>
		</select>
                    </td>
                    </tr>
                    <tr>
                        <td>
                            Giá: 
                        </td>
                        <td>
                        	<%String price = NumberFormat.getCurrencyInstance().format(product.getPrice());%>
                            <input type="text" name="price" value="<%=price.substring(0, price.length()-2) %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Số lượng:
                        </td>
                        <td>
                            <input type="number" name="amount" value="<%=product.getAmount() %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            URL:
                        </td>
                        <td>
                            <input type="text" name="url" value="<%=product.getUrl() %>" />
                        </td>
                    </tr>
                    <%if(error!=null){ %>
                    <tr><td><%=error %></td></tr>
                    <%} %>
                </table>
                  <input class="btn" type="submit" value="Lưu" />
                  <input class="btn1" type="reset" value="Reset"/>
                </form>
            </div>
        </div>
      </div>
	</div>
</body>
</html>