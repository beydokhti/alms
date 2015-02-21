
<%@ page import="alms.ObtainedCertificate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-obtainedCertificate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-obtainedCertificate" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="obtainedCertificate.certificate.label" default="Certificate" /></th>
					
						<g:sortableColumn property="obtainedDate" title="${message(code: 'obtainedCertificate.obtainedDate.label', default: 'Obtained Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${obtainedCertificateInstanceList}" status="i" var="obtainedCertificateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${obtainedCertificateInstance.id}">${fieldValue(bean: obtainedCertificateInstance, field: "certificate")}</g:link></td>
					
						<td><g:formatDate date="${obtainedCertificateInstance.obtainedDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${obtainedCertificateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
