<%@ page import="alms.BrokerShareholder" %>



<div class="fieldcontain ${hasErrors(bean: brokerShareholderInstance, field: 'shareholderName', 'error')} ">
	<label for="shareholderName">
		<g:message code="brokerShareholder.shareholderName.label" default="Shareholder Name" />
		
	</label>
	<g:textField name="shareholderName" value="${brokerShareholderInstance?.shareholderName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerShareholderInstance, field: 'ownershipType', 'error')} ">
	<label for="ownershipType">
		<g:message code="brokerShareholder.ownershipType.label" default="Ownership Type" />
		
	</label>
	<g:select name="ownershipType" from="${brokerShareholderInstance.constraints.ownershipType.inList}" value="${brokerShareholderInstance?.ownershipType}" valueMessagePrefix="brokerShareholder.ownershipType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerShareholderInstance, field: 'ownershipPercent', 'error')} required">
	<label for="ownershipPercent">
		<g:message code="brokerShareholder.ownershipPercent.label" default="Ownership Percent" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ownershipPercent" type="number" value="${brokerShareholderInstance.ownershipPercent}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerShareholderInstance, field: 'sharesCount', 'error')} required">
	<label for="sharesCount">
		<g:message code="brokerShareholder.sharesCount.label" default="Shares Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sharesCount" type="number" value="${brokerShareholderInstance.sharesCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerShareholderInstance, field: 'representativeOnBoard', 'error')} ">
	<label for="representativeOnBoard">
		<g:message code="brokerShareholder.representativeOnBoard.label" default="Representative On Board" />
		
	</label>
	<g:textField name="representativeOnBoard" value="${brokerShareholderInstance?.representativeOnBoard}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerShareholderInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="brokerShareholder.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1024" value="${brokerShareholderInstance?.description}"/>
</div>

