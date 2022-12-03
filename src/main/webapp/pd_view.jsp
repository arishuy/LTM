<%@page import="model.Bean.Manufacture"%>
<%@page import="model.Bean.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="model.Bean.Account"%>
    <%Account account = (Account)request.getSession().getAttribute("account");
    if(account==null) response.sendRedirect("ProductServlet");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin sản phẩm</title>
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
        .table-data input {
            width: fix-content;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 20px;
        }
        .table-data input:hover {
            border: 1px solid #000;
            background-color: black;
            color: white;
        }
    </style>
</head>
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
<%Product product = (Product)request.getAttribute("product"); 
Manufacture manufacture = (Manufacture)request.getAttribute("manufacture"); %>
<p>
    
</p>
<div class="body-content">
        <h1>Thông tin sản phẩm</h1>
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
                <table border="0">
                    <tr>
                        <td>
                            Nhà cung cấp:
                        </td>
                        <td>
                            <%=manufacture.getName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tên sản phẩm:
                        </td>
                        <td>
                            <%=product.getName() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Loại:
                        </td>
                        <td>
                            <%=product.getType() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Giá:
                        </td>
                        <td>
                           <%=NumberFormat.getCurrencyInstance().format(product.getPrice()) %>
                        </td>
                    </tr>
                     <tr>
                        <td>
                            Số lượng:
                        </td>
                        <td>
                            <%=product.getAmount() %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <a href="ProductManageServlet">
                        <input type="button" value="Quay trở lại danh sách" />
                        </a>
                        </td>
                        <td>
                        <a href="ProductManageServlet?mode=updateform&id=<%=product.getId() %>">
                            <input type="button" value="Cập nhật sản phẩm" />
                           </a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
      </div>
      </div>
</body>
</html>