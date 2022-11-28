<%@page import="java.text.NumberFormat"%>
<%@page import="model.Bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%ArrayList<Product> products = (ArrayList<Product>)request.getAttribute("listProducts"); %>
<%Account account = (Account)request.getSession().getAttribute("account"); %>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet" href="style.css" />
    <script language="javascript">
        function show() {
            var x = document.getElementById("myDIV");
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
        <li><a href="#">Trang chủ</a></li>
        <%if (account!=null) {%>
        <li><a href="login.jsp"><%=account.getName() %></a></li>
        <%} else {%>
        <li><a href="login.jsp">Đăng nhập</a></li>
        <%} %>
        <li><a href="#">Giỏ hàng</a></li>
        <li><a href="#">Liên hệ</a></li>
      </ul>
    </header>
    <div class="body">
        <div class="body-nav">
            <ul>
                <li><a onclick=show() href="#">Điện thoại</a>
                <ul id="myDIV" style="display: none;">
                    <li><a href="#">Iphone</a></li>
                    <li><a href="#">Samsung</a></li>
                    <li><a href="#">Oppo</a></li>
                    <li><a href="#">Xiaomi</a></li>
                </ul></li>
                <li><a href="#">Tablet</a></li>
                <li><a href="#">Content 1</a></li>
                <li><a href="#">content 2</a></li>
            </ul>
        </div>
        <div class="body-content">
            <ul class="list-products">
            <% for(Product pd : products)
            	{ %>
                <li>
                    <div class="product">
                        <div class="product-img">
                            <img src="https://cdn.tgdd.vn/Products/Images/42/258047/TimerThumb/samsung-galaxy-z-flip4.jpg" alt="">
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><%=pd.getName() %></h3>
                            <div class="product-price">Giá: <%=NumberFormat.getCurrencyInstance().format(pd.getPrice())
                            %></div>
                            <div class="product-btn">
                                <a href="#">Mua hàng</a>
                            </div>
                        </div>
                    </div>
                </li>
                <%} %>
                </ul>
        </div>
    </div>
    <footer class="footer">
      <p>Nhom LTM</p>
  </body>
</html>