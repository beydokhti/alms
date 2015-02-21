<%@ page import="alms.BrokerLicense" %>



<div class="fieldcontain ${hasErrors(bean: brokerLicenseInstance, field: 'displayOrder', 'error')} required">
	<label for="displayOrder">
		<g:message code="brokerLicense.displayOrder.label" default="Display Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="displayOrder" type="number" value="${brokerLicenseInstance.displayOrder}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerLicenseInstance, field: 'title1', 'error')} ">
	<label for="title1">
		<g:message code="brokerLicense.title1.label" default="Title1" />
		
	</label>
	<g:textField name="title1" value="${brokerLicenseInstance?.title1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerLicenseInstance, field: 'title2', 'error')} ">
	<label for="title2">
		<g:message code="brokerLicense.title2.label" default="Title2" />
		
	</label>
	<g:textField name="title2" value="${brokerLicenseInstance?.title2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerLicenseInstance, field: 'hasLicense', 'error')} ">
	<label for="hasLicense">
		<g:message code="brokerLicense.hasLicense.label" default="Has License" />
		
	</label>
	<g:checkBox name="hasLicense" value="${brokerLicenseInstance?.hasLicense}" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerLicenseInstance, field: 'licenseNumber', 'error')} ">
	<label for="licenseNumber">
		<g:message code="brokerLicense.licenseNumber.label" default="License Number" />
		
	</label>
	<g:textField name="licenseNumber" value="${brokerLicenseInstance?.licenseNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: brokerLicenseInstance, field: 'licenseDate', 'error')} ">
	<label for="licenseDate">
		<g:message code="brokerLicense.licenseDate.label" default="License Date" />
		
	</label>
	<g:datePicker name="licenseDate" precision="day"  value="${brokerLicenseInstance?.licenseDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: brokerLicenseInstance, field: 'licenseExpiry', 'error')} ">
	<label for="licenseExpiry">
		<g:message code="brokerLicense.licenseExpiry.label" default="License Expiry" />
		
	</label>
	<g:datePicker name="licenseExpiry" precision="day"  value="${brokerLicenseInstance?.licenseExpiry}" default="none" noSelection="['': '']" />
</div>

