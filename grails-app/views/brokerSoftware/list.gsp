
<%@ page import="alms.BrokerSoftware" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerSoftware.label', default: 'BrokerSoftware')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerSoftware" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerSoftware" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title1" title="${message(code: 'brokerSoftware.title1.label', default: 'Title1')}" />
					
						<g:sortableColumn property="title2" title="${message(code: 'brokerSoftware.title2.label', default: 'Title2')}" />
					
						<g:sortableColumn property="companyName" title="${message(code: 'brokerSoftware.companyName.label', default: 'Company Name')}" />
					
						<g:sortableColumn property="contractType" title="${message(code: 'brokerSoftware.contractType.label', default: 'Contract Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerSoftwareInstanceList}" status="i" var="brokerSoftwareInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerSoftwareInstance.id}">${fieldValue(bean: brokerSoftwareInstance, field: "title1")}</g:link></td>
					
						<td>${fieldValue(bean: brokerSoftwareInstance, field: "title2")}</td>
					
						<td>${fieldValue(bean: brokerSoftwareInstance, field: "companyName")}</td>
					
						<td>${fieldValue(bean: brokerSoftwareInstance, field: "contractType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerSoftwareInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
