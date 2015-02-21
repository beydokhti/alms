<%@ page import="alms.BrokerInvestmentFund" %>



<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'fundName', 'error')} ">
	<label for="fundName">
		<g:message code="brokerInvestmentFund.fundName.label" default="Fund Name" />
		
	</label>
	<g:textField name="fundName" value="${brokerInvestmentFundInstance?.fundName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'startingDate', 'error')} ">
	<label for="startingDate">
		<g:message code="brokerInvestmentFund.startingDate.label" default="Starting Date" />
		
	</label>
	<g:textField name="startingDate" value="${brokerInvestmentFundInstance?.startingDate}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'typeAndScale', 'error')} ">
	<label for="typeAndScale">
		<g:message code="brokerInvestmentFund.typeAndScale.label" default="Type And Scale" />
		
	</label>
	<g:textField name="typeAndScale" value="${brokerInvestmentFundInstance?.typeAndScale}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'fundManager', 'error')} ">
	<label for="fundManager">
		<g:message code="brokerInvestmentFund.fundManager.label" default="Fund Manager" />
		
	</label>
	<g:textField name="fundManager" value="${brokerInvestmentFundInstance?.fundManager}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'fundCustodian', 'error')} ">
	<label for="fundCustodian">
		<g:message code="brokerInvestmentFund.fundCustodian.label" default="Fund Custodian" />
		
	</label>
	<g:textField name="fundCustodian" value="${brokerInvestmentFundInstance?.fundCustodian}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'agencyFund', 'error')} ">
	<label for="agencyFund">
		<g:message code="brokerInvestmentFund.agencyFund.label" default="Agency Fund" />
		
	</label>
	<g:textField name="agencyFund" value="${brokerInvestmentFundInstance?.agencyFund}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'fundRegisterManager', 'error')} ">
	<label for="fundRegisterManager">
		<g:message code="brokerInvestmentFund.fundRegisterManager.label" default="Fund Register Manager" />
		
	</label>
	<g:textField name="fundRegisterManager" value="${brokerInvestmentFundInstance?.fundRegisterManager}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'liquidityGuaranteeFund', 'error')} ">
	<label for="liquidityGuaranteeFund">
		<g:message code="brokerInvestmentFund.liquidityGuaranteeFund.label" default="Liquidity Guarantee Fund" />
		
	</label>
	<g:textField name="liquidityGuaranteeFund" value="${brokerInvestmentFundInstance?.liquidityGuaranteeFund}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerInvestmentFundInstance, field: 'investmentManager', 'error')} ">
	<label for="investmentManager">
		<g:message code="brokerInvestmentFund.investmentManager.label" default="Investment Manager" />
		
	</label>
	<g:textField name="investmentManager" value="${brokerInvestmentFundInstance?.investmentManager}"/>
</div>

