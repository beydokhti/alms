
<%@ page import="alms.BrokerLicense" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerLicense.label', default: 'BrokerLicense')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerLicense" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerLicense" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="displayOrder" title="${message(code: 'brokerLicense.displayOrder.label', default: 'Display Order')}" />
					
						<g:sortableColumn property="title1" title="${message(code: 'brokerLicense.title1.label', default: 'Title1')}" />
					
						<g:sortableColumn property="title2" title="${message(code: 'brokerLicense.title2.label', default: 'Title2')}" />
					
						<g:sortableColumn property="hasLicense" title="${message(code: 'brokerLicense.hasLicense.label', default: 'Has License')}" />
					
						<g:sortableColumn property="licenseNumber" title="${message(code: 'brokerLicense.licenseNumber.label', default: 'License Number')}" />
					
						<g:sortableColumn property="licenseDate" title="${message(code: 'brokerLicense.licenseDate.label', default: 'License Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerLicenseInstanceList}" status="i" var="brokerLicenseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerLicenseInstance.id}">${fieldValue(bean: brokerLicenseInstance, field: "displayOrder")}</g:link></td>
					
						<td>${fieldValue(bean: brokerLicenseInstance, field: "title1")}</td>
					
						<td>${fieldValue(bean: brokerLicenseInstance, field: "title2")}</td>
					
						<td><g:formatBoolean boolean="${brokerLicenseInstance.hasLicense}" /></td>
					
						<td>${fieldValue(bean: brokerLicenseInstance, field: "licenseNumber")}</td>
					
						<td><g:formatDate date="${brokerLicenseInstance.licenseDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerLicenseInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
