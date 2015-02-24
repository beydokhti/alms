
<%@ page import="alms.BrokerInvestmentFund" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund')}" />
	</head>
	<body>
		<div id="show-brokerInvestmentFund" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list brokerInvestmentFund">
			
				<g:if test="${brokerInvestmentFundInstance?.fundName}">
				<li class="fieldcontain">
					<span id="fundName-label" class="property-label"><g:message code="brokerInvestmentFund.fundName.label" default="Fund Name" /></span>
					
						<span class="property-value" aria-labelledby="fundName-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="fundName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.startingDate}">
				<li class="fieldcontain">
					<span id="startingDate-label" class="property-label"><g:message code="brokerInvestmentFund.startingDate.label" default="Starting Date" /></span>
					
						<span class="property-value" aria-labelledby="startingDate-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="startingDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.typeAndScale}">
				<li class="fieldcontain">
					<span id="typeAndScale-label" class="property-label"><g:message code="brokerInvestmentFund.typeAndScale.label" default="Type And Scale" /></span>
					
						<span class="property-value" aria-labelledby="typeAndScale-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="typeAndScale"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.fundManager}">
				<li class="fieldcontain">
					<span id="fundManager-label" class="property-label"><g:message code="brokerInvestmentFund.fundManager.label" default="Fund Manager" /></span>
					
						<span class="property-value" aria-labelledby="fundManager-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="fundManager"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.fundCustodian}">
				<li class="fieldcontain">
					<span id="fundCustodian-label" class="property-label"><g:message code="brokerInvestmentFund.fundCustodian.label" default="Fund Custodian" /></span>
					
						<span class="property-value" aria-labelledby="fundCustodian-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="fundCustodian"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.agencyFund}">
				<li class="fieldcontain">
					<span id="agencyFund-label" class="property-label"><g:message code="brokerInvestmentFund.agencyFund.label" default="Agency Fund" /></span>
					
						<span class="property-value" aria-labelledby="agencyFund-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="agencyFund"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.fundRegisterManager}">
				<li class="fieldcontain">
					<span id="fundRegisterManager-label" class="property-label"><g:message code="brokerInvestmentFund.fundRegisterManager.label" default="Fund Register Manager" /></span>
					
						<span class="property-value" aria-labelledby="fundRegisterManager-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="fundRegisterManager"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.liquidityGuaranteeFund}">
				<li class="fieldcontain">
					<span id="liquidityGuaranteeFund-label" class="property-label"><g:message code="brokerInvestmentFund.liquidityGuaranteeFund.label" default="Liquidity Guarantee Fund" /></span>
					
						<span class="property-value" aria-labelledby="liquidityGuaranteeFund-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="liquidityGuaranteeFund"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${brokerInvestmentFundInstance?.investmentManager}">
				<li class="fieldcontain">
					<span id="investmentManager-label" class="property-label"><g:message code="brokerInvestmentFund.investmentManager.label" default="Investment Manager" /></span>
					
						<span class="property-value" aria-labelledby="investmentManager-label"><g:fieldValue bean="${brokerInvestmentFundInstance}" field="investmentManager"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${brokerInvestmentFundInstance?.id}" />
					<g:link class="edit" action="edit" id="${brokerInvestmentFundInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
