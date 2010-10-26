<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://teamfn" prefix="teamfn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="teams"%>
<teams:genericpage>
<!-- = TeamContainer -->
<div class="section" id="TeamContainer">
	<!-- = Header -->
	<div id="Header">
		<span class="back"><a href="home.shtml?teams=my"><spring:message code='jsp.detailteam.Back' /></a></span>
		<h1><c:out value="${team.name}" /></h1>
		<ul class="team-options">
			<li><a id="LeaveTeam" href="doleaveteam.shtml?team=${team.id}"><spring:message code='jsp.detailteam.Leave' /></a></li>
		</ul>
	<!-- / Header -->
	</div>
	<!-- = Content -->
	<div id="Content">
		<p>
			<c:set var="noDescription"><spring:message code='jsp.general.NoDescription' /></c:set>
			<c:out value="${team.description}" default="${noDescription}"/>
		</p>
		<span class="add-member"><a href="addmember.shtml?team=${team.id}"><spring:message code='jsp.addmember.Title' /></a></span>
		<form>
			<input type="hidden" name="teamId" value="${team.id}" />
			<table>
				<thead class="teams-table">
					<td><spring:message code='jsp.detailteam.Name' /></td>
					<td><spring:message code='jsp.detailteam.Admin' /></td>
					<td><spring:message code='jsp.detailteam.Manager' /></td>
					<td><spring:message code='jsp.detailteam.Member' /></td>
				</thead>
				<tbody>
				<c:if test="${fn:length(team.members) > 0 }">
					<c:forEach items="${team.members}" var="member">
						<tr>
							<td><c:out value="${member.name}" /></td>
							<td><input id="0_${member.id}" type="checkbox" name="adminRole" value="1" <c:if test="${teamfn:contains(member.roles, admin)}" > checked</c:if><c:if test="${member.id eq sessionScope.person}" > disabled</c:if> /></td>
							<td><input id="1_${member.id}" type="checkbox" name="managerRole" value="1" <c:if test="${teamfn:contains(member.roles, manager)}" > checked</c:if><c:if test="${member.id eq sessionScope.person}" > disabled</c:if> /></td>
							<td>
								<c:choose>
									<c:when test="${member.id eq sessionScope.person}">X</c:when>
									<c:otherwise><a href="dodeletemember.shtml?team=${team.id}&member=${member.id}">X</a></c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
		</form>
	<!-- / Content -->
	</div>
<!-- / TeamContainer -->
</div>
</teams:genericpage>