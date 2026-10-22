<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<h2>Donors</h2>

<div class="card">
  <form method="get" action="${pageContext.request.contextPath}/donors" class="toolbar">
    <div>
      <label>Search (name / city)</label>
      <input type="text" name="keyword" value="<c:out value='${keyword}'/>">
    </div>
    <div>
      <label>Blood group</label>
      <select name="bloodGroup">
        <option value="">All</option>
        <c:forEach var="bg" items="${bloodGroups}">
          <option value="${bg}" ${selectedGroup == bg ? 'selected' : ''}>${bg}</option>
        </c:forEach>
      </select>
    </div>
    <button type="submit" class="btn">Search</button>
    <a class="btn gray" href="${pageContext.request.contextPath}/donors">Reset</a>
    <span style="flex:1"></span>
    <a class="btn green" href="${pageContext.request.contextPath}/donors?action=new">+ Add Donor</a>
  </form>

  <table>
    <thead>
      <tr><th>ID</th><th>Name</th><th>Age</th><th>Gender</th><th>Group</th><th>Phone</th><th>City</th><th>Last donation</th><th>Actions</th></tr>
    </thead>
    <tbody>
      <c:forEach var="d" items="${donors}">
        <tr>
          <td>${d.id}</td>
          <td><c:out value="${d.name}"/></td>
          <td>${d.age}</td>
          <td><c:out value="${d.gender}"/></td>
          <td><strong><c:out value="${d.bloodGroup}"/></strong></td>
          <td><c:out value="${d.phone}"/></td>
          <td><c:out value="${d.city}"/></td>
          <td>${empty d.lastDonationDate ? '-' : d.lastDonationDate}</td>
          <td>
            <a class="btn small" href="${pageContext.request.contextPath}/donors?action=edit&id=${d.id}">Edit</a>
            <a class="btn small gray" href="${pageContext.request.contextPath}/donors?action=delete&id=${d.id}"
               onclick="return confirm('Delete this donor and their donation records?');">Delete</a>
          </td>
        </tr>
      </c:forEach>
      <c:if test="${empty donors}">
        <tr><td colspan="9" class="empty">No donors found.</td></tr>
      </c:if>
    </tbody>
  </table>
</div>

<jsp:include page="footer.jsp"/>
