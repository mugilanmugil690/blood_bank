<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<h2>Blood Requests</h2>

<div class="card">
  <h3 style="margin-top:0">New request</h3>
  <form method="post" action="${pageContext.request.contextPath}/requests">
    <input type="hidden" name="action" value="add">
    <div class="form-grid">
      <div>
        <label>Patient name *</label>
        <input type="text" name="patientName" required>
      </div>
      <div>
        <label>Hospital *</label>
        <input type="text" name="hospital" required>
      </div>
      <div>
        <label>Blood group *</label>
        <select name="bloodGroup" required>
          <option value="">-- select --</option>
          <c:forEach var="bg" items="${bloodGroups}">
            <option value="${bg}">${bg}</option>
          </c:forEach>
        </select>
      </div>
      <div>
        <label>Units needed (1-10) *</label>
        <input type="number" name="units" min="1" max="10" value="1" required>
      </div>
      <div>
        <label>Contact (10 digits) *</label>
        <input type="text" name="contact" pattern="\d{10}" maxlength="10" required>
      </div>
    </div>
    <br>
    <button type="submit" class="btn">Submit request</button>
  </form>
</div>

<div class="card">
  <h3 style="margin-top:0">All requests</h3>
  <table>
    <thead>
      <tr><th>ID</th><th>Patient</th><th>Hospital</th><th>Group</th><th>Units</th><th>Contact</th><th>Date</th><th>Status</th><th>Action</th></tr>
    </thead>
    <tbody>
      <c:forEach var="r" items="${requests}">
        <tr>
          <td>${r.id}</td>
          <td><c:out value="${r.patientName}"/></td>
          <td><c:out value="${r.hospital}"/></td>
          <td><strong><c:out value="${r.bloodGroup}"/></strong></td>
          <td>${r.units}</td>
          <td><c:out value="${r.contact}"/></td>
          <td>${r.requestDate}</td>
          <td><span class="badge ${r.status}">${r.status}</span></td>
          <td>
            <c:if test="${r.status == 'PENDING'}">
              <form class="inline" method="post" action="${pageContext.request.contextPath}/requests">
                <input type="hidden" name="id" value="${r.id}">
                <button class="btn small green" name="action" value="approve"
                        onclick="return confirm('Approve and deduct ${r.units} unit(s) of ${r.bloodGroup}?');">Approve</button>
                <button class="btn small gray" name="action" value="reject"
                        onclick="return confirm('Reject this request?');">Reject</button>
              </form>
            </c:if>
          </td>
        </tr>
      </c:forEach>
      <c:if test="${empty requests}">
        <tr><td colspan="9" class="empty">No requests yet.</td></tr>
      </c:if>
    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp"/>
