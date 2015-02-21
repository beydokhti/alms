<%@ page import="alms.BrokerPortfolio" %>



<div class="fieldcontain ${hasErrors(bean: brokerPortfolioInstance, field: 'countOfContract', 'error')} ">
	<label for="countOfContract">
		<g:message code="brokerPortfolio.countOfContract.label" default="Count Of Contract" />
		
	</label>
	<g:textField name="countOfContract" value="${brokerPortfolioInstance?.countOfContract}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerPortfolioInstance, field: 'sumOfContract', 'error')} required">
	<label for="sumOfContract">
		<g:message code="brokerPortfolio.sumOfContract.label" default="Sum Of Contract" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sumOfContract" type="number" value="${brokerPortfolioInstance.sumOfContract}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerPortfolioInstance, field: 'countOfConsultantContract', 'error')} required">
	<label for="countOfConsultantContract">
		<g:message code="brokerPortfolio.countOfConsultantContract.label" default="Count Of Consultant Contract" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="countOfConsultantContract" type="number" value="${brokerPortfolioInstance.countOfConsultantContract}" required=""/>
</div>

