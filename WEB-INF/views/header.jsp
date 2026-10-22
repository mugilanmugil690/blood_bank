<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Blood Bank Management System</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="navbar">
  <span class="brand">&#129656; Blood Bank</span>
  <a href="${pageContext.request.contextPath}/dashboard" class="${activePage == 'dashboard' ? 'active' : ''}">Dashboard</a>
  <a href="${pageContext.request.contextPath}/donors" class="${activePage == 'donors' ? 'active' : ''}">Donors</a>
  <a href="${pageContext.request.contextPath}/donations" class="${activePage == 'donations' ? 'active' : ''}">Donations</a>
  <a href="${pageContext.request.contextPath}/requests" class="${activePage == 'requests' ? 'active' : ''}">Blood Requests</a>
  <span class="spacer"></span>
  <span class="user">Hi, <c:out value="${sessionScope.admin.fullName}"/></span>
  <a href="${pageContext.request.contextPath}/logout">Logout</a>
</div>
<div class="container">
<c:if test="${not empty sessionScope.msg}">
  <div class="alert ${sessionScope.msgType}"><c:out value="${sessionScope.msg}"/></div>
  <c:remove var="msg" scope="session"/>
  <c:remove var="msgType" scope="session"/>
</c:if>
