<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<h2>Blood Donations</h2>

<div class="card">
  <h3 style="margin-top:0">Record a donation</h3>
  <form method="post" action="${pageContext.request.contextPath}/donations">
    <div class="form-grid">
      <div>
        <label>Donor *</label>
        <select name="donorId" required>
          <option value="">-- select donor --</option>
          <c:forEach var="d" items="${donors}">
            <option value="${d.id}"><c:out value="${d.name}"/> (<c:out value="${d.bloodGroup}"/>)</option>
          </c:forEach>
        </select>
      </div>
      <div>
        <label>Units (1 or 2) *</label>
        <input type="number" name="units" min="1" max="2" value="1" required>
      </div>
      <div>
        <label>Date *</label>
        <input type="date" name="donationDate" value="${today}" max="${today}" required>
      </div>
    </div>
    <br>
    <button type="submit" class="btn">Save donation</button>
  </form>
</div>

<div class="card">
  <h3 style="margin-top:0">Donation history</h3>
  <table>
    <thead><tr><th>ID</th><th>Donor</th><th>Blood group</th><th>Units</th><th>Date</th></tr></thead>
    <tbody>
      <c:forEach var="x" items="${donations}">
        <tr>
          <td>${x.id}</td>
          <td><c:out value="${x.donorName}"/></td>
          <td><strong><c:out value="${x.bloodGroup}"/></strong></td>
          <td>${x.units}</td>
          <td>${x.donationDate}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty donations}">
        <tr><td colspan="5" class="empty">No donations recorded yet.</td></tr>
      </c:if>
    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp"/>
