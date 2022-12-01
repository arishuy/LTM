<%@page import="model.Bean.Manufacture"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="model.Bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%Account account = (Account)request.getSession().getAttribute("account");
if(account==null) response.sendRedirect("ProductServlet");%>
<% ArrayList<Manufacture> manufactures = (ArrayList<Manufacture>)request.getAttribute("listManufactures"); %>

<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm</title>
<link rel="stylesheet" href="style.css" />
    <style>
    	.delete-product {
    		border-style: groove;
            position: fixed;
   			top: 40%;
    		left: 40%;
    		background-color: gray;
    		padding: 10px;
    		border-radius: 10px;
        }
        .delete-product form {
            width: 300px;
            height: fit-content;
            position: absolute;
            top: -100px;
            left: -150px;
            background-color: gray;
            border-radius: 5px;
            text-align: center;
        }
        .delete-product p {
            font-size: 20px;
        }
        .delete-product button {
        	float: right;
            width: 50px;
            height: 30px;
            border-radius: 5px;
            background-color: #c8c8c8;
            color: #000;
            cursor: pointer;
            margin: 5px 5px;
            border: none;
        }
        .delete-product button:hover {
            background-color: #000;
            color: #fff;
        }
      .list-products {
        display: flex;
        flex-direction: column;
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
            var x = document.getElementById("dl");
            x.action = "ProductManageServlet?mode=delete&id=" + id;
            if (x.style.display === "none") {
            x.style.display = "block";
            } else {
            x.style.display = "none";
            }
        }
        function hide() {
            var x = document.getElementById("dl");
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
              	<li><a href="#">Quản lý sản phẩm</a></li>
                <li><a href="#">Quản lý nhà cung cấp</a></li>
                <li><a href="ProductManageServlet?mode=addform">Thêm sản phẩm</a></li>
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
                  	src = <%if(!pd.getUrl().equals("")) {%>
                            	"<%=pd.getUrl() %>"
                            <%}else{ %>
                            	"https://cdn.tgdd.vn/Products/Images/42/258047/TimerThumb/samsung-galaxy-z-flip4.jpg" 
                            <%} %>
                  alt=""
                />
              </div>
              <div class="product-info">
                <h3 class="product-name"><%=pd.getName() %></h3>
                <div class="product-price">Giá: <%=NumberFormat.getCurrencyInstance().format(pd.getPrice())%></div>
                <a href="ProductManageServlet?mode=view&id=<%=pd.getId() %>">Xem thông tin</a>
              </div>
              <div class="product-btn">
                <a  href="ProductManageServlet?mode=updateform&id=<%=pd.getId() %>"><button class="edit">Sửa</button></a>
                <button onclick=show("<%=pd.getId() %>") class="delete" value="">Xóa</button>
              </div>
            </div>
          </li>
                <%} %>
                </ul>
        </div>
    </div>
    <div>
        <form action="" method="post" class="delete-product" style="display: none;" id="dl">
            <p>Bạn có muốn xóa sản phẩm này?</p>
            <button type="submit" name="yes">Yes</button>
            <button type="button" onclick="hide()" name="no">No</button>
        </form>
    </div>
    <footer class="footer">
      <p>Nhom LTM</p>
      </footer>
  </body>
</html>