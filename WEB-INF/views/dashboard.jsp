<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<h2>Dashboard</h2>

<div class="stats">
  <div class="stat"><div class="num">${totalUnits}</div><div class="lbl">Total units in stock</div></div>
  <div class="stat"><div class="num">${totalDonors}</div><div class="lbl">Registered donors</div></div>
  <div class="stat"><div class="num">${pendingRequests}</div><div class="lbl">Pending requests</div></div>
  <div class="stat"><div class="num">${approvedRequests}</div><div class="lbl">Approved requests</div></div>
</div>

<div class="card">
  <h3 style="margin-top:0">Blood stock by group</h3>
  <div class="stock-grid">
    <c:forEach var="s" items="${stock}">
      <div class="stock ${s.units < lowLimit ? 'low' : ''}">
        <div class="grp"><c:out value="${s.bloodGroup}"/></div>
        <div class="units">${s.units} <small>units</small></div>
        <span class="tag">${s.units < lowLimit ? 'LOW' : 'OK'}</span>
      </div>
    </c:forEach>
  </div>
</div>

<jsp:include page="footer.jsp"/>
