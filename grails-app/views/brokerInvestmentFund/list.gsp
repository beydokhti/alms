
<%@ page import="alms.BrokerInvestmentFund" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerInvestmentFund" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerInvestmentFund" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fundName" title="${message(code: 'brokerInvestmentFund.fundName.label', default: 'Fund Name')}" />
					
						<g:sortableColumn property="startingDate" title="${message(code: 'brokerInvestmentFund.startingDate.label', default: 'Starting Date')}" />
					
						<g:sortableColumn property="typeAndScale" title="${message(code: 'brokerInvestmentFund.typeAndScale.label', default: 'Type And Scale')}" />
					
						<g:sortableColumn property="fundManager" title="${message(code: 'brokerInvestmentFund.fundManager.label', default: 'Fund Manager')}" />
					
						<g:sortableColumn property="fundCustodian" title="${message(code: 'brokerInvestmentFund.fundCustodian.label', default: 'Fund Custodian')}" />
					
						<g:sortableColumn property="agencyFund" title="${message(code: 'brokerInvestmentFund.agencyFund.label', default: 'Agency Fund')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerInvestmentFundInstanceList}" status="i" var="brokerInvestmentFundInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerInvestmentFundInstance.id}">${fieldValue(bean: brokerInvestmentFundInstance, field: "fundName")}</g:link></td>
					
						<td>${fieldValue(bean: brokerInvestmentFundInstance, field: "startingDate")}</td>
					
						<td>${fieldValue(bean: brokerInvestmentFundInstance, field: "typeAndScale")}</td>
					
						<td>${fieldValue(bean: brokerInvestmentFundInstance, field: "fundManager")}</td>
					
						<td>${fieldValue(bean: brokerInvestmentFundInstance, field: "fundCustodian")}</td>
					
						<td>${fieldValue(bean: brokerInvestmentFundInstance, field: "agencyFund")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerInvestmentFundInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
