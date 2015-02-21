<%@ page import="alms.BrokerSoftware" %>



<div class="fieldcontain ${hasErrors(bean: brokerSoftwareInstance, field: 'title1', 'error')} ">
	<label for="title1">
		<g:message code="brokerSoftware.title1.label" default="Title1" />
		
	</label>
	<g:textField name="title1" value="${brokerSoftwareInstance?.title1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerSoftwareInstance, field: 'title2', 'error')} ">
	<label for="title2">
		<g:message code="brokerSoftware.title2.label" default="Title2" />
		
	</label>
	<g:textField name="title2" value="${brokerSoftwareInstance?.title2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerSoftwareInstance, field: 'companyName', 'error')} ">
	<label for="companyName">
		<g:message code="brokerSoftware.companyName.label" default="Company Name" />
		
	</label>
	<g:textField name="companyName" value="${brokerSoftwareInstance?.companyName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerSoftwareInstance, field: 'contractType', 'error')} ">
	<label for="contractType">
		<g:message code="brokerSoftware.contractType.label" default="Contract Type" />
		
	</label>
	<g:select name="contractType" from="${brokerSoftwareInstance.constraints.contractType.inList}" value="${brokerSoftwareInstance?.contractType}" valueMessagePrefix="brokerSoftware.contractType" noSelection="['': '']"/>
</div>

