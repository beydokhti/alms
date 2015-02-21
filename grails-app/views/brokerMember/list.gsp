
<%@ page import="alms.BrokerMember" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerMember.label', default: 'BrokerMember')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerMember" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerMember" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'brokerMember.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'brokerMember.lastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="sex" title="${message(code: 'brokerMember.sex.label', default: 'Sex')}" />
					
						<g:sortableColumn property="position" title="${message(code: 'brokerMember.position.label', default: 'Position')}" />
					
						<g:sortableColumn property="startDate" title="${message(code: 'brokerMember.startDate.label', default: 'Start Date')}" />
					
						<g:sortableColumn property="degree" title="${message(code: 'brokerMember.degree.label', default: 'Degree')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerMemberInstanceList}" status="i" var="brokerMemberInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerMemberInstance.id}">${fieldValue(bean: brokerMemberInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: brokerMemberInstance, field: "lastName")}</td>
					
						<td>${fieldValue(bean: brokerMemberInstance, field: "sex")}</td>
					
						<td>${fieldValue(bean: brokerMemberInstance, field: "position")}</td>
					
						<td><g:formatDate date="${brokerMemberInstance.startDate}" /></td>
					
						<td>${fieldValue(bean: brokerMemberInstance, field: "degree")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerMemberInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
