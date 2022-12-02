<%@page import="model.Bean.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký</title>
    <style type="text/css">
      /* config.css */

      :root {
        --baseColor: #606468;
      }

      /* helpers/align.css */

      .align {
        display: grid;
        place-items: center;
      }

      .grid {
        inline-size: 90%;
        margin-inline: auto;
        max-inline-size: 20rem;
      }

      /* helpers/hidden.css */

      .hidden {
        border: 0;
        clip: rect(0 0 0 0);
        height: 1px;
        margin: -1px;
        overflow: hidden;
        padding: 0;
        position: absolute;
        width: 1px;
      }

      /* helpers/icon.css */

      :root {
        --iconFill: var(--baseColor);
      }

      .icons {
        display: none;
      }

      .icon {
        block-size: 1em;
        display: inline-block;
        fill: var(--iconFill);
        inline-size: 1em;
        vertical-align: middle;
      }

      /* layout/base.css */

      :root {
        --htmlFontSize: 100%;

        --bodyBackgroundColor: #2c3338;
        --bodyColor: var(--baseColor);
        --bodyFontFamily: "Open Sans";
        --bodyFontFamilyFallback: sans-serif;
        --bodyFontSize: 0.875rem;
        --bodyFontWeight: 400;
        --bodyLineHeight: 1.5;
      }

      * {
        box-sizing: inherit;
      }

      html {
        box-sizing: border-box;
        font-size: var(--htmlFontSize);
      }

      body {
        background-color: var(--bodyBackgroundColor);
        color: var(--bodyColor);
        font-family: var(--bodyFontFamily), var(--bodyFontFamilyFallback);
        font-size: var(--bodyFontSize);
        font-weight: var(--bodyFontWeight);
        line-height: var(--bodyLineHeight);
        margin: 0;
        min-block-size: 100vh;
      }

      /* modules/anchor.css */

      :root {
        --anchorColor: #eee;
      }

      a {
        color: var(--anchorColor);
        outline: 0;
        text-decoration: none;
      }

      a:focus,
      a:hover {
        text-decoration: underline;
      }

      /* modules/form.css */

      :root {
        --formGap: 0.875rem;
      }

      input {
        background-image: none;
        border: 0;
        color: inherit;
        font: inherit;
        margin: 0;
        outline: 0;
        padding: 0;
        transition: background-color 0.3s;
      }

      input[type="submit"] {
        cursor: pointer;
      }

      .form {
        display: grid;
        gap: var(--formGap);
      }

      .form input[type="password"],
      .form input[type="text"],
      .form input[type="submit"] {
        inline-size: 100%;
      }

      .form__field {
        display: flex;
      }

      .form__input {
        flex: 1;
      }

      /* modules/login.css */

      :root {
        --loginBorderRadus: 0.25rem;
        --loginColor: #eee;

        --loginInputBackgroundColor: #3b4148;
        --loginInputHoverBackgroundColor: #434a52;

        --loginLabelBackgroundColor: #363b41;

        --loginSubmitBackgroundColor: #ea4c88;
        --loginSubmitColor: #eee;
        --loginSubmitHoverBackgroundColor: #d44179;
      }

      .login {
        color: var(--loginColor);
      }

      .login label,
      .login input[type="text"],
      .login input[type="password"],
      .login input[type="submit"] {
        border-radius: var(--loginBorderRadus);
        padding: 1rem;
      }

      .login label {
        background-color: var(--loginLabelBackgroundColor);
        border-bottom-right-radius: 0;
        border-top-right-radius: 0;
        padding-inline: 1.25rem;
      }

      .login input[type="password"],
      .login input[type="text"] {
        background-color: var(--loginInputBackgroundColor);
        border-bottom-left-radius: 0;
        border-top-left-radius: 0;
      }

      .login input[type="password"]:focus,
      .login input[type="password"]:hover,
      .login input[type="text"]:focus,
      .login input[type="text"]:hover {
        background-color: var(--loginInputHoverBackgroundColor);
      }

      .login input[type="submit"] {
        background-color: var(--loginSubmitBackgroundColor);
        color: var(--loginSubmitColor);
        font-weight: 700;
        text-transform: uppercase;
      }

      .login input[type="submit"]:focus,
      .login input[type="submit"]:hover {
        background-color: var(--loginSubmitHoverBackgroundColor);
      }

      /* modules/text.css */

      p {
        margin-block: 1.5rem;
      }

      .text--center {
        text-align: center;
      }
    </style>
