
<%@ page import="alms.BrokerShareholder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerShareholder.label', default: 'BrokerShareholder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerShareholder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerShareholder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="shareholderName" title="${message(code: 'brokerShareholder.shareholderName.label', default: 'Shareholder Name')}" />
					
						<g:sortableColumn property="ownershipType" title="${message(code: 'brokerShareholder.ownershipType.label', default: 'Ownership Type')}" />
					
						<g:sortableColumn property="ownershipPercent" title="${message(code: 'brokerShareholder.ownershipPercent.label', default: 'Ownership Percent')}" />
					
						<g:sortableColumn property="sharesCount" title="${message(code: 'brokerShareholder.sharesCount.label', default: 'Shares Count')}" />
					
						<g:sortableColumn property="representativeOnBoard" title="${message(code: 'brokerShareholder.representativeOnBoard.label', default: 'Representative On Board')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'brokerShareholder.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerShareholderInstanceList}" status="i" var="brokerShareholderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerShareholderInstance.id}">${fieldValue(bean: brokerShareholderInstance, field: "shareholderName")}</g:link></td>
					
						<td>${fieldValue(bean: brokerShareholderInstance, field: "ownershipType")}</td>
					
						<td>${fieldValue(bean: brokerShareholderInstance, field: "ownershipPercent")}</td>
					
						<td>${fieldValue(bean: brokerShareholderInstance, field: "sharesCount")}</td>
					
						<td>${fieldValue(bean: brokerShareholderInstance, field: "representativeOnBoard")}</td>
					
						<td>${fieldValue(bean: brokerShareholderInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerShareholderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
