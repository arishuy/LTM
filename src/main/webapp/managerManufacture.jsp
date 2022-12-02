<%@page import="model.Bean.Manufacture"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="model.Bean.Account"%>
    <%Account account = (Account)request.getSession().getAttribute("account"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý nhà cung cấp</title>
<link rel="stylesheet" href="style.css" />
    <style>
    	.body {
    		min-height: 0;
    		background-color: white;
    	}
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
        .tb-1 button{
            background-color: white;
            color: black;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        .btn {
            border-radius: 10px;
    	margin-left: 20px;
    	cursor: pointer;
    	background-color: gray;
    	border: none;
    	padding: 12px 20px;
        }
        .btn:hover {
        background-color: black;
        color: white;
        }
    </style>
<script language="javascript">
function showAdd() {
    var x = document.getElementById("add");
    var id = "1";
    x.action = "ManufactureServlet?mode=add&id=" + id;
    if (x.style.display === "none") {
    x.style.display = "block";
    } else {
    x.style.display = "none";
    }
}
	function showUpdate(id, name) {
    var x = document.getElementById("update");
    x.action = "ManufactureServlet?mode=update&id=" + id;
    var y = document.getElementById("update-input");
    y.value = name;
    if (x.style.display === "none") {
    x.style.display = "block";
    } else {
    x.style.display = "none";
    	}
	}
        function show(id) {
            var x = document.getElementById("dl");
            x.action = "ManufactureServlet?mode=delete&id=" + id;
            if (x.style.display === "none") {
            x.style.display = "block";
            } else {
            x.style.display = "none";
            }
        }
        function hide(id) {
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
    <table class="tb-1" border="1">
    <thead>
	<td>ID</td>
	<td>Tên</td>
	<td>Cập nhật</td>
	<td>Xóa</td>
    </thead>
    <tbody>
    <% ArrayList<Manufacture> nccs = (ArrayList<Manufacture>)request.getAttribute("listManufactures"); 
    for(Manufacture ncc : nccs){ %>
    <tr>
    <td><%=ncc.getId() %></td>
    <td><%=ncc.getName() %></td>
    <td><button onclick=showUpdate("<%=ncc.getId() %>","<%=ncc.getName() %>")>Cập nhật</button></td>
    <td><a><button onclick=show("<%=ncc.getId() %>")>Xóa</button></a></td>
    </tr>
    <%}%>
    </tbody>
    </table>
    </div>
        <input class="btn" type="button" onclick=showAdd() value="Thêm" />
    <div>
        <form action="" method="post" class="delete-user" style="display: none;" id="add">
            <p>Cập nhật nhà cung cấp</p>
            <div>
            Tên: <input id="add-input" name="name" value="" type="text"/>
            </div>
            <button type="submit" name="yes">Yes</button>
            <button type="button" onclick=hide("add") name="no">No</button>
        </form>
    </div>
    <div>
        <form action="" method="post" class="delete-user" style="display: none;" id="update">
            <p>Cập nhật nhà cung cấp</p>
            <div>
            Tên: <input id="update-input" name="name" value="" type="text"/>
            </div>
            <button type="submit" name="yes">Yes</button>
            <button type="button" onclick=hide("update") name="no">No</button>
        </form>
    </div>
    <div>
        <form action="" method="post" class="delete-user" style="display: none;" id="dl">
            <p>Bạn có muốn xóa nhà cung cấp này?</p>
            <button type="submit" name="yes">Yes</button>
            <button type="button" onclick=hide("dl") name="no">No</button>
        </form>
    </div>
</body>
</html>