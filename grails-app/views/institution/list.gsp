
<%@ page import="alms.Institution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'institution.label', default: 'Institution')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-institution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-institution" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'institution.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="nationalCode" title="${message(code: 'institution.nationalCode.label', default: 'National Code')}" />
					
						<g:sortableColumn property="registerNumber" title="${message(code: 'institution.registerNumber.label', default: 'Register Number')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'institution.address.label', default: 'Address')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'institution.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="fax" title="${message(code: 'institution.fax.label', default: 'Fax')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${institutionInstanceList}" status="i" var="institutionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${institutionInstance.id}">${fieldValue(bean: institutionInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: institutionInstance, field: "nationalCode")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "registerNumber")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "address")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: institutionInstance, field: "fax")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${institutionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
