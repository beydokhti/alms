
<%@ page import="alms.BrokerTradingStation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-brokerTradingStation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-brokerTradingStation" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list brokerTradingStation">
			
				<g:if test="${brokerTradingStationInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="brokerTradingStation.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${brokerTradingStationInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerTradingStationInstance?.stationType}">
				<li class="fieldcontain">
					<span id="stationType-label" class="property-label"><g:message code="brokerTradingStation.stationType.label" default="Station Type" /></span>
					
						<span class="property-value" aria-labelledby="stationType-label"><g:fieldValue bean="${brokerTradingStationInstance}" field="stationType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerTradingStationInstance?.activities}">
				<li class="fieldcontain">
					<span id="activities-label" class="property-label"><g:message code="brokerTradingStation.activities.label" default="Activities" /></span>
					
						<span class="property-value" aria-labelledby="activities-label"><g:fieldValue bean="${brokerTradingStationInstance}" field="activities"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerTradingStationInstance?.trader}">
				<li class="fieldcontain">
					<span id="trader-label" class="property-label"><g:message code="brokerTradingStation.trader.label" default="Trader" /></span>
					
						<span class="property-value" aria-labelledby="trader-label"><g:fieldValue bean="${brokerTradingStationInstance}" field="trader"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerTradingStationInstance?.phone}">
				<li class="fieldcontain">
					<span id="phone-label" class="property-label"><g:message code="brokerTradingStation.phone.label" default="Phone" /></span>
					
						<span class="property-value" aria-labelledby="phone-label"><g:fieldValue bean="${brokerTradingStationInstance}" field="phone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerTradingStationInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="brokerTradingStation.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${brokerTradingStationInstance}" field="address"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${brokerTradingStationInstance?.id}" />
					<g:link class="edit" action="edit" id="${brokerTradingStationInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
