<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login - Blood Bank</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="login-wrap">
  <form class="login-box" method="post" action="${pageContext.request.contextPath}/login">
    <h1>&#129656; Blood Bank</h1>
    <p>Administrator login</p>
    <c:if test="${not empty error}">
      <div class="alert error"><c:out value="${error}"/></div>
    </c:if>
    <label for="username">Username</label>
    <input type="text" id="username" name="username" required autofocus>
    <br><br>
    <label for="password">Password</label>
    <input type="password" id="password" name="password" required>
    <button type="submit" class="btn">Login</button>
  </form>
</div>
</body>
</html>
