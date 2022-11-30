<%@page import="model.Bean.Manufacture"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 ArrayList<Manufacture> manufactures = (ArrayList<Manufacture>)request.getAttribute("listManufactures"); %>
<%Account account = (Account)request.getSession().getAttribute("account"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet" href="style.css" />
    <style>
      .list-products {
        display: flex;
        flex-direction: column;
        flex-wrap: wrap;
      }
      .product-inform {
        display: flex;
        position: relative;
        width: 100%;
        padding: 10px;
        background-color: #fff;
      }
      .product-img {
        width: 15%;
        text-align: center;
        padding-top: 10px;
      }
      .product-inform img {
        width: 100px;
        height: 100px;
        margin-right: 10px;
      }
      .product-info {
        width: 50%;
        padding: 0;
      }
      .product-btn {
        width: 15%;
        position: absolute;
        top: 20%;
        right: 0;
      }
    .product-btn button {
            width: 50%;
            height: 30px;
            border: none;
            border-radius: 5px;
            background-color: gray;
            color: #000;
            cursor: pointer;
            margin: 5px 5px;
        }
        .product-btn button:hover {
            background-color: #000;
            color: #fff;
        }
    </style>
    <script language="javascript">
        function show(id) {
            var x = document.getElementById(id);
            if (x.style.display === "none") {
            x.style.display = "block";
            } else {
            x.style.display = "none";
            }
        }
    </script>
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
    <div class="body">
        <div class="body-nav">
            <ul>
                <%if (account!=null) {
                	if (account.getRole().equals("admin")) {%>
              	<li><a href="#">Quản lý thiết bị</a></li>
                <li><a href="#">Quản lý nhà cung cấp</a></li>
                <%} 
                else {}} %>
            </ul>
        </div>
        <div class="body-content">
            <ul class="list-products">
            <% ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("listProducts"); 
            for(Product pd : products)
            	{ %>
                <li>
            <div class="product-inform">
              <div class="product-img">
                <img
                  src="https://cdn.tgdd.vn/Products/Images/42/258047/TimerThumb/samsung-galaxy-z-flip4.jpg"
                  alt=""
                />
              </div>
              <div class="product-info">
                <h3 class="product-name"><%=pd.getName() %></h3>
                <div class="product-price">Giá: <%=NumberFormat.getCurrencyInstance().format(pd.getPrice())%></div>
              </div>
              <div class="product-btn">
                <a  href="ManagerServlet?action=update&id=<%=pd.getId() %>"><button class="edit">Sửa</button></a>
                <button class="delete" value="">Xóa</button>
              </div>
            </div>
          </li>
                <%} %>
                </ul>
        </div>
    </div>
    <footer class="footer">
      <p>Nhom LTM</p>
      </footer>
  </body>
</html>