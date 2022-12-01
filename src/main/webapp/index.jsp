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
        <li><a href="AccountServlet?mode=1"><%=account.getName() %></a></li>
        <%} else {%>
        <li><a href="login.jsp">Đăng nhập</a></li>
        <%} %>
        <li><a href="#">Giỏ hàng</a></li>
        <%if (account!=null) {%>
        <li><a href="LogoutServlet">Đăng xuất</a></li>
        <%} else {%>
        <li><a href="TestServlet">Liên hệ</a></li>
        <%} %>
      </ul>
    </header>
    <div class="body">
        <div class="body-nav">
            <ul>
                <li><a onclick=show('myDIV') href="#">Điện thoại</a>
                <ul id="myDIV" style="display: none;">
                	<li><a href="ProductServlet?type=phone">Tất cả</a></li>
                	<%for(Manufacture m : manufactures) { %>
                    <li><a href="ProductServlet?type=phone&id_ncc=<%=m.getId() %>"><%=m.getName() %></a></li>
                    <%} %>
                </ul>
                </li>
                <li><a onclick=show('myDIV1') href="#">Tablet</a>
                <ul id="myDIV1" style="display: none;">
                	<li><a href="ProductServlet?type=tablet">Tất cả</a></li>
                	<%for(Manufacture m : manufactures) { %>
                    <li><a href="ProductServlet?type=tablet&id_ncc=<%=m.getId() %>"><%=m.getName() %></a></li>
                    <%} %>
                </ul>
                </li>
                <%if (account!=null) {
                	if (account.getRole().equals("admin")) {%>
              	<li><a href="ProductManageServlet">Quản lý sản phẩm</a></li>
              	<li><a href="AccountServlet">Quản lý người dùng</a></li>
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
                    <div class="product">
                        <div class="product-img">
                            <img src=
                            <%if(!pd.getUrl().equals("")) {%>
                            	"<%=pd.getUrl() %>"
                            <%}else{ %>
                            	"https://cdn.tgdd.vn/Products/Images/42/258047/TimerThumb/samsung-galaxy-z-flip4.jpg" 
                            <%} %>
                            alt="">
                        </div>
                        <div class="product-info">
                            <h3 class="product-name"><p><%=pd.getName() %><p></h3>
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
      </footer>
  </body>
</html>