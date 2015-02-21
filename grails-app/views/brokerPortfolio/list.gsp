
<%@ page import="alms.BrokerPortfolio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerPortfolio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerPortfolio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="countOfContract" title="${message(code: 'brokerPortfolio.countOfContract.label', default: 'Count Of Contract')}" />
					
						<g:sortableColumn property="sumOfContract" title="${message(code: 'brokerPortfolio.sumOfContract.label', default: 'Sum Of Contract')}" />
					
						<g:sortableColumn property="countOfConsultantContract" title="${message(code: 'brokerPortfolio.countOfConsultantContract.label', default: 'Count Of Consultant Contract')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerPortfolioInstanceList}" status="i" var="brokerPortfolioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerPortfolioInstance.id}">${fieldValue(bean: brokerPortfolioInstance, field: "countOfContract")}</g:link></td>
					
						<td>${fieldValue(bean: brokerPortfolioInstance, field: "sumOfContract")}</td>
					
						<td>${fieldValue(bean: brokerPortfolioInstance, field: "countOfConsultantContract")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerPortfolioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
