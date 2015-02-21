
<%@ page import="alms.BrokerTradingStation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-brokerTradingStation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-brokerTradingStation" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="city" title="${message(code: 'brokerTradingStation.city.label', default: 'City')}" />
					
						<g:sortableColumn property="stationType" title="${message(code: 'brokerTradingStation.stationType.label', default: 'Station Type')}" />
					
						<g:sortableColumn property="activities" title="${message(code: 'brokerTradingStation.activities.label', default: 'Activities')}" />
					
						<g:sortableColumn property="trader" title="${message(code: 'brokerTradingStation.trader.label', default: 'Trader')}" />
					
						<g:sortableColumn property="phone" title="${message(code: 'brokerTradingStation.phone.label', default: 'Phone')}" />
					
						<g:sortableColumn property="address" title="${message(code: 'brokerTradingStation.address.label', default: 'Address')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${brokerTradingStationInstanceList}" status="i" var="brokerTradingStationInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${brokerTradingStationInstance.id}">${fieldValue(bean: brokerTradingStationInstance, field: "city")}</g:link></td>
					
						<td>${fieldValue(bean: brokerTradingStationInstance, field: "stationType")}</td>
					
						<td>${fieldValue(bean: brokerTradingStationInstance, field: "activities")}</td>
					
						<td>${fieldValue(bean: brokerTradingStationInstance, field: "trader")}</td>
					
						<td>${fieldValue(bean: brokerTradingStationInstance, field: "phone")}</td>
					
						<td>${fieldValue(bean: brokerTradingStationInstance, field: "address")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${brokerTradingStationInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
