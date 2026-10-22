<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<h2>${donor.id > 0 ? 'Edit Donor' : 'Register Donor'}</h2>

<div class="card">
  <c:if test="${not empty error}">
    <div class="alert error"><c:out value="${error}"/></div>
  </c:if>

  <form method="post" action="${pageContext.request.contextPath}/donors">
    <input type="hidden" name="id" value="${donor.id}">
    <div class="form-grid">
      <div>
        <label>Full name *</label>
        <input type="text" name="name" value="<c:out value='${donor.name}'/>" required>
      </div>
      <div>
        <label>Age *</label>
        <input type="number" name="age" min="18" max="65" value="${donor.age > 0 ? donor.age : ''}" required>
      </div>
      <div>
        <label>Gender *</label>
        <select name="gender" required>
          <option value="">-- select --</option>
          <c:forEach var="g" items="Male,Female,Other">
            <option value="${g}" ${donor.gender == g ? 'selected' : ''}>${g}</option>
          </c:forEach>
        </select>
      </div>
      <div>
        <label>Blood group *</label>
        <select name="bloodGroup" required>
          <option value="">-- select --</option>
          <c:forEach var="bg" items="${bloodGroups}">
            <option value="${bg}" ${donor.bloodGroup == bg ? 'selected' : ''}>${bg}</option>
          </c:forEach>
        </select>
      </div>
      <div>
        <label>Phone (10 digits) *</label>
        <input type="text" name="phone" pattern="\d{10}" maxlength="10" value="<c:out value='${donor.phone}'/>" required>
      </div>
      <div>
        <label>City *</label>
        <input type="text" name="city" value="<c:out value='${donor.city}'/>" required>
      </div>
      <div>
        <label>Last donation date (optional)</label>
        <input type="date" name="lastDonationDate" value="${donor.lastDonationDate}">
      </div>
    </div>
    <br>
    <button type="submit" class="btn">Save</button>
    <a class="btn gray" href="${pageContext.request.contextPath}/donors">Cancel</a>
  </form>
</div>

<jsp:include page="footer.jsp"/>
