<%@ page import="alms.BrokerBranch" %>



<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="brokerBranch.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="city" name="city.id" from="${alms.City.list()}" optionKey="id" required="" value="${brokerBranchInstance?.city?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'branchType', 'error')} ">
	<label for="branchType">
		<g:message code="brokerBranch.branchType.label" default="Branch Type" />
		
	</label>
	<g:select name="branchType" from="${brokerBranchInstance.constraints.branchType.inList}" value="${brokerBranchInstance?.branchType}" valueMessagePrefix="brokerBranch.branchType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'representativePerson', 'error')} ">
	<label for="representativePerson">
		<g:message code="brokerBranch.representativePerson.label" default="Representative Person" />
		
	</label>
	<g:textField name="representativePerson" value="${brokerBranchInstance?.representativePerson}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'personnelCount', 'error')} required">
	<label for="personnelCount">
		<g:message code="brokerBranch.personnelCount.label" default="Personnel Count" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="personnelCount" type="number" value="${brokerBranchInstance.personnelCount}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'tseStock', 'error')} ">
	<label for="tseStock">
		<g:message code="brokerBranch.tseStock.label" default="Tse Stock" />
		
	</label>
	<g:checkBox name="tseStock" value="${brokerBranchInstance?.tseStock}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'imeStock', 'error')} ">
	<label for="imeStock">
		<g:message code="brokerBranch.imeStock.label" default="Ime Stock" />
		
	</label>
	<g:checkBox name="imeStock" value="${brokerBranchInstance?.imeStock}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'energyStock', 'error')} ">
	<label for="energyStock">
		<g:message code="brokerBranch.energyStock.label" default="Energy Stock" />
		
	</label>
	<g:checkBox name="energyStock" value="${brokerBranchInstance?.energyStock}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'imeFuture', 'error')} ">
	<label for="imeFuture">
		<g:message code="brokerBranch.imeFuture.label" default="Ime Future" />
		
	</label>
	<g:checkBox name="imeFuture" value="${brokerBranchInstance?.imeFuture}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'tseFuture', 'error')} ">
	<label for="tseFuture">
		<g:message code="brokerBranch.tseFuture.label" default="Tse Future" />
		
	</label>
	<g:checkBox name="tseFuture" value="${brokerBranchInstance?.tseFuture}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'mutualFundAdmin', 'error')} ">
	<label for="mutualFundAdmin">
		<g:message code="brokerBranch.mutualFundAdmin.label" default="Mutual Fund Admin" />
		
	</label>
	<g:checkBox name="mutualFundAdmin" value="${brokerBranchInstance?.mutualFundAdmin}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="brokerBranch.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${alms.Address.list()}" optionKey="id" required="" value="${brokerBranchInstance?.address?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerBranchInstance, field: 'phones', 'error')} ">
	<label for="phones">
		<g:message code="brokerBranch.phones.label" default="Phones" />
		
	</label>
	
</div>