</head>
  <body class="align">
  <%Account account = (Account)request.getAttribute("account");
  String error = (String)request.getAttribute("error");
  	if (error != null){%>
  		<%=error %>
  	<%} %>
  	
    <div class="grid">	
      <form action="SignupServlet" method="POST" class="form login">
        <div class="form__field">
          <label for="login__username"
            ><svg class="icon">
              <use xlink:href="#icon-user"></use></svg>
              <span class="hidden">Username</span></label>
          <input
            autocomplete="username"
            id="login__username"
            type="text"
            name="username"
            class="form__input"
            placeholder="Tên đăng nhập"
            value = "<%if(account!=null) {%><%=account.getUsername() %><%} %>"
            required
          />
        </div>

        <div class="form__field">
          <label for="login__password">
            <svg class="icon">
              <use xlink:href="#icon-lock"></use>
            </svg>
            <span class="hidden">Password</span></label>
          <input
            id="login__password"
            type="password"
            name="password"
            class="form__input"
            placeholder="Mật khẩu"
            required
          />
        </div>
        <div class="form__field">
            <label for="login__password">
              <svg class="icon">
                <use xlink:href="#icon-lock"></use>
              </svg>
              <span class="hidden">Confirm Password</span></label>
            <input
              id="login__password"
              type="password"
              name="confirm_password"
              class="form__input"
              placeholder="Xác nhận mật khẩu"
              required
            />
          </div>

        <div class="form__field">
            <label for="login__username"
              ><svg class="icon">
                <use xlink:href="#icon-user"></use></svg>
                <span class="hidden">Username</span></label>
            <input
              autocomplete="name"
              id="login__name"
              type="text"
              name="name"
              class="form__input"
              placeholder="Tên của bạn"
              value = "<%if(account!=null) {%><%=account.getName() %><%} %>"
              required
            />
          </div>

          <div class="form__field">
            <label for="login__username"
              ><svg class="icon">
                <use xlink:href="#icon-email"></use></svg>
                <span class="hidden">Email</span></label>
            <input
              autocomplete="email"
              id="login__email"
              type="text"
              name="email"
              class="form__input"
              placeholder="Email"
              value = "<%if(account!=null) {%><%=account.getEmail() %><%} %>"
              required
            />
          </div>

          <div class="form__field">
            <label for="login__username"
              ><svg class="icon">
                <use xlink:href="#icon-phone"></use></svg>
                <span class="hidden">Phone</span></label>
            <input
              autocomplete="phone"
              id="login__phone"
              type="text"
              name="phone"
              class="form__input"
              placeholder="Số điện thoại"
              value = "<%if(account!=null) {%><%=account.getPhone() %><%} %>"
              required
            />
          </div>

        <div class="form__field">
          <input type="submit" value="Đăng ký" />
        </div>
      </form>
    </div>

    <svg xmlns="http://www.w3.org/2000/svg" class="icons">
      <symbol id="icon-arrow-right" viewBox="0 0 1792 1792">
        <path
          d="M1600 960q0 54-37 91l-651 651q-39 37-91 37-51 0-90-37l-75-75q-38-38-38-91t38-91l293-293H245q-52 0-84.5-37.5T128 1024V896q0-53 32.5-90.5T245 768h704L656 474q-38-36-38-90t38-90l75-75q38-38 90-38 53 0 91 38l651 651q37 35 37 90z"
        />
      </symbol>
      <symbol id="icon-lock" viewBox="0 0 1792 1792">
        <path
          d="M640 768h512V576q0-106-75-181t-181-75-181 75-75 181v192zm832 96v576q0 40-28 68t-68 28H416q-40 0-68-28t-28-68V864q0-40 28-68t68-28h32V576q0-184 132-316t316-132 316 132 132 316v192h32q40 0 68 28t28 68z"
        />
      </symbol>
      <symbol id="icon-user" viewBox="0 0 1792 1792">
        <path
          d="M1600 1405q0 120-73 189.5t-194 69.5H459q-121 0-194-69.5T192 1405q0-53 3.5-103.5t14-109T236 1084t43-97.5 62-81 85.5-53.5T538 832q9 0 42 21.5t74.5 48 108 48T896 971t133.5-21.5 108-48 74.5-48 42-21.5q61 0 111.5 20t85.5 53.5 62 81 43 97.5 26.5 108.5 14 109 3.5 103.5zm-320-893q0 159-112.5 271.5T896 896 624.5 783.5 512 512t112.5-271.5T896 128t271.5 112.5T1280 512z"
        />
      </symbol>
      //icon email
        <symbol id="icon-email" viewBox="0 0 1792 1792">
            <path
              d="M1664 128v1536q0 40-28 68t-68 28H160q-40 0-68-28t-28-68V128q0-40 28-68t68-28h1344q40 0 68 28t28 68zm-128 128H288v1408h1152V256zm-640 384q0-13-9.5-22.5T896 576t-22.5 9.5T864 608v192q0 13 9.5 22.5T896 832t22.5-9.5T928 800V608zm256 0q0-13-9.5-22.5T1152 576t-22.5 9.5T1120 608v192q0 13 9.5 22.5T1152 832t22.5-9.5T1184 800V608zm256 0q0-13-9.5-22.5T1408 576t-22.5 9.5T1376 608v192q0 13 9.5 22.5T1408 832t22.5-9.5T1440 800V608z"
            />
          </symbol>
        <symbol id="icon-phone" viewBox="0 0 1792 1792">
            <path
            d="M1664 128q0 26-19 45t-45 19H160q-26 0-45-19t-19-45 19-45 45-19h1408q26 0 45 19t19 45zm-128 384q0 26-19 45t-45 19H288q-26 0-45-19t-19-45 19-45 45-19h1152q26 0 45 19t19 45zm-128 384q0 26-19 45t-45 19H416q-26 0-45-19t-19-45 19-45 45-19h896q26 0 45 19t19 45zm-128 384q0 26-19 45t-45 19H544q-26 0-45-19t-19-45 19-45 45-19h640q26 0 45 19t19 45z"
            />
        </symbol>
    </svg>
  </body>
</html>