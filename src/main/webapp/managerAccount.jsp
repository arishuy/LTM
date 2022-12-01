<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="model.Bean.Account"%>
    <%Account account = (Account)request.getSession().getAttribute("account"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" />
    <style>
    	.delete-user {
    		border-style: groove;
            position: fixed;
   			top: 40%;
    		left: 40%;
    		background-color: gray;
    		padding: 10px;
    		border-radius: 10px;
        }
        .delete-user form {
            width: 300px;
            height: fit-content;
            position: absolute;
            top: -100px;
            left: -150px;
            background-color: gray;
            border-radius: 5px;
            text-align: center;
        }
        .delete-user p {
            font-size: 20px;
        }
        .delete-user button {
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
        .delete-user button:hover {
            background-color: #000;
            color: #fff;
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            text-align: left;
            padding: 8px;
        }
        thead{
            background-color: #4CAF50;
            color: white;
        }
        .tb-sua1 button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
    </style>
<script language="javascript">
        function show(id) {
            var x = document.getElementById("dl");
            x.action = "AccountServlet?mode=delete&id=" + id;
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
    <table class="tb-1" border="1">
    <thead>
	<td>ID</td>
	<td>Username</td>
	<td>Họ và tên</td>
	<td>Email</td>
	<td>Số điện thoại</td>
	<td>Vai trò</td>
	<td>Cập nhật</td>
	<td>Xóa</td>
    </thead>
    <tbody>
    <% ArrayList<Account> Accounts = (ArrayList<Account>)request.getAttribute("listAccounts"); 
    for(Account a : Accounts){ %>
    <tr>
    <td><%=a.getId() %></td>
    <td><%=a.getUsername() %></td>
    <td><%=a.getName() %></td>
    <td><%=a.getEmail() %></td>
    <td><%=a.getPhone() %></td>
    <% if (a.getRole().equals("admin")){ %>
    	<td>Admin</td>
    	<%} else {%>
    	<td>User</td>
    	<%}%>
    	<td><a href="#"><button>Cập nhật</button></a></td>
    	<td><a><button onclick=show("<%=a.getId() %>")>Xóa</button></a></td>
    </tr>
    <%}%>
    </tbody>
    </table>
    </div>
    <div>
        <form action="" method="post" class="delete-user" style="display: none;" id="dl">
            <p>Bạn có muốn xóa tài khoản này?</p>
            <button type="submit" name="yes">Yes</button>
            <button type="button" onclick="hide()" name="no">No</button>
        </form>
    </div>
</body>
</html>